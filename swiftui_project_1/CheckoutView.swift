//
//  CheckoutView.swift
//  swiftui_project_1
//
//  Created by Abbos Bobomurodov on 18/05/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "Points"]
    
    @State private var paymentType = "Cash"
    
    @State private var addLoyalityDetails = false
    @State private var loyalityNumber = ""
    
    @State private var tipsList = [10, 15, 20, 25, 0]
    @State private var tip = 15
    
    @State private var showingPaymentAlert  = false
    
    var totalPrice: String {
        let total = Double(order.total)
        
        let tipValue = total / 100 * Double(tip)
        
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                       
                        Text($0)
                    }
                }
                Toggle( "Add loyality details", isOn: $addLoyalityDetails.animation())
                
                if addLoyalityDetails {
                    TextField("Enter your ID", text: $loyalityNumber)
                }
                
            }
            
            Section("Add a tip?"){
                Picker("Percentage", selection: $tip){
                    ForEach(tipsList, id: \.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total \(totalPrice)"){
                Button("Confirm Order"){
                    //place order
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $showingPaymentAlert){
            
        }message: {
            Text("Your total was: \(totalPrice) - thank you!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CheckoutView()
                .environmentObject(Order())
        }
    }
}
