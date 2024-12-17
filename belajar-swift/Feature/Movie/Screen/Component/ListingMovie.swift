//
//  ListingMovie.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI

struct ListingMovie: View {
    let movies: [Movie]
    @Binding var navigationPath: NavigationPath
    @Environment(\.modelContext) private var context
    
    private func deleteMovie(indexSet: IndexSet) {
        
        indexSet.forEach { index in
            let movie = movies[index]
            context.delete(movie)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    var body: some View {
    
        List {
            ForEach(movies) { movie in
                HStack {
                    Text(movie.title)
                    Spacer()
                    Text(movie.year.description)
                }
                .onTapGesture {
                    navigationPath.append(Screen.movieDetailScreen(movie))
                }
                
            }.onDelete(perform: deleteMovie)
        }
    }
}

//#Preview {
//    ListingMovie()
//}
