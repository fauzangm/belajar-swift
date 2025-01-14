//
//  KasTransaksiView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 03/01/25.
//

import SwiftUI

struct KasTransaksiView: View {
    @Binding var navigationPath: NavigationPath
    @Environment(\.dismiss) private var dismiss
    // Contoh data
    @State private var showAddKeuangan = false
    @State private var data = [
        KasTransaksiModel(tanggal: "27 Desember 2028", detail: [
            DetailKasTransaksi(tanggal: "27 Desember 2028", jenisTransaksi: "Lainnya", desc: "Persiapan BBQ RT Tahun Baru 2029", uang: "- Rp 349.000")
        ]),
        KasTransaksiModel(tanggal: "14 Desember 2028", detail: [
            DetailKasTransaksi(tanggal: "14 Desember 2028", jenisTransaksi: "Operasional", desc: "Pembayaran Listrik Gedung Serba...", uang: "- Rp 462.480"),
            DetailKasTransaksi(tanggal: "14 Desember 2028", jenisTransaksi: "Donasi", desc: "Donasi PT Maju Berkah untuk Pendi...", uang: "+ Rp 15.000.000")
        ]),
        KasTransaksiModel(tanggal: "7 Desember 2028", detail: [
            DetailKasTransaksi(tanggal: "7 Desember 2028", jenisTransaksi: "Iuran", desc: "Iuran Bapak Ahmad", uang: "+ Rp 1.002.500")
        ]),
        KasTransaksiModel(tanggal: "1 Desember 2028", detail: [
            DetailKasTransaksi(tanggal: "1 Desember 2028", jenisTransaksi: "Pindah Buku", desc: "Saldo Bulan November 2028", uang: "+ Rp 9.513.000")
        ])]
    var body: some View {
        VStack{
            HeaderContent()
            ListingContent()
        }
        .navigationTitle("Kelola Keuangan")
        .toolbar{
            ToolbarItem(placement:.topBarTrailing){
                Button(action: {showAddKeuangan = true}){
                    ZStack {
                        Circle()
                            .fill(Color.white) // Latar belakang lingkaran putih
                            .frame(width: 32, height: 32) // Ukuran lingkaran
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .frame(width: 15, height: 15) // Ukuran ikon
                    }
                    .alert(isPresented : $showAddKeuangan){
                        Alert(
                            title: Text("Silahkan Pilih Jenis Transaksi"),
                            message: Text("Pilih transaksi: Keluar untuk pengurangan saldo, atau Masuk untuk penambahan saldo."),
                            primaryButton: .cancel(Text("Masuk"),action: {
                                navigationPath.append(Screen.formKasTransaksiScreen)
                            }),
                            secondaryButton: .destructive(Text("Keluar"),action: {
                                
                                navigationPath.append(Screen.formKasTransaksiScreen)
                            })
                            
                        )
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("ColorBackground"))
    }
}

#Preview {
    @Previewable @State var previewNavigationPath = NavigationPath()
    KasTransaksiView(navigationPath : $previewNavigationPath)
}


extension KasTransaksiView {
    @ViewBuilder
    func HeaderContent() -> some View {
//        HStack {
//            ZStack {
//                Circle()
//                    .fill(Color.white) // Latar belakang lingkaran putih
//                    .frame(width: 32, height: 32) // Ukuran lingkaran
//                Image(systemName: "minus")
//                    .resizable()
//                    .scaledToFit()
//                    .foregroundColor(.black)
//                    .frame(width: 15, height: 15) // Ukuran ikon
//            }
//            .onTapGesture {
//                dismiss()
//            }
//            
//            Spacer()
//            Text("Kelola Keuangan")
//                .font(.title2)
//                .foregroundColor(.black)
//            Spacer()
//            Button(action: {showAddKeuangan = true}){
//                ZStack {
//                    Circle()
//                        .fill(Color.white) // Latar belakang lingkaran putih
//                        .frame(width: 32, height: 32) // Ukuran lingkaran
//                    Image(systemName: "plus")
//                        .resizable()
//                        .scaledToFit()
//                        .foregroundColor(.black)
//                        .frame(width: 15, height: 15) // Ukuran ikon
//                }
//                .alert(isPresented : $showAddKeuangan){
//                    Alert(
//                        title: Text("Silahkan Pilih Jenis Transaksi"),
//                        message: Text("Pilih transaksi: Keluar untuk pengurangan saldo, atau Masuk untuk penambahan saldo."),
//                        primaryButton: .cancel(Text("Masuk"),action: {
//                            navigationPath.append(Screen.formKasTransaksiScreen)
//                        }),
//                        secondaryButton: .destructive(Text("Keluar"),action: {
//                            
//                            navigationPath.append(Screen.formKasTransaksiScreen)
//                        })
//                        
//                    )
//                }
//            }
//          
//        }
//        Spacer()
//            .frame(height: 32)
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("ColorLightGreen"))
                .frame(height: 120)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("ColorGreen"))
                )
            
            VStack{
                Text("Saldo")
                    .foregroundColor(Color("ColorGreen"))
                    .padding(.horizontal)
                
                
                Spacer()
                    .frame(height: 10)
                
                Text("Rp 11.888.888")
                    .lineLimit(1)
                    .font(.title2)
                    .fontWeight(.bold)
                    .truncationMode(.tail)
                    .padding(.horizontal)
                
            }
            
        }
        .padding(.vertical)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 180, height: 40)
                    .foregroundColor(.white)
                    .overlay(
                        HStack{
                            Text("Semua Tanggal")
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                    )
                
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 190, height: 40)
                    .foregroundColor(.white)
                    .overlay(
                        HStack{
                            Text("Semua Transaksi")
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                    )
                
                ZStack {
                    Circle()
                        .fill(Color.white) // Latar belakang lingkaran putih
                        .frame(width: 40, height: 40) // Ukuran lingkaran
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20) // Ukuran ikon
                }
                Spacer()
            }
            .padding() // Menambahkan padding agar lebih terlihat
        }
        
        
    }
    
    func ListingContent() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(data, id: \.tanggal) { transaksi in
                    Section(header: Text(transaksi.tanggal)
                        .font(.headline)
                        .foregroundColor(.gray)) {
                            ForEach(transaksi.detail, id: \.desc) { detail in
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text(detail.jenisTransaksi)
                                            .font(.body)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        Text(detail.uang)
                                            .foregroundColor(detail.uang.hasPrefix("+") ? .green : .red)
                                    }
                                    Text(detail.desc)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .onTapGesture(perform: {
                                    navigationPath.append(Screen.detailKasTransaksiScreen)
                                })
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                            }
                        }
                }
            }
            .padding()
        }
    }
}
