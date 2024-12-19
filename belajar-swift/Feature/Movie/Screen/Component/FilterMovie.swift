//
//  FilterMovie.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI


struct FilterMovie: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var movieTitle: String = ""
    @Binding var filterOption: FilterOption
    
    var body: some View {
        Form {
            Section("Filter by title") {
                TextField("Movie title", text: $movieTitle)
                Button("Search") {
                    if movieTitle.isEmpty {
                        filterOption = .none
                    }else{
                        filterOption = .title(movieTitle)
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    FilterMovie(filterOption: .constant(.title("Batman")))
}
