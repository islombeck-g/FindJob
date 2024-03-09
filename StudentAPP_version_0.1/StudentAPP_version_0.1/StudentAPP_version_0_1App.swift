//
//  StudentAPP_version_0_1App.swift
//  StudentAPP_version_0.1
//
//  Created by Islombek Gofurov on 08/03/24.
//

import SwiftUI

@main
struct StudentAPP_version_0_1App: App {

    @StateObject var router = AppRouter.shared
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(router)
        }
        
    }
}
