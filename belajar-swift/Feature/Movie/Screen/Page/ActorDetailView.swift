//
//  ActorDetailView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI

struct ActorDetailView: View {
    let actor : ActorsMovie
    @Environment(\.modelContext) private var context
    
    @State private var selectedMovie : Set<Movie> = []
    
    var body: some View {
        VStack{
            ListingMovieSelection(selectedMovie: $selectedMovie)
                .onAppear{
                    selectedMovie = Set(actor.movies)
                }
        }
        .onChange(of : selectedMovie, {
            actor.movies = Array(selectedMovie)
            context.insert(actor)
        })
        .navigationTitle(actor.name)
    }
}

#Preview {
    ActorDetailView(
        actor: ActorsMovie(name: "Fauzan")
    )
}
