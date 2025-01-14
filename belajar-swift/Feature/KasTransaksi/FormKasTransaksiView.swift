//
//  FormKasTransaksiView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 09/01/25.
//

import SwiftUI

struct FormKasTransaksiView: View {
    @State private var inputTransaksi = ""
    @State private var tgl: Date = Date()
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    TextField("Nominal Transaksi",text: $inputTransaksi)
                
                    HStack{
                        Text("Tanggal Transaksi")
                        Spacer()
                        DatePicker("", selection: $tgl,
                                   displayedComponents: [.date]
                        )
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    }
                    
//                    HStack {
//                        Text("Kategori Cuti")
//                        Spacer()
//                        Picker("", selection: $selectedKategori) {
//                            ForEach(sel.list) {
//                                Text($0.nama)
//                            }
//                        }
//                        .labelsHidden()
//                        .pickerStyle(.automatic)
//                    }

                  

                }
            }
            .navigationTitle("Tambah Transaksi Keluar")
            .navigationBarTitleDisplayMode(.inline)
        }
       
    }
}

#Preview {
    FormKasTransaksiView()
}
