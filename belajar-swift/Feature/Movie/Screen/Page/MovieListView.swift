//
//  MovieListView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 12/12/24.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    
    @Query(sort: [SortDescriptor<Movie>(\.title, order: .forward)])
    private var movies: [Movie]

    @State private var isAddItem = false
    
    var body: some View {
        List(movies) { movie in
            Text(movie.title)
        }
        .sheet(isPresented: $isAddItem){
            NavigationStack{
                AddMovieView()
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button("Add Item"){
                    isAddItem = true
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}
