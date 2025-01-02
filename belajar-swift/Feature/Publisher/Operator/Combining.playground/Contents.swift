import UIKit
import Combine

// CombineLatest

let publisher1 = CurrentValueSubject<Int,Never>(1)
let publisher2 = CurrentValueSubject<String,Never>("Hellow")

let combinedPublisher = publisher1.combineLatest(publisher2)

let combineLatestCancellable = combinedPublisher.sink { value1, value2 in

    print("value 1:  \(value1), value 2 : \(value2)")
}

publisher1.send(3)
publisher2.send("Word")


//zip

let zip1 = [1,2,3,4].publisher
let zip2 = ["A","B","C","D","E"].publisher
let zip3 = ["Bum","BIM","BOM"].publisher

let zippedPublsisher = Publishers.Zip3(zip1, zip2, zip3)

let zipCancellable = zippedPublsisher.sink { value in
    print("\(value.0) dan \(value.1) dan \(value.2)")
}

/**
 Cara Kerja Zip
 Operator Zip hanya menerbitkan nilai ketika semua publisher memiliki nilai yang siap untuk digabungkan.
 Jika salah satu publisher selesai menerbitkan nilai (dengan jumlah elemen lebih sedikit), Zip akan berhenti bekerja, karena tidak bisa lagi membuat kombinasi lengkap.
 */


//switchToLatest

let outerPublisher = PassthroughSubject<AnyPublisher<Int,Never>,Never>()
let innerPublisher1 = CurrentValueSubject<Int, Never>(1)
let innerPublisher2 = CurrentValueSubject<Int, Never>(2)

let cancellableSwitch = outerPublisher
    .switchToLatest()
    .sink { value in
        print(value)
    }

outerPublisher.send(AnyPublisher(innerPublisher1))
innerPublisher1.send(10)

outerPublisher.send(AnyPublisher(innerPublisher2))
innerPublisher2.send(20)

innerPublisher1.send(100)
