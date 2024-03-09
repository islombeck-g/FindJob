//
//  LoginRoundedRectangleForm.swift
//  StudentAPP_version_0.1
//
//  Created by Islombek Gofurov on 09/03/24.
//

import SwiftUI

struct LoginRoundedRectangleForm: View {
    
    @EnvironmentObject var presener: AuthPresenter
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 287)
                .foregroundStyle(Color("SecondaryColor"))
            
            VStack(alignment: .center) {
                Text(LocalizedStringKey("Личные данные"))
                    .foregroundStyle(Color("ForegroundColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldForm(isSecureField: false, text: "Почта", result: self.$presener.email)
                
                Spacer()
                    .frame(height: 10)
                
                CustomTextFieldForm(isSecureField: true, text: "Пароль", result: self.$presener.password)
                
                Spacer()
                    .frame(height: 20)
                
                Button {
                    self.presener.registration()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 293, height: 50)
                            .foregroundColor(Color("AccentColor"))
                        
                        Text(LocalizedStringKey("Регистрация"))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

#Preview {
    LoginRoundedRectangleForm()
        .environmentObject(AuthPresenter())
}
