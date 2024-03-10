//
//  CvView.swift
//  StudentAPP_version_0.1
//
//  Created by Islombek Gofurov on 10/03/24.
//

import SwiftUI

struct CvView: View {
    
    @EnvironmentObject var presenter: CvPresenter
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CvView()
        .environmentObject(CvPresenter())
        .environmentObject(AppRouter())
}
