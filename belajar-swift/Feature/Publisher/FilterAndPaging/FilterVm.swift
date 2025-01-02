//
//  FilterVm.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 02/01/25.
//

import Foundation
import Combine


class MovieViewModel: ObservableObject {
    @Published var movies: [MovieFilter] = []
    @Published var searchQuery: String = "batman"
    @Published var currentPage: Int = 1
    @Published var totalResults: Int = 0
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private let apiKey = "564727fa"
    private let baseURL = "https://www.omdbapi.com/"
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSearchHandler()
    }

    private func setupSearchHandler() {
        $searchQuery
            .debounce(for: .milliseconds(1500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.currentPage = 1
                self?.movies = []
                self?.fetchMovies()
            }
            .store(in: &cancellables)
    }

    func fetchMovies() {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        if searchQuery.isEmpty {
            searchQuery = "batman"
        }
        let urlString = "\(baseURL)?s=\(searchQuery)&page=\(currentPage)&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            self.isLoading = false
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = "Error fetching movies: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                if response.Response == "True" {
                    self.movies.append(contentsOf: response.Search)
                    self.totalResults = Int(response.totalResults) ?? 0
                } else {
                    self.errorMessage = "No results found"
                }
            })
            .store(in: &cancellables)
    }

    func loadNextPage() {
        guard !isLoading, movies.count < totalResults else { return }
        currentPage += 1
        fetchMovies()
    }
}
