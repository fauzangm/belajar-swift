//
//  ListingReviewMovie.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 16/12/24.
//

import SwiftUI

struct ListingReviewMovie: View {
    let movie : Movie
    
    @Environment(\.modelContext) private var context
    
    private func deletReview(indexSet: IndexSet) {
        
        indexSet.forEach { index in
            let review = movie.reviews[index]
            context.delete(review)
            do {
                movie.reviews.remove(at: index)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    var body: some View {
        List {
            ForEach(movie.reviews) { review in
                VStack(alignment : .leading){
                    Text(review.subject)
                    Text(review.body)
                }
            }.onDelete(perform: deletReview)
        }
    }
}

//#Preview {
//    ListingReviewMovie(reviews: [])
//}
