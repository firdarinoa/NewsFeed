//
//  NewsResponse.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 12/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    var docs: [NewsDocs]
}

extension NewsResponse {
    enum CodingKeys: String, CodingKey {
        case docs
    }
}
