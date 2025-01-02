//
//  NewsAppView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 02/01/25.
//

import SwiftUI
import Combine

struct NewsAppView: View {
    @State private var selectedCategory: NewsCategory = .technology
    private let categories: [NewsCategory] = [.technology, .sports, .entertainment]
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        VStack {
            Picker("Select Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category.rawValue.capitalized).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            ViewsList(selectedCategory: selectedCategory)
        }
    }
    
}

extension NewsAppView {
    @ViewBuilder
    func ViewsList(selectedCategory: NewsCategory) -> some View {
        List(viewModel.articles, id: \.self) { article in
            Text(article)
        }
        .onChange(of: selectedCategory) { newCategory in
            viewModel.setCategory(newCategory)
        }
    }
}



