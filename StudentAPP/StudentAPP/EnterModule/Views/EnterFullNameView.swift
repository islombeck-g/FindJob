import SwiftUI

struct EnterFullNameView: View {
    
    @EnvironmentObject var viewModel:EnterViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("SecondaryColor"))
            
            VStack(alignment: .center) {
                Text(LocalizedStringKey("7"))
                    .foregroundStyle(Color("ForegroundColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: "69", result: self.$viewModel.student.firstName)
                
                CustomTextFieldView(isSecureField: false, text: "70", result: self.$viewModel.student.secondName)
                
                CustomTextFieldView(isSecureField: false, text: "71", result: self.$viewModel.student.patronymicName)
                
                Group {
                    HStack {

                        Button{
                            withAnimation {
                                self.viewModel.student.gender = .male
                            }
                            
                        }label: {
                            Group {
                               
                                Image(systemName: self.viewModel.student.gender == .male ? "largecircle.fill.circle" : "circle")
                                    .clipShape(Circle())
                                
                                Text("Муж")
                            }
                            
                        }
                        
                        Spacer()
                            .frame(width: 25)
                        
                        Button{
                            withAnimation {
                                self.viewModel.student.gender = .female
                            }
                            
                        }label: {
                            Group {
                               
                                Image(systemName: self.viewModel.student.gender == .female ? "largecircle.fill.circle" : "circle")
                                    .clipShape(Circle())
                                
                                Text("Жен")
                            }
                            
                        }
                    }
                    .font(.system(size: 17))
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 40, alignment: .leading)
                    .padding(.leading, 45)
                    .padding(.trailing, 45)
                }
                .foregroundStyle(Color("ForegroundColor"))
                Spacer()
                    .frame(height: 20)
                Text("68")
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 41)
                    .foregroundStyle(Color("darkGray"))
                
                Button {
                    self.viewModel.nextTabView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(
                                width: 293,
                                height: 46)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("AccentColor"))
                        
                        Text("72")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .frame(
            width: 343,
            height: 403,
            alignment: .center)
    }
}


#Preview {
    EnterFullNameView()
        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
}
