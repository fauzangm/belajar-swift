//
//  SampelPublisherSearchView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 15/01/25.
//

import SwiftUI
import Combine

struct SampelPublisherSearchView: View {
    @StateObject private var viewModel = SearchViewModel() // Menghubungkan ViewModel ke View

     var body: some View {
         VStack {
             TextField("Search...", text: $viewModel.searchText)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()
             
             List(viewModel.searchResults, id: \.self) { result in
                 Text(result)
             }
         }
         .navigationTitle("Search Example")
     }
}

#Preview {
    SampelPublisherSearchView()
}
