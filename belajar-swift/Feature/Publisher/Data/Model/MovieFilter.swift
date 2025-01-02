//
//  MovieFilter.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 02/01/25.
//

import Foundation

struct MovieFilter: Decodable {
    let Title: String
    let Year: String
    let imdbID: String
    let Poster: String
}

struct MovieResponse: Decodable {
    let Search: [MovieFilter]
    let totalResults: String
    let Response: String
}
