//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 5/31/21.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
