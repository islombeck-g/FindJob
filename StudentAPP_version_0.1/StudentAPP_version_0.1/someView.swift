//
//  someView.swift
//  StudentAPP_version_0.1
//
//  Created by Islombek Gofurov on 09/03/24.
//

import SwiftUI

struct someView: View {
   
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack {
            Button("next") {
                router.navigateTo(.mainTabView)
            }
        }
    }
}

#Preview {
    someView()
}
