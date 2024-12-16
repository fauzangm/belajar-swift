//
//  Review.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 16/12/24.
//

import Foundation
import SwiftData

@Model
final class Review {
    var subject : String
    var body : String
    var movie : Movie?
    
    init(subject: String, body: String) {
        self.subject = subject
        self.body = body
    }
}
