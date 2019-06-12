//
//  DetailNewsViewController.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 12/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import UIKit

class DetailNewsViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
    var titleDetail: String?
    var descriptionDetail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = titleDetail
        labelDescription.text = descriptionDetail
    }
}
