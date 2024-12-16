//
//  MovieView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 12/12/24.
//

import SwiftUI
import Inject

struct AddMovieView: View {
    
    @ObserveInjection var Inject
    @State private var id : String = ""
    @State private var title : String = ""
    @State private var year : Int?
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    private var isFormValid : Bool {
        !title.isEmptyOrWhiteSpace && year != nil
    }
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    TextField("Title", text: $title)
                    TextField("Year", value: $year,format: .number)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement : .topBarLeading){
                Button ("Close"){
                    dismiss()
                }
            }
            
            ToolbarItem(placement : .topBarTrailing){
                Button ("Save"){
                    guard let year = year else {return}
                    let movie =  Movie(title: title, year: year)
                    context.insert(movie)
                    do{
                        try context.save()
                        dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }.disabled(!isFormValid)
            }
        }
        .navigationBarBackButtonHidden(true)
        .enableInjection()
     
      
    }
}

#Preview {
    NavigationStack{
        AddMovieView()
    }
}
