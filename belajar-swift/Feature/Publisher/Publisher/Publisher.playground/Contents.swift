import UIKit
import Combine

let publisher = Just(123)

let cancellable =  publisher.sink{ value in
    print(value)
}

cancellable.cancel()


let sampelDataForApi = [1,2,3,4,5,6,7]
let sampelPublishArray =  sampelDataForApi.publisher.map { $0 * 2}


let cancellableSampel = sampelPublishArray.sink{ value in
    print(value)
}
