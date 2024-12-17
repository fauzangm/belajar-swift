//
//  MovieListView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 12/12/24.
//

import SwiftUI
import SwiftData

enum Sheet : Identifiable {
    case addMovie
    case addActor
    case showFilter
    
    var id : Int {
        hashValue
    }
}

struct MovieListView: View {
    
    @Environment(\.modelContext) private var context
    @Binding var navigationPath: NavigationPath
    
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    
    
    @Query(filter: #Predicate<Movie> { $0.year > 500 && $0.actors.count > 2 })
    private var movieFilter: [Movie]
    
    @State private var activeSheet : Sheet?
    @State private var actorName = ""
    
    private func saveActor(){
        let actor =  Actor(name: actorName)
        context.insert(actor)
        
    }
    var body: some View {
        VStack (alignment : .leading){
            Text("Movies")
                .font(.largeTitle)
            ListingMovie(movies: movieFilter,navigationPath : $navigationPath)
            
            Text("Actors")
                .font(.largeTitle)
            ListingActor(actors: actors, navigationPath: $navigationPath)
            
            
        }
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Actor") {
                    activeSheet = .addActor
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    activeSheet = .addMovie
                }
            }
            
        })
        
        .sheet(item: $activeSheet, content: { activeSheet in
            switch activeSheet {
            case .addMovie :
                NavigationStack {
                    AddMovieView()
                }
                
            case .addActor :
                Text("Add Actor")
                    .font(.largeTitle)
                
                TextField("Actor name", text: $actorName)
                    .textFieldStyle(.roundedBorder)
                    .presentationDetents([.fraction(0.25)])
                    .padding()
                
                Button("Save") {
                    self.activeSheet = nil
                    saveActor()
                }
                
            case .showFilter :
                Text("Show Filter")
                
            }
            
        })
        
    }
}


#Preview {
    @Previewable @State var previewNavigationPath = NavigationPath()
    MovieListView(navigationPath: $previewNavigationPath)
}

