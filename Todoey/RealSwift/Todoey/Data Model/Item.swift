//
//  Item.swift
//  Todoey
//
//  Created by Jaydip Goti on 10/02/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title:String=""
    @objc dynamic var done:Bool=false
    @objc dynamic var dateCreated  : Date?
    @objc dynamic var coloe:String = ""
    var parentCatagory = LinkingObjects(fromType: Category.self, property:"items" )
}
