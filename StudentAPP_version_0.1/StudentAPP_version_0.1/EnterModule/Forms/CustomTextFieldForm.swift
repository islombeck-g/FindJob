import SwiftUI

struct CustomTextFieldForm: View {
    
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
                    
                    TextField("", text: $result, prompt: Text(self.text) .foregroundColor(Color("darkGray"))
                    )
                        .padding(.horizontal, 16)
                } else {
                    Group {
                        if self.showPassword {
                            
                            TextField("", text: $result, prompt: Text(self.text).foregroundColor(Color("darkGray")))
                        }
                        else{
                    
                            SecureField("", text: $result, prompt: Text(self.text).foregroundColor(Color("darkGray")))
                                
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
        .foregroundStyle(Color("black"))
        .frame(width: 293, height: 50)
    }
}

#Preview {
    CustomTextFieldForm(isSecureField: true, text: "some", result: .constant("some"))
}
