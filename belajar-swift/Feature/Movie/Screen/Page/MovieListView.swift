//
//  MovieListView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 12/12/24.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    @Binding var navigationPath: NavigationPath
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @State private var isAddMoviePresented: Bool = false
    
    var body: some View {
        BodyListingView(movies: movies,navigationPath : $navigationPath)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Movie") {
                        isAddMoviePresented = true
                    }
                }
            })
            .sheet(isPresented: $isAddMoviePresented, content: {
                NavigationStack {
                    AddMovieView()
                }
            })
    }
}


#Preview {
    @Previewable @State var previewNavigationPath = NavigationPath()
    MovieListView(navigationPath: $previewNavigationPath)
}


struct BodyListingView: View {
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
