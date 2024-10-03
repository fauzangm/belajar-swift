//
//  AddMyListScreen.swift
//  belajar-swift
//
//  Created by Fauzan Ghozi Mubarak on 01/10/24.
//

import SwiftUI

struct AddMyListScreen: View {
    
    @Binding var updateMyList : MyList?
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var listName : String
    @State private var color : Color
    
    init(updateMyList: Binding<MyList?>) {
         self._updateMyList = updateMyList
         _listName = State(initialValue: updateMyList.wrappedValue?.name ?? "")
        _color = State(initialValue: Color(hex: updateMyList.wrappedValue?.colorCode ?? "#0000FF") )
     }
    var body: some View {
        VStack{
            Image(systemName: "line.3.horizontal.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(color)
            
            TextField("List name", text: $listName)
                .textFieldStyle(.roundedBorder)
                .padding([.leading,.trailing],44)
            
            ColorPicker(selectedColor: $color)
        }
        .navigationTitle("New List")
        .safeAreaPadding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading){
                Button("Close"){
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing){
                Button("Done"){
                    if(updateMyList != nil){
                        updateReminder(updateMyList!)
                    }else{
                       insertReminder()
                    }
               
                    dismiss()
                }
            }
        }
    }
    
    
    func insertReminder(){
        guard let hex = color.toHex() else {return}
        let myList = MyList(name: listName, colorCode: hex)
        context.insert(myList)
    }
    
    func updateReminder(_ item : MyList) {
        guard let hex = color.toHex() else {return}
        item.name = listName
        item.colorCode = hex
        try? context.save()
    }
}

//#Preview {
//    
//    @State var PreviewupdateMyList: MyList? = MyList(name: "Sample List", colorCode: "#FF5733")
//
//       
//    AddMyListScreen(updateMyList: $PreviewupdateMyList)
//}
