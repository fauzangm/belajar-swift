//
//  Todo.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 02/01/25.
//

import Foundation

struct Todo: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
