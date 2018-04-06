//
//  Item.swift
//  Todoey
//
//  Created by MBP 2014 Technopartner on 06/04/18.
//  Copyright © 2018 MBP 2014 Technopartner. All rights reserved.
//

import Foundation
class Item: Encodable, Decodable {
    var title: String = ""
    var done: Bool = false
}
