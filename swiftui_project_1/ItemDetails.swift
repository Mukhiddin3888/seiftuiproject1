//
//  ItemDetails.swift
//  swiftui_project_1
//
//  Created by Abbos Bobomurodov on 17/05/23.
//

import SwiftUI

struct ItemDetails: View {
    let item:MenuItem
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
               
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("By \(item.photoCredit)")
                    .fontWeight(.bold)
                    .padding(4)
                    .background(.black)
                    .foregroundColor(.white)
                    .offset(x: -5,y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("Order This"){
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
       
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ItemDetails(item: MenuItem.example)
                .environmentObject(Order())
        }
        
    }
}
