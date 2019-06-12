//
//  FavoriteTableViewCell.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 11/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import UIKit
import CoreData

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    
    var loved: Bool = true
    var favoriteNews: [FavoriteNews] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
