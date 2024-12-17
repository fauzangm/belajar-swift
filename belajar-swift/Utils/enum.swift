//
//  enum.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import Foundation

enum FilterOption {
    case title(String)
    case none
}



enum Sheet : Identifiable {
    case addMovie
    case addActor
    case showFilter
    
    var id : Int {
        hashValue
    }
}
