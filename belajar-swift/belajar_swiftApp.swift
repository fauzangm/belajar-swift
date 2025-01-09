//
//  belajar_swiftApp.swift
//  belajar-swift
//
//  Created by Fauzan Ghozi Mubarak on 01/10/24.
//

import SwiftUI
import SwiftData

@main
struct belajar_swiftApp: App {
    init() {
            handleModelChange()
        }
    
    var body: some Scene {
        WindowGroup {
            RouteView()
                .background(.black)
        }
        .modelContainer(for: [MyList.self, Movie.self,ActorsMovie.self,Review.self])
    }
    
    private func handleModelChange() {
         let currentModelVersion = "1.0.1" // Ganti sesuai versi model
         let savedModelVersion = UserDefaults.standard.string(forKey: "modelVersion")
         
         if savedModelVersion != currentModelVersion {
             do {
                 let container = try ModelContainer(for: Movie.self, MyList.self)
                 container.deleteAllData() // Hapus data lama
                 UserDefaults.standard.set(currentModelVersion, forKey: "modelVersion") // Simpan versi baru
                 print("Data cleared due to model change.")
             } catch {
                 print("Failed to clear data: \(error)")
             }
         } else {
             print("Model version unchanged. No data cleared.")
         }
     }
}
