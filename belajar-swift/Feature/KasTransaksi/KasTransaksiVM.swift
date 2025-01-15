//
//  KasTransaksiVM.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 15/01/25.
//

import Combine
import SwiftUI

class KasTransaksiVM : ObservableObject {
    @Published var inputTransaksi = ""
    @Published var inputKeterangan = ""
    @Published var selectedKategori = ""
    @Published var selectedMetodePembayaran = ""
    @Published var tgl: Date = Date()
    private var cancellables = Set<AnyCancellable>()
    @Published var errorMessage: String = ""
    @Published var isFormValid: Bool = false
    
    init(){
        validateForm()
    }
    
    private func validateForm(){
        Publishers.CombineLatest4($inputTransaksi, $inputKeterangan, $selectedKategori, $selectedMetodePembayaran)
            .map { transaksi, keterangan, kategori, metode in
                if transaksi.isEmpty {
                    return ("Nominal transaksi harus diisi.", false)
                } else if Double(transaksi) == nil {
                    return ("Nominal transaksi harus berupa angka.", false)
                } else if kategori.isEmpty {
                    return ("Kategori harus dipilih.", false)
                } else if metode.isEmpty {
                    return ("Metode pembayaran harus dipilih.", false)
                } else if keterangan.isEmpty {
                    return ("Keterangan harus diisi.", false)
                }
                return ("", true)
            }
            .sink { [weak self] result in
                self?.errorMessage = result.0
                self?.isFormValid = result.1
            }
            .store(in: &cancellables)
    }
    
}
