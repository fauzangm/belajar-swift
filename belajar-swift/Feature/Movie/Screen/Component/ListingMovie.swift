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
    @Query private var movies : [Movie]
    let filterOption : FilterOption
    
     init(navigationPath: Binding<NavigationPath>, filterOption : FilterOption = .none) {
         self._navigationPath = navigationPath
         self.filterOption = filterOption
     
         switch self.filterOption {
         case .title(let movieTitle):
             _movies = Query(filter: #Predicate {$0.title.contains(movieTitle)})
         case .none:
             _movies = Query()
         }
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
