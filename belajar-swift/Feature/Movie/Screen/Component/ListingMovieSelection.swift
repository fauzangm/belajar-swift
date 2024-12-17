//
//  ListingMovieSelection.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI
import SwiftData

struct ListingMovieSelection: View {
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Binding var selectedMovie : Set<Movie>
    var body: some View {
        List(movies) { movie in
            HStack{
                Image(systemName: selectedMovie.contains(movie) ? "checkmark.square" : "square")
                    .onTapGesture {
                        if !selectedMovie.contains(movie){
                            selectedMovie.insert(movie)
                        }else{
                            selectedMovie.remove(movie)
                        }
                    }
                Text(movie.title)
            }
        }
    }
}

//#Preview {
//    ListingMovieSelection()
//}
