//
//  ListingMovie.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI
import SwiftData

struct ListingMovie: View {
    
    @Binding var navigationPath: NavigationPath
    @Query private var allMovies : [Movie]
    let filterOption : FilterOption
    
    private var movies: [Movie] {
        switch filterOption {
        case .title(let movieTitle):
            // Filter dilakukan di SwiftUI untuk case-insensitive
            return allMovies.filter { $0.title.lowercased().contains(movieTitle.lowercased()) }
        case .none:
            return allMovies
        }
    }
    
    init(navigationPath: Binding<NavigationPath>, filterOption: FilterOption = .none) {
        self._navigationPath = navigationPath
        self.filterOption = filterOption
    }
    
    
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
