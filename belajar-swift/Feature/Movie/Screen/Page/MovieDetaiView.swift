//
//  MovieDetaiView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 16/12/24.
//

import SwiftUI

struct MovieDetaiView: View {
    @Binding var navigationPath: NavigationPath
    @Environment(\.modelContext) private var context
    let movie: Movie
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var year: Int?
    @State private var showReviewScreen = false
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            Button("Update") {
                guard let year = year else { return }
                
                movie.title = title
                movie.year = year
                
                do {
                    try context.save()
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
                
            }.buttonStyle(.borderless)
            
            Section("Reviews"){
                Button(action: {
                    showReviewScreen = true
                }, label: {
                    Image(systemName: "plus")
                        .frame(maxWidth : .infinity, alignment: .trailing)
                })
                
                if movie.reviews.isEmpty{
                    ContentUnavailableView{
                        Text("No Reviews")
                    }
                }else{
                    ListingReviewMovie(movie: movie)
                }
            }
            
            Section("Actors") {
                if movie.actors.isEmpty{
                    ContentUnavailableView{
                        Text("No actors available")
                    }
                }else{
                    List(movie.actors) { actor in
                        ActorCellView(actor: actor)
                    }
                }
              
            }
            
        }.onAppear {
            title = movie.title
            year = movie.year
        }
        .sheet(isPresented: $showReviewScreen, content: {
            NavigationStack{
                AddReviewScreen(movie: movie)
            }
        })
    }
}

struct MovieDetailContainerScreen: View {
    
    @Environment(\.modelContext) private var context
    @State private var movie: Movie?
    @State var previewNavigationPath = NavigationPath()
    var body: some View {
        ZStack {
            if let movie {
                MovieDetaiView(navigationPath: $previewNavigationPath, movie: movie)
            }
        }
        .onAppear {
            movie = Movie(title: "Spiderman", year: 2023)
            context.insert(movie!)
        }
    }
}

#Preview {
    MovieDetailContainerScreen()
        .modelContainer(for: [Movie.self])
}

