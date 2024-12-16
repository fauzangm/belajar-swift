//
//  AddReviewScreen.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 16/12/24.
//

import SwiftUI
import SwiftData

struct AddReviewScreen: View {
    
    let movie : Movie
    @State private var subject : String = ""
    @State private var desc : String = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    private var isFormValid : Bool {
        !subject.isEmptyOrWhiteSpace && !desc.isEmptyOrWhiteSpace
    }
    
    var body: some View {
        Form{
            TextField("Subject", text : $subject)
            TextField("Body", text : $desc)
        }.navigationTitle("Add Review")
            .toolbar {
                ToolbarItem(placement : .topBarLeading){
                    Button("Close"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement : .topBarTrailing) {
                    Button("Save") {
                        let review = Review(subject: subject, body: desc)
                        review.movie = movie
                        context.insert(review)
                        
                        do {
                            try context.save()
                            movie.reviews.append(review)
                            dismiss()
                        } catch {
                            print(error.localizedDescription.precomposedStringWithCanonicalMapping)
                        }
                    }.disabled(!isFormValid)
                }
            }
    }
}

//#Preview {
//    AddReviewScreen()
//}
