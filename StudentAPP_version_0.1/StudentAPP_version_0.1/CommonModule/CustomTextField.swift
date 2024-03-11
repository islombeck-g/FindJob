import SwiftUI

struct CustomTextField: View {
    
    @State private var showPassword: Bool = false
    
    var isSecureField: Bool
    let text: String
    @Binding var result: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(Color("textFieldBack"))

            Group {
                if !self.isSecureField {
                    
                    TextField(self.text, text: self.$result)
                        
                        .padding(.horizontal, 16)
                    
                    
                } else {
                    Group {
                        if self.showPassword {
                            TextField(self.text, text: self.$result)
                                .background(Color.black)
                                .foregroundStyle(.red)
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
        .foregroundStyle(Color("TextColor"))
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
}

#Preview {
    CustomTextField(isSecureField: false, text: "someText", result: .constant("text"))
}
