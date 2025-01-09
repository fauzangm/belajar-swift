//
//  KasTransaksiModel.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 03/01/25.
//

import Foundation
import SwiftData

struct KasTransaksiModel {
    var tanggal: String
    var detail: [DetailKasTransaksi] = []
}

struct DetailKasTransaksi {
    var tanggal : String
    var jenisTransaksi : String
    var desc : String
    var uang : String
}
