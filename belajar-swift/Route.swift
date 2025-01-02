//
//  Route.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 16/12/24.
//

import Foundation
import SwiftUI

// Enum untuk mengidentifikasi screen
enum Screen: Hashable {
    case movieListScreen
    case movieDetailScreen(Movie)
    case actorDetailScreen(ActorsMovie)
    case publisherScreen
    case newsAppViewScreen
    case listingFilterScreen
}

struct RouteView: View {
    @State private var navigationPath = NavigationPath() // Path untuk mengelola navigasi
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            MyListScreen(navigationPath: $navigationPath)
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .movieListScreen:
                        MovieListView(navigationPath: $navigationPath)
                    case .movieDetailScreen(let movie):
                        MovieDetaiView(navigationPath: $navigationPath, movie: movie)
                    case .actorDetailScreen(let actor):
                        ActorDetailView(actor: actor)
                    case .publisherScreen:
                        PublisherView(navigationPath: $navigationPath)
                    case .newsAppViewScreen:
                        NewsAppView()
                    case .listingFilterScreen:
                        ListingFilterView()
                    }
                }
        }
    }
}



// Studi kasus navigation Kompleks
struct ScreensStudyCase5: View {
    @State private var navigationPath = NavigationPath() // Navigation Path untuk mengelola stack

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScreenA(navigationPath: $navigationPath)
                .navigationDestination(for: ScreensStudyCase5Enum.self) { screen in
                    switch screen {
                    case .screenB:
                        ScreenB(navigationPath: $navigationPath)
                    case .screenC:
                        ScreenC(navigationPath: $navigationPath)
                    case .screenD:
                        ScreenD(navigationPath: $navigationPath)
                    case .screenE:
                        ScreenE(navigationPath: $navigationPath)
                    }
                }
        }
    }
}

// Enum untuk mengidentifikasi layar
enum ScreensStudyCase5Enum: Hashable {
    case screenB
    case screenC
    case screenD
    case screenE
}

// Screen A
struct ScreenA: View {
    @Binding var navigationPath: NavigationPath

    var body: some View {
        VStack {
            Text("Screen A")
                .font(.largeTitle)
            Button("Go to Screen B") {
                navigationPath.append(ScreensStudyCase5Enum.screenB)
            }
            .padding()
        }
    }
}

// Screen B
struct ScreenB: View {
    @Binding var navigationPath: NavigationPath

    var body: some View {
        VStack {
            Text("Screen B")
                .font(.largeTitle)
            Button("Go to Screen C") {
                navigationPath.append(ScreensStudyCase5Enum.screenC)
            }
            .padding()
        }
    }
}

// Screen C
struct ScreenC: View {
    @Binding var navigationPath: NavigationPath

    var body: some View {
        VStack {
            Text("Screen C")
                .font(.largeTitle)
            Button("Go to Screen D") {
                navigationPath.append(ScreensStudyCase5Enum.screenD)
            }
            .padding()
        }
    }
}

// Screen D
struct ScreenD: View {
    @Binding var navigationPath: NavigationPath

    var body: some View {
        VStack {
            Text("Screen D")
                .font(.largeTitle)
            Button("Go to Screen E") {
                navigationPath.append(ScreensStudyCase5Enum.screenE)
            }
            .padding()
        }
    }
}

// Screen E
struct ScreenE: View {
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack {
            Text("Screen E")
                .font(.largeTitle)
            
            Button("Finish (Back to Root)") {
                navigationPath.removeLast(navigationPath.count) // Mengosongkan path untuk kembali ke root
            }
            .padding()
            
            Button("Remove D (Back to Screen C)") {
                navigationPath.removeLast(2) // Hapus layar terakhir (Screen D dan dan screen E)
            }
            .padding()
            
            Button("Remove D and C (Back to Screen B)") {
                navigationPath.removeLast(3) // H
            }
        }
    }
}
