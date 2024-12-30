//
//  MovieViewModel.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import Foundation
import SwiftUI
import SwiftData

class MovieVM : ObservableObject {
    @Environment(\.modelContext) private var context
    
    
    func deleteActor(_ actor: ActorsMovie) {
           // Menghapus referensi actor dari semua movie
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
