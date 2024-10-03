//
//  ReminderVm.swift
//  belajar-swift
//
//  Created by Fauzan Ghozi Mubarak on 03/10/24.
//

import Foundation


import SwiftUI
import SwiftData

class ReminderVm: ObservableObject {
    @Environment(\.modelContext) private var context

    
    // Properties untuk insert dan update
    @Published var listName: String = ""
    @Published var color: Color = .blue
    

    // Fungsi untuk menghapus item
    func deleteItem(_ item: MyList) {
        context.delete(item)
        saveContext()
    }

    // Fungsi untuk menyisipkan reminder
    func insertReminder() {
        guard let hex = color.toHex() else { return }
        let myList = MyList(name: listName, colorCode: hex)
        context.insert(myList)
        saveContext()
    }

    // Fungsi untuk memperbarui reminder
    func updateReminder(_ item: MyList) {
        guard let hex = color.toHex() else { return }
        item.name = listName
        item.colorCode = hex
        saveContext()
    }

    // Fungsi untuk menyimpan konteks
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
