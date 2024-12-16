//
//  Movie.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 12/12/24.
//

import Foundation
import SwiftData

@Model
final class Movie {
//    @Attribute(.unique) var id : String //Jika Unik Variabel
    var title : String
    var year : Int
    
    init(title: String, year: Int) {
//        self.id = id
        self.title = title
        self.year = year
    }
}
