//
//  ActorCellView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 17/12/24.
//

import SwiftUI

struct ActorCellView: View {
    let actor : ActorsMovie
    var body: some View {
        VStack (alignment : .leading){
            Text(actor.name)
            Text(actor.movies.map{$0.title}, format: .list(type: .and))
                .font(.caption)
        }
    }
}

//#Preview {
//    ActorCellView()
//}
