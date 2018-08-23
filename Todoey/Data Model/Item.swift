//
//  Item.swift
//  Todoey
//
//  Created by Holger Ferrero on 22/08/2018.
//  Copyright © 2018 Holger Ferrero. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
//    Stabilisce la relazione inversa Items -> Category
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
