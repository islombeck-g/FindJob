//
//  SearchBar.swift
//  StudentAPP_version_0.1
//
//  Created by Islombek Gofurov on 10/03/24.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing:Bool = false
    var body: some View {
        HStack {
            TextField("Поиск тут ...", text: $text)
                .padding(15)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .foregroundStyle(.black)
                .clipShape(.rect(cornerRadius: 15))
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        
                        if self.isEditing || self.text.isEmpty {
                            withAnimation {
                                Button {
                                    self.text = ""
                                    self.isEditing = false
                                } label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundStyle(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    })
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("SecondaryColor"), lineWidth: 2)
                )
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
}
//
//#Preview {
//    SearchBar(text: .constant(""))
//}
#Preview {
    VacancyBoardView()
        .environmentObject(VacancyBoardPresenter())
}
