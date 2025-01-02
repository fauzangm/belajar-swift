//
//  PublisherView.swift
//  belajar-swift
//
//  Created by IPO MOBILE on 30/12/24.
//

import SwiftUI

struct PublisherView: View {
    @Binding var navigationPath: NavigationPath
    @StateObject private var vm = PublisherViewModel()
    var body: some View {
        VStack{
            Spacer()
            Text("\(vm.value)")
            Spacer()
        }
        .toolbar(content: {
            ToolbarItem(placement : .topBarTrailing){
                Button("Operator"){
                    navigationPath.append(Screen.newsAppViewScreen)
                }
            }
            
            ToolbarItem(placement : .topBarTrailing){
                Button("Filter"){
                    navigationPath.append(Screen.listingFilterScreen)
                }
            }
        })
        
    }
}

#Preview {
    @Previewable @State var previewNavigationPath = NavigationPath()
    PublisherView(navigationPath: $previewNavigationPath)
}
