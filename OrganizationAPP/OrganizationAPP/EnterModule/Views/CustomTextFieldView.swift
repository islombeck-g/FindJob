import SwiftUI

struct CustomTextFieldView: View {
   
    @State private var showPassword: Bool = false
    
    var isSecureField: Bool
    let text: String
    @Binding var result: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(Color("lightGray"))

            Group {
                if !self.isSecureField {
                    
                    TextField(self.text, text: self.$result)
                        .padding(.horizontal, 16)
                    
                } else {
                    Group {
                        if self.showPassword {
                            TextField(self.text, text: self.$result)
                        }
                        else{
                            SecureField(self.text, text: self.$result)
                        }
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 30)
                    
                    Button(action: {
                        self.showPassword.toggle()
                    }) {
                        Image(systemName: self.showPassword ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                    .padding(.trailing, 5)
                }
            }
        }
        .foregroundStyle(Color("darkGray"))
        .frame(width: 293, height: 50)
    }
}

#Preview {
    CustomTextFieldView(isSecureField: false, text: "someText", result: .constant("text"))
}
