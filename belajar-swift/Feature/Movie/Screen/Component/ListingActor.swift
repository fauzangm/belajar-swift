//
//  ListingActor.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI

struct ListingActor: View {
    let actors: [Actor]
    @Binding var navigationPath: NavigationPath
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = MovieVM()
    
    private func deleteActor(indexSet: IndexSet) {
        indexSet.forEach { index in
            let actor = actors[index]
            viewModel.deleteActor(actor)
        }
    }
    var body: some View {
        List {
            ForEach(actors) { actor in
                ActorCellView(actor: actor)
                    .onTapGesture {
                        navigationPath.append(Screen.actorDetailScreen(actor))
                    }
            }.onDelete(perform: deleteActor)
        }
    }
}

//#Preview {
//    ListingActor()
//}
