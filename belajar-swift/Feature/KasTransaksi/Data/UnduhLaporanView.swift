//
//  UnduhLaporanView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 20/01/25.
//

import SwiftUI

struct UnduhLaporanView: View {
    @StateObject private var viewModel = KasTransaksiVM()
    let sampelKategori = ["Operasional", "Kegiatan", "Perbaikan", "Lainnya"]
    @State private var selectedMonth: String = ""
    @State private var selectedYear: String = ""
    
    // Daftar bulan dari Januari hingga Desember
    private let months = [
        "Januari", "Februari", "Maret", "April", "Mei", "Juni",
        "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ]
    @State private var selected = 1
    
    var body: some View {
        VStack{
            Form{
                // Picker untuk Bulan
                HStack {
                    Text("Bulan")
                    Spacer()
                    Picker("", selection: $selectedMonth) {
                        ForEach(months, id: \.self) { month in
                            Text(month).tag(month)
                        }
                    }
                    .onAppear {
                        // Atur default bulan saat ini
                        let currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
                        selectedMonth = months[currentMonthIndex]
                    }
                    .labelsHidden()
                    .pickerStyle(.automatic)
                }
                
                // Picker untuk Tahun
                HStack {
                    Text("Tahun")
                    Spacer()
                    Picker("", selection: $selectedYear) {
                        ForEach((2000...Calendar.current.component(.year, from: Date())).reversed(), id: \.self) { year in
                            Text("\(year)").tag(year)
                        }
                    }
                    .onAppear {
                        // Atur default tahun saat ini
                        selectedYear = "\(Calendar.current.component(.year, from: Date()))"
                    }
                    .labelsHidden()
                    .pickerStyle(.automatic)
                }
                
                
                HStack {
                    Text("Jenis Transaksi")
                    Spacer()
                    Picker("", selection: $viewModel.selectedMetodePembayaran) {
                        ForEach(sampelKategori, id: \.self) { item in
                            Text(item)
                        }
                    }
                    
                    .onAppear{
                        viewModel.selectedMetodePembayaran = sampelKategori.first ?? ""
                    }
                    .labelsHidden()
                    .pickerStyle(.automatic)
                }
                
                VStack (alignment:.leading){
                    
                    
                    Text("Format Laporan")
                    Picker(selection: $selected, label: Text("Favorite Color")) {
                        Text("PDF").tag(1)
                        Text("Excel").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            }
        }
        .navigationTitle("Unduh Laporan")
        .toolbar{
            ToolbarItem(placement:.topBarTrailing){
                Button("Unduh") {
                    // Tindakan simpan
                }
                .disabled(!viewModel.isFormValid)
            }
        }
        
    }
}

#Preview {
    UnduhLaporanView()
}
