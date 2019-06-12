//
//  Search.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 12/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import Foundation

struct Search: Codable {
    var status: String
    var copyright: String
    var response: NewsResponse
}

extension Search {
    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case response
    }
}
