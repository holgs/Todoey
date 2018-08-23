//
//  Category.swift
//  Todoey
//
//  Created by Holger Ferrero on 22/08/2018.
//  Copyright © 2018 Holger Ferrero. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
//    stabilisce la relazione Category -> Items
    let items = List<Item>()
}
