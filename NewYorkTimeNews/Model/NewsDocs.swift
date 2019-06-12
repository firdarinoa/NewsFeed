//
//  NewsDocs.swift
//  NewYorkTimeNews
//
//  Created by Firda Sahidi on 12/06/19.
//  Copyright © 2019 Firda Sahidi. All rights reserved.
//

import Foundation

struct NewsDocs: Codable {
    var snippet: String
    var lead_paragraph: String
}

extension NewsDocs {
    enum CodingKeys: String, CodingKey {
        case snippet
        case lead_paragraph
    }
}
