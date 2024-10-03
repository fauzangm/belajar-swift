//
//  CardReminderStat.swift
//  belajar-swift
//
//  Created by Fauzan Ghozi Mubarak on 01/10/24.
//

import SwiftUI


struct ReminderStatView: View {
    var icon: String // Parameter untuk ikon
    var color: Color // Parameter untuk warna latar belakang
    var textTitle: String // Parameter untuk teks di bagian bawah
    var textCount : String
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: icon) // Menggunakan parameter ikon
                    .font(.system(size: 32))
                    .foregroundColor(color)
                
                Text(textTitle) // Menggunakan parameter teks
                    .padding(.top, 8)
                    .foregroundColor(color)
                    .font(.system(size: 14))
            }
            .padding(.vertical)
            .padding(.leading)

            Spacer()
            Text(textCount) // Angka tetap
                .foregroundColor(.white)
                .font(.system(size: 32))
                .padding(.trailing)
                .padding(.vertical)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(color.opacity(0.3)) // Menggunakan parameter warna
        .cornerRadius(12)
    }
}


#Preview {
    ReminderStatView(icon: "calendar.badge.checkmark", color: .blue, textTitle: "Completed",textCount: "12")
}
