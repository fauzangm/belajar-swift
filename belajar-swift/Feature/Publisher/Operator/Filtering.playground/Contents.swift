import UIKit
import Combine

//filter

let numbersPublusher = (1...10).publisher

let evenNumberPublisher = numbersPublusher.filter { $0 % 2 == 0}

let filterCancellable = evenNumberPublisher.sink { value in
    
    print(value)
    
}


//Compact Map

let stringsPublisher = ["1","2","3","4","A"].publisher

let filterInt = stringsPublisher.compactMap {Int($0)}

let compactCancellabel = filterInt.sink { value in
    print(value)
}


// debounce

let textPublisher = PassthroughSubject<String, Never>()

let debouncePublisher = textPublisher.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)

let debounceCancellable = debouncePublisher.sink { value in
    print(value)
}


textPublisher.send("A")
textPublisher.send("B")
textPublisher.send("C")
textPublisher.send("D")
textPublisher.send("E")
textPublisher.send("F")

/** Alur Eksekusi Debounce
textPublisher.send("A") dipanggil, tapi dalam waktu kurang dari 0,5 detik, nilai baru (B, C, D, E, F) terus dikirim.
Debounce akan terus mereset timer setiap kali nilai baru diterima.
Akibatnya, hanya nilai terakhir, "F", yang akan diteruskan ke subscriber setelah 0,5 detik tanpa aktivitas baru.
 
 Manfaat
 Kode ini berguna untuk mengurangi frekuensi pemrosesan nilai. Contoh penggunaan umum:
 Search bar debounce: Hanya mengirim query ke server jika pengguna berhenti mengetik selama 0,5 detik.
 Event handling: Mencegah eksekusi terlalu sering pada event yang terjadi dengan cepat.
**/
