//
//  Catagory.swift
//  Todoey
//
//  Created by Jaydip Goti on 10/02/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Category: Object {
     
    @objc dynamic var name:String=""
    @objc dynamic var coloe:String = ""
    let items = List<Item>()
}
