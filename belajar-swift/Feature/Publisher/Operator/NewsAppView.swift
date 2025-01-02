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
    @State private var showAlert = false // State untuk menampilkan alert
    
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
            
            TodoList()
        }
    }
    
}

extension NewsAppView {
    @ViewBuilder
    func ViewsList(selectedCategory: NewsCategory) -> some View {
        List(viewModel.articles, id: \.self) { article in
            Text(article)
        }
        .onChange(of: selectedCategory) {
            viewModel.setCategory(selectedCategory)
        }
    }
    
    func TodoList() -> some View {
        List(viewModel.todos) { todo in
            VStack(alignment: .leading) {
                Text(todo.title)
                    .font(.headline)
                Text("Completed: \(todo.completed ? "Yes" : "No")")
                    .font(.subheadline)
                    .foregroundColor(todo.completed ? .green : .red)
            }
        }
        .onAppear {
            viewModel.fetchTodos()
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



