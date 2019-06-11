//
//  Item.swift
//  todoey3
//
//  Created by Rivaldo Ieong on 2019/6/11.
//  Copyright © 2019 Rivaldo Ieong. All rights reserved.
//

import Foundation

class Item: Encodable {
    var title:String = ""
    var done:Bool=false
    
    //    @objc dynamic var title: String = ""
    //    @objc dynamic var done: Bool = false
    //    @objc dynamic var dateCreated: Date?
    //    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
