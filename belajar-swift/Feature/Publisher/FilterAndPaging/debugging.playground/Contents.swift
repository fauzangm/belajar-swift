import UIKit
import Combine


let publisher = [1,2,3].publisher


let _ = publisher
    .handleEvents { _ in
        print("Subscription received")
    } receiveOutput: { value in
        print("receiveOutput")
        print(value)
    } receiveCompletion: { completion in
        print("receiveCompletion")
    } receiveCancel: {
        print("receiveCancel")
    } receiveRequest: { _ in
        print("receiveRequest")
    }
    .map { $0 * 3 }
    .sink { value in
        print("sink")
        print(value)
    }



/*
let cancellable = publisher
    .map { $0 * 3 }
    .filter { $0 % 2 == 0 }
    .print("Debug")
    .sink { value in
        print(value)
} */

