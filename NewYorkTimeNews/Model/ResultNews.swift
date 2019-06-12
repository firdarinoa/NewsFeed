//
//  ResultNews.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 12/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import Foundation

struct ResultNews: Codable {
    var title: String
    var abstract: String
}

extension ResultNews {
    enum CodingKeys: String,CodingKey {
        case title
        case abstract
    }
}
