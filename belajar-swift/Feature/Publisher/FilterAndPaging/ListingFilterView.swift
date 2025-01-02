//
//  ListingFilterView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 02/01/25.
//

import SwiftUI

struct ListingFilterView: View {
    @StateObject private var viewModel = MovieViewModel()
    @State private var showAlert = false // State untuk menampilkan alert
       var body: some View {
           listingFilter()
       }
}

#Preview {
    ListingFilterView()
}

extension ListingFilterView {
    @ViewBuilder
    func listingFilter() -> some View {
        VStack {
            List {
                ForEach(viewModel.movies.indices, id: \.self) { index in
                    let movie = viewModel.movies[index]
                    
                    HStack {
                        AsyncImage(url: URL(string: movie.Poster)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 75)
                        .cornerRadius(5)
                        
                        VStack(alignment: .leading) {
                            Text(movie.Title)
                                .font(.headline)
                            Text(movie.Year)
                                .font(.subheadline)
                        }
                    }
                    .onAppear {
                        // Load next page when the user scrolls to the last item
                        if index == viewModel.movies.count - 1 && viewModel.movies.count < viewModel.totalResults {
                            viewModel.loadNextPage()
                        }
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Movies")
            .searchable(text: $viewModel.searchQuery)
        }
        .onAppear {
            viewModel.fetchMovies()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? "Unknown error"),
                dismissButton: .default(Text("OK"))
            )
        }
        .onChange(of: viewModel.errorMessage) {
            if viewModel.errorMessage != nil {
                showAlert = true
            }
        }
    }
}
