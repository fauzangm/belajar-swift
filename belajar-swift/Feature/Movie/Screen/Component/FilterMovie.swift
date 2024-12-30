//
//  FilterMovie.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI


struct FilterMovie: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var movieTitle: String = ""
    @State private var numberOfReviews: Int?
    @State private var numberOfActors: Int?
    @State private var actorName: String = ""
    @Binding var filterOption: FilterOption
    @State private var genre: Genre = .action
    
    var body: some View {
        Form {
            Section("Filter by title") {
                TextField("Movie title", text: $movieTitle)
                Button("Search") {
                    if(movieTitle.isEmpty){
                        filterOption = .none
                    }else{
                        filterOption = .title(movieTitle)
                    }
                    dismiss()
                }
            }
            
            Section("Filter by number of reviews") {
                TextField("Number of reviews", value: $numberOfReviews, format: .number)
                    .keyboardType(.numberPad)
                Button("Search") {
                    if(numberOfReviews == nil){
                        filterOption = .none
                    }else{
                        filterOption = .reviewsCount(numberOfReviews ?? 1)
                    }
                  
                    dismiss()
                }
            }
            
            Section("Filter by number of actors") {
                TextField("Number of actors", value: $numberOfActors, format: .number)
                    .keyboardType(.numberPad)
                Button("Search") {
                    if(numberOfActors == nil){
                        filterOption = .none
                    }else{
                        filterOption = .actorsCount(numberOfActors ?? 1)
                    }
                    dismiss()
                }
            }
            
            Section("Filter by actor name") {
                TextField("Actor name", text: $actorName)
                Button("Search") {
                    if(actorName.isEmpty){
                        filterOption = .none
                    }else{
                        filterOption = .actorName(actorName)
                    }
                    dismiss()
                }
            }
            
            Section("Filter by genre") {
                
                Picker("Select a genre", selection: $genre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.title).tag(genre)
                    }
                }.onChange(of: genre) {
                    filterOption = .genre(genre)
                    dismiss()
                }
                
            }
        }
    }
}

#Preview {
    FilterMovie(filterOption: .constant(.title("Batman")))
}
