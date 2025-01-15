//
//  FormKasTransaksiView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 09/01/25.
//

import SwiftUI

struct FormKasTransaksiView: View {
    @StateObject private var viewModel = KasTransaksiVM()
    let sampelKategori = ["Operasional", "Kegiatan", "Perbaikan", "Lainnya"]
    let sampelMetodePembayaran = ["Tunai", "Non Tunai"]

    var body: some View {
        VStack {
            Form {
                TextField("Nominal Transaksi", text: $viewModel.inputTransaksi)
                    .keyboardType(.decimalPad)

                HStack {
                    Text("Tanggal Transaksi")
                    Spacer()
                    DatePicker("", selection: $viewModel.tgl, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                }

                HStack {
                    Text("Kategori Pengeluaran")
                    Spacer()
                    Picker("", selection: $viewModel.selectedKategori) {
                        ForEach(sampelKategori, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .onAppear{
                        viewModel.selectedKategori = sampelKategori.first ?? ""
                    }
                    .labelsHidden()
                    .pickerStyle(.automatic)
                }

                HStack {
                    Text("Metode Pembayaran")
                    Spacer()
                    Picker("", selection: $viewModel.selectedMetodePembayaran) {
                        ForEach(sampelMetodePembayaran, id: \.self) { item in
                            Text(item)
                        }
                    }
                    
                    .onAppear{
                        viewModel.selectedMetodePembayaran = sampelMetodePembayaran.first ?? ""
                    }
                    .labelsHidden()
                    .pickerStyle(.automatic)
                }

                TextField("Keterangan", text: $viewModel.inputKeterangan)

                Button(action: {}) {
                    HStack {
                        Text("Lampiran")
                        Spacer()
                        Image(systemName: "paperclip")
                    }
                }

                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                }

                HStack(alignment: .top) {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color(.systemBlue))
                    Text("Lampiran dapat berupa file berformat JPG, JPEG, PNG, atau PDF dengan ukuran maksimal 1,5MB")
                        .foregroundColor(Color(.systemBlue))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Simpan") {
                    // Tindakan simpan
                }
                .disabled(!viewModel.isFormValid)
            }
        }
        .navigationTitle("Tambah Transaksi Keluar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FormKasTransaksiView()
}


#Preview {
    FormKasTransaksiView()
}
