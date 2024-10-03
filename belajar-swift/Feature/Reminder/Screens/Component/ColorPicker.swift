//
//  ColorPicker.swift
//  belajar-swift
//
//  Created by Fauzan Ghozi Mubarak on 01/10/24.
//

import SwiftUI

struct ColorPicker: View {
    
    @Binding var selectedColor : Color
    
    let colors : [Color] = [.red, .blue, .brown, .green, .yellow, .orange, .purple]
    var body: some View {
        HStack{
            ForEach(colors, id: \.self) {color in
        
                ZStack{
                    Circle().fill()
                        .foregroundColor(color)
                        .padding(2)
                    Circle()
                        .strokeBorder(selectedColor == color ? .gray : .clear, lineWidth: 4)
                        .scaleEffect(CGSize(width: 1.2, height: 1.2))
                }.onTapGesture {
                    selectedColor = color
                }
                
            }
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
    }
}

#Preview {
    ColorPicker(selectedColor : .constant(.yellow))
}
