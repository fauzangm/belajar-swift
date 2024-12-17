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
    
    private func deleteActor(indexSet: IndexSet) {
          indexSet.forEach { index in
              let actor = actors[index] // Aktor yang akan dihapus
              
              // Menghapus referensi actor dari semua movie yang memiliki actor ini
              actor.movies.forEach { movie in
                  if let actorIndex = movie.actors.firstIndex(of: actor) {
                      movie.actors.remove(at: actorIndex)
                  }
              }
              
              // Menghapus actor dari model context
              context.delete(actor)
           
              // Menyimpan perubahan ke model context
              do {
                  try context.save()
              } catch {
                  print("Error saving context: \(error.localizedDescription)")
              }
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
