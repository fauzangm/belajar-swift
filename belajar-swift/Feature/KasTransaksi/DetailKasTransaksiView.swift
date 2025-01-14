//
//  DetailKasTransaksiView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 14/01/25.
//

import SwiftUI

struct DetailKasTransaksiView: View {
    var body: some View {
        VStack{
            List{
                Group{
                    HStack{
                        Text("Transaksi Keluar")
                        Spacer()
                        Text("Rp.500.000")
                    }
                    
                    VStack(alignment:.leading){
                        Text("Kategori Pemasukan")
                            .foregroundColor(.secondary)
                        Text("Kegiatan")
                    }
                    
                    VStack(alignment:.leading){
                        Text("Tanggal Transaksi")
                            .foregroundColor(.secondary)
                        Text("23 Desember 2024")
                    }
                    
                    VStack(alignment:.leading){
                        Text("Metode Pembayaran")
                            .foregroundColor(.secondary)
                        Text("Tunai")
                    }
                }
                
                Group{
                    VStack(alignment:.leading){
                        Text("Keterangan")
                            .foregroundColor(.secondary)
                        Text("Donasi PT Maju Berkah")
                    }
                    
                    VStack(alignment:.leading){
                        Text("Lampiran")
                            .foregroundColor(.secondary)
                    }
                }
                
            }
            
        }
        .navigationTitle("Detail Transaksi")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
}

#Preview {
    DetailKasTransaksiView()
}
