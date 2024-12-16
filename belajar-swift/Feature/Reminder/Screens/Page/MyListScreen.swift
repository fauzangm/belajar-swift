//
//  ContentView.swift
//  belajar-swift
//
//  Created by Fauzan Ghozi Mubarak on 01/10/24.
//

import SwiftUI
import SwiftData
import Inject

enum ActiveSheet: Identifiable {
    case sheet1, sheet2
    
    var id: String {
        switch self {
        case .sheet1:
            return "sheet1"
        case .sheet2:
            return "sheet2"
        }
    }
}

struct MyListScreen: View {
    
    @ObserveInjection var Inject
    @Query private var myLists : [MyList]
    @State private var isPresented : Bool = false
    @State private var goToMovie : Bool = false
    @State private var updateMyList : MyList? = nil
    @State private var activeSheet: ActiveSheet?
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack{
            List{
                Text("Reminders")
                    .font(.largeTitle)
                    .bold()
                
                VStack{
                    HStack(){
                        ReminderStatView(icon: "calendar", color: .red, textTitle: "Today",textCount: "10")
                        
                        ReminderStatView(icon: "calendar.circle.fill", color: .green, textTitle: "Schedule",textCount: "4")
                        
                    }
                    
                    
                    HStack(){
                        ReminderStatView(icon: "archivebox.circle.fill", color: .purple, textTitle: "All",textCount: "5")
                        
                        ReminderStatView(icon: "calendar.badge.checkmark", color: .blue, textTitle: "Completed",textCount: "7")
                        
                    }
                    
                }
                .padding(.vertical)
                
                
                Text("My Lists")
                    .font(.largeTitle)
                    .bold()
                
                ForEach(myLists){ item in
                    HStack{
                        
                        HStack{
                            Image(systemName: "line.3.horizontal.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(Color(hex: item.colorCode))
                            Text(item.name)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.down.circle")
                            .onTapGesture {
                                updateMyList = item
                                activeSheet = .sheet1
                            }
                        
                        
                        
                    }
                    
                    
                }
                .onDelete{indexes in
                    for index in indexes {
                        deleteItem(myLists[index])
                    }
                }
                
                Button(action: {
                    activeSheet = .sheet2
                }, label: {
                    Text("Add List")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                    
                })
                
                
                NavigationLink(destination: MovieListView(), label: {
                    Text("Go To Moviess")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                })
                
            }
            .listStyle(.insetGrouped)
            //            .sheet(isPresented: $isPresented, content: {
            //                NavigationStack{
            //                    AddMyListScreen(updateMyList : $updateMyList)
            //                }
            //            })
            .sheet(item: $activeSheet) { sheet in
                switch sheet {
                case .sheet1:
                    NavigationStack{
                        AddMyListScreen(updateMyList : $updateMyList)
                    }
                case .sheet2:
                    NavigationStack{
                        AddMyListScreen(updateMyList : $updateMyList)
                    }
                }
            }
            .enableInjection()
        }
        
        
        
    }
    
    func deleteItem(_ item : MyList) {
        context.delete(item)
    }
}






#Preview { @MainActor in
    
    NavigationStack{
        MyListScreen()
    }.modelContainer(previewContainer)
}


