//
//  RegistrationView.swift
//  StudentAPP_version_0.1
//
//  Created by Islombek Gofurov on 08/03/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject var router: AppRouter

    @EnvironmentObject var presenter: AuthPresenter
    
    var body: some View {
        VStack {
            Text("RegistrationView")
            Button("Go Back") {
                router.navigateBack()
            }
            
            
            Button {
                
            } label: {
                Text("add")
            }
            
            Button("go next") {
                router.navigateTo(.auth)
            }
            
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(AppRouter.shared)
        .environmentObject(AuthPresenter())
}
