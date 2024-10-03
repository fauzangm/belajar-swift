//
//  PreviewContainer.swift
//  belajar-swift
//
//  Created by Fauzan Ghozi Mubarak on 01/10/24.
//

import Foundation
import SwiftData

@MainActor
var previewContainer : ModelContainer = {
    
    let container = try! ModelContainer(for: MyList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
    
    for myList in SampelData.mylist{
        container.mainContext.insert(myList)
    }
    
}()


struct SampelData {
    static var mylist : [MyList] {
        return [MyList(name: "Reminders", colorCode: "#2ecc71"),MyList(name: "Backlog", colorCode: "#9b59b6")]
    }
}
