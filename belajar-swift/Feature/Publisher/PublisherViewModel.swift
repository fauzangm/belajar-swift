//
//  PublisherViewModel.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 30/12/24.
//

import Foundation
import Combine

class PublisherViewModel : ObservableObject {
    
    @Published var value : Int = 0
    private var cancellable : AnyCancellable?
    
    init(){
        
        let publisher =  Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .map{
                _ in self.value + 1
            }
        cancellable = publisher.assign(to: \.value, on: self)
    }
}
