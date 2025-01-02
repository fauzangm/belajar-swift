//
//  NewsVm.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 02/01/25.
//

import Foundation
import Combine


// ViewModel to manage publishers
class NewsViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let categoryPublisher = PassthroughSubject<NewsCategory, Never>()
    
    @Published var todos: [Todo] = []
    @Published var articles: [String] = []
    @Published var errorMessage: String? // Tambahkan untuk error handling
    
    init() {
        setupBindings()
    }
    
    func setCategory(_ category: NewsCategory) {
        categoryPublisher.send(category)
    }
    
    private func setupBindings() {
        let technologyPublisher = Just(["Tech Article 1", "Tech Article 2", "Tech Article 3"])
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        let sportsPublisher = Just(["Sports News 1", "Sports News 2"])
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        let entertainmentPublisher = Just(["Entertainment News 1", "Entertainment News 2", "Entertainment News 3", "Entertainment News 4"])
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        categoryPublisher
            .map { category -> AnyPublisher<[String], Never> in
                switch category {
                case .technology:
                    return technologyPublisher
                case .sports:
                    return sportsPublisher
                case .entertainment:
                    return entertainmentPublisher
                }
            }
            .switchToLatest()
            .sink { [weak self] newArticles in
                self?.articles = newArticles
            }
            .store(in: &cancellables)
    }
    
    
    func fetchTodos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = "Error fetching todos: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] todos in
                self?.todos = todos
            })
            .store(in: &cancellables)
    }
}
