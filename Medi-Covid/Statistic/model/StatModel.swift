//
//  StatModel.swift
//  Medi-Covid
//
//  Created by Nawin Phunsawat on 19/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import Foundation

struct StatModel: Decodable {
    var title: String?
    var last_updated: String?
    var entries: [Entry]?
}

struct Entry: Decodable {
    var country: String?
    var cases: String?
    var deaths: String?
    var recovered: String?
    var lastupdated: String?
}
