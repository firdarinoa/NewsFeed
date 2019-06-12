//
//  Constants.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 11/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import Foundation

struct Constants {
    static let apiKey = "b04cgKoddrGO8ZSMTGIseO1rbG34pP1N"
    static let apiNews = "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=\(apiKey)"
    static var nameSearch = ""
    static let apiSearch = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(nameSearch)&api-key=\(apiKey)"
}
