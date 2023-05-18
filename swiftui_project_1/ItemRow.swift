//
//  ItemRow.swift
//  swiftui_project_1
//
//  Created by Abbos Bobomurodov on 17/05/23.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    let colors: [String:Color] = ["D" : Color.gray, "V" : Color.primary,"N" : Color.green, "G":Color.red]
    
    var body: some View {
        HStack{
           
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            VStack(alignment: .leading ){
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            
            }
          Spacer()
            ForEach(item.restrictions, id: \.self){
                restriction in
                
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(4)
                    .background(colors[restriction, default: .blue])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                
                
                
            }
       
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example )
    }
}
