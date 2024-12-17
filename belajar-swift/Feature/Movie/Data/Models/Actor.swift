//
//  Actor.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 16/12/24.
//

import Foundation
import SwiftData

@Model
final class Actor {
    var name : String
    var movies : [Movie] = []
    init(name: String) {
        self.name = name
    }
}

