//
//  SearchViewController.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 12/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var query: String?
    var searchData: Search?
    var titleSearch: String?
    var descSearch: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSearchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "afterSearchSegue" {
            let vc = segue.destination as! DetailNewsViewController
            vc.titleDetail = titleSearch
            vc.descriptionDetail = descSearch
        }
    }
    
    func fetchSearchData() {
        Constants.nameSearch = query ?? ""
        guard let url = URL(string: Constants.apiSearch) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Search.self, from: data!)
                print(response)
                self.searchData = response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchData?.response.docs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        cell.textLabel?.text = self.searchData?.response.docs[indexPath.row].snippet
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.titleSearch = self.searchData?.response.docs[indexPath.row].snippet
        self.descSearch = self.searchData?.response.docs[indexPath.row].lead_paragraph
        performSegue(withIdentifier: "afterSearchSegue", sender: nil)
    }
}
