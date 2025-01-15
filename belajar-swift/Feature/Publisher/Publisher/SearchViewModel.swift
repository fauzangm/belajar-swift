//
//  SearchViewModel.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 15/01/25.
//
import Combine
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchText: String = "" // Input pencarian dari pengguna
    @Published var searchResults: [String] = [] // Hasil pencarian

    private let sampleData: [String] = [
        "SwiftUI",
        "Combine",
        "Foundation",
        "UIKit",
        "CoreData",
        "AVFoundation",
        "CloudKit",
        "MapKit",
        "HealthKit",
        "ARKit"
    ]
    
    private var cancellable: AnyCancellable?

    init() {
        setupSearchPipeline()
    }
    
    private func setupSearchPipeline() {
        cancellable = $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main) // Debounce pencarian
            .removeDuplicates() // Hindari pencarian jika teks tidak berubah
            .sink { [weak self] query in
                self?.performSearch(for: query)
            }
    }
    
    private func performSearch(for query: String) {
        if query.isEmpty {
            searchResults = sampleData
        } else {
            searchResults = sampleData.filter { $0.localizedCaseInsensitiveContains(query) }
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}
