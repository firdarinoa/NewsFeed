//
//  News.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 12/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import Foundation

struct News: Codable {
    var status: String
    var section: String
    var results: [ResultNews]
}

extension News {
    enum CodingKeys: String, CodingKey {
        case status
        case section
        case results
    }
}
