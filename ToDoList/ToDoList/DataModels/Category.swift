//
//  Category.swift
//  ToDoList
//
//  Created by Kevin Torres on 09/07/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
