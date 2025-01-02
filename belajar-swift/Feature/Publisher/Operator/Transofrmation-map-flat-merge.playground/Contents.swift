import UIKit
import Combine

//Map
let numbersPublisher = (1...5).publisher

let squaredPublisher = numbersPublisher.map {_ in "A"}

let cancellable = squaredPublisher.sink{value in
    print(value)
}


// flatMap
let namePublisher = ["Johm","Mary","Steven"].publisher

let flattedNamePublisher = namePublisher.flatMap { name in
    name.publisher
}

let cancellableFlat = flattedNamePublisher.sink{ char in
    print(char)
}


// Merge
let publisher1 = [1,2,3].publisher
let publisher2 = [4,5,6].publisher
let publisher3 = [7,8,9].publisher

let mergePublisher = Publishers.Merge(publisher1,publisher2)

let cancellableMerge = mergePublisher.sink {value in
    print(value)
}
