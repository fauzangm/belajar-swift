//
//  enum.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import Foundation

enum FilterOption {
    case title(String)
    case reviewsCount(Int)
    case actorsCount(Int)
    case actorName(String)
    case genre(Genre)
    case none
}

struct FilterSelectionConfig {
    var movieTitle: String = ""
    var numberOfReviews: Int?
    var numberOfActors: Int?
    var genre: Genre = .action
    var filter: FilterOption = .none
}


// Enum for Categories
enum NewsCategory: String, CaseIterable {
    case technology, sports, entertainment
}



enum Sheet : Identifiable {
    case addMovie
    case addActor
    case showFilter
    
    var id : Int {
        hashValue
    }
}
