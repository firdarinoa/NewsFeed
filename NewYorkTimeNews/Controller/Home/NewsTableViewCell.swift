//
//  NewsTableViewCell.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 11/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import UIKit
import CoreData

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var buttonFav: UIButton!
    
    var loved: Bool = false
    var favoriteNews: [FavoriteNews] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func didTapFav(_ sender: Any) {
        if loved == false {
            buttonFav.setImage(UIImage(named: "fav"), for: .normal)
            loved = true
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let favNews = FavoriteNews(context: context)
            favNews.titleFavorite = labelTitle.text!
            favNews.titleDesc = labelDescription.text!
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        } else {
            buttonFav.setImage(UIImage(named: "love"), for: .normal)
            loved = false
        }
    }
}
