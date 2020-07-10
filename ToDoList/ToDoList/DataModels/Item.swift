//
//  Item.swift
//  ToDoList
//
//  Created by Kevin Torres on 09/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
