//
//  String+Extensions.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 12/12/24.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace : Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
