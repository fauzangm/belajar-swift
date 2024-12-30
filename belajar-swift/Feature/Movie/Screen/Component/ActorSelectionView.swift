//
//  ActorSelectionView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI
import SwiftData

struct ActorSelectionView: View {

    @Query(sort: \ActorsMovie.name, order: .forward) private var actors: [ActorsMovie]
    @Binding var selectedActors : Set<ActorsMovie>
    var body: some View {
        List(actors) {actor in
            HStack {
                Image(systemName: selectedActors.contains(actor) ? "checkmark.square" : "square")
                    .onTapGesture {
                        if !selectedActors.contains(actor){
                            selectedActors.insert(actor)
                        }else{
                            selectedActors.remove(actor)
                        }
                    }
                Text(actor.name)
            }
            
        }
    }
}

//#Preview {
//    ActorSelectionView()
//}
