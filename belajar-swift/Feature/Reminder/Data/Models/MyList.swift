//
//  MyList.swift
//  belajar-swift
//
//  Created by Fauzan Ghozi Mubarak on 01/10/24.
//

import Foundation
import SwiftData

@Model
class MyList {
    var name : String
    var colorCode : String
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
    
}
