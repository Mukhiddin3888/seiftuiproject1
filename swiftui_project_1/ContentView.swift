//
//  ContentView.swift
//  swiftui_project_1
//
//  Created by Abbos Bobomurodov on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    
    var menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack{
            
            List{
                ForEach(menu){ section in
                    Section("\(section.name)"){
                        ForEach(section.items){
                            items in
                            NavigationLink(value: items){
                
                                ItemRow(item: items)
                            }
                         
                        }
                    }
                
                    
                }
                
                
            }
            .navigationDestination(for: MenuItem.self){
                item in
                ItemDetails(item: item)
            }
                .navigationTitle("Menu Items")
//                .listStyle(.grouped)
        
            
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
