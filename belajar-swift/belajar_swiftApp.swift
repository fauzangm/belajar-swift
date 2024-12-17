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
    var body: some Scene {
        WindowGroup {
            RouteView()
                .background(.black)
        }
        .modelContainer(for: [MyList.self, Movie.self, Review.self, Actor.self])
    }
}
