//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Connie Waffles on 22/08/2021.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
