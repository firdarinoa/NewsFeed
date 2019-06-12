//
//  HomeViewController.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 11/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import UIKit
import CoreData
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldSearch: UITextField!
    
    var news: News?
    var newsList: [ResultNews]?
    var homeTitle: String?
    var homeDesc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNewsData()
    }
    
    func fetchNewsData() {
        guard let url = URL(string: Constants.apiNews) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(News.self, from: data!)
                self.news = response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeSegue" {
            let vc = segue.destination as! DetailNewsViewController
            vc.titleDetail = homeTitle
            vc.descriptionDetail = homeDesc
        } else if segue.identifier == "searchSegue" {
            let vc = segue.destination as! SearchViewController
            vc.query = textFieldSearch.text
        }
    }
    
    @IBAction func didTapSearch(_ sender: Any) {
        if textFieldSearch.text == "" {
            let alert = UIAlertController(title: "Error", message: "Search field can't be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            performSegue(withIdentifier: "searchSegue", sender: nil)
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        cell.labelTitle.text = self.news?.results[indexPath.row].title
        cell.labelDescription.text = self.news?.results[indexPath.row].abstract
        cell.buttonFav.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.homeTitle = self.news?.results[indexPath.row].title
        self.homeDesc = self.news?.results[indexPath.row].abstract
        performSegue(withIdentifier: "homeSegue", sender: nil)
    }
}
