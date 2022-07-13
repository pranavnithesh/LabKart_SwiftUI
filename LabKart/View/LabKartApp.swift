//
//  LabKartApp.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

@main
struct LabKartApp: App {
    
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ShopViewModel())
        }
    }
}
