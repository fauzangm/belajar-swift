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
    
    var reviewsCount: Int {
        reviews.count
    }
    
    var actorsCount: Int {
        actors.count
    }
    
    @Relationship(inverse: \Review.movie)
    var reviews : [Review] = []
    
    @Relationship(inverse: \Actor.movies)
    var actors : [Actor] = []
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
    
}
