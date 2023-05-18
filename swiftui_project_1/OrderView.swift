//
//  OrderView.swift
//  swiftui_project_1
//
//  Created by Abbos Bobomurodov on 17/05/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(order.items){
                        item in
                        
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        
                            
                        }
                    }
                    .onDelete(perform: deleteOrderItems)
              
                }
                
              
                    Section{
                        NavigationLink("Place Order"){
                           CheckoutView()
                        }
                    }.disabled(order.items.isEmpty)
                
             
                
            }
            .navigationTitle("Order title")
            .toolbar{
                EditButton()
            }
        }

    }
    
    func deleteOrderItems(at offset: IndexSet){
        order.items.remove(atOffsets: offset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            OrderView()
                .environmentObject(Order())
        }
        
    }
}
