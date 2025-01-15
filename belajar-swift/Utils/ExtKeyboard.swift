//
//  ExtKeyboard.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 15/01/25.
//

import SwiftUI

// Menambahkan extension untuk menyembunyikan keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
