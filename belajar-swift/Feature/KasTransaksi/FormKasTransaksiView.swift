//
//  FormKasTransaksiView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 09/01/25.
//

import SwiftUI

struct FormKasTransaksiView: View {
    @State private var inputTransaksi = ""
    @State private var inputKeterangan = ""
    @State private var selectedKategori = ""
    @State private var selectedMetodePembayaran = ""
    @State private var tgl: Date = Date()
    let sampelKategori = ["Operasional","Kegiatan","Perbaikan","Lainnya"]
    let sampelMetodePembayaran = ["Tunai","Non Tunai"]
    var body: some View {
        VStack{
            Form{
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
                
                HStack {
                    Text("Kategori Pengeluaran")
                    Spacer()
                    Picker("", selection: $selectedKategori) {
                        ForEach(sampelKategori, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.automatic)
                }
                
                HStack {
                    Text("Metode Pembayaran")
                    Spacer()
                    Picker("", selection: $selectedMetodePembayaran) {
                        ForEach(sampelMetodePembayaran, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.automatic)
                }
                
                TextField("Keterangan",text:$inputKeterangan)
                
                Button(action:{}){
                    HStack {
                        Text("Lampiran")
                        Spacer()
                        Image(systemName: "paperclip")
                    }
                }
                
                
                HStack(alignment:.top){
                    Image(systemName: "info.circle")
                        .foregroundColor(Color(.colorBlue))
                    Text("Lampiran dapat berupa file berformat JPG, JPEG, PNG, atau PDF dengan ukuran maksimal 1,5MB")
                        .foregroundColor(Color(.colorBlue))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.colorLightBlue))
                )
                
                
            }
        }
        .toolbar{
            ToolbarItem(placement : .topBarTrailing){
                Button("Simpan"){
                    
                }
            }
        }
        .navigationTitle("Tambah Transaksi Keluar")
        .navigationBarTitleDisplayMode(.inline)
        
       
    }
}

#Preview {
    FormKasTransaksiView()
}
