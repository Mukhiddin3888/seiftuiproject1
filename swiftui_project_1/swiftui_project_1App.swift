//
//  swiftui_project_1App.swift
//  swiftui_project_1
//
//  Created by Abbos Bobomurodov on 17/05/23.
//

import SwiftUI

@main
struct swiftui_project_1App: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
           MainView()
                .environmentObject(order)
        }
    }
}
