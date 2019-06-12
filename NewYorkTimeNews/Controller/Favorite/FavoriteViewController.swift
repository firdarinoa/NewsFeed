//
//  FavoriteViewController.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 11/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var favTitle: String?
    var favDesc: String?
    var favNews: [FavoriteNews] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func getData() {
        do {
            favNews = try context.fetch(FavoriteNews.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favSegue" {
            let vc = segue.destination as! DetailNewsViewController
            vc.titleDetail = favTitle
            vc.descriptionDetail = favDesc
        }
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavoriteTableViewCell
        cell.labelTitle.text = self.favNews[indexPath.row].titleFavorite
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        favTitle = self.favNews[indexPath.row].titleFavorite
        favDesc = self.favNews[indexPath.row].titleDesc
        performSegue(withIdentifier: "favSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let delNews = favNews[indexPath.row]
            context.delete(delNews)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                favNews = try context.fetch(FavoriteNews.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
            tableView.reloadData()
        }
    }
}
