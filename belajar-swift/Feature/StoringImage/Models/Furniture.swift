//
//  Furniture.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 14/01/25.
//

import Foundation
import SwiftData

@Model
class Furniture {
    
    var photo : Data?
    
    init(photo: Data? = nil) {
        self.photo = photo
    }
}
