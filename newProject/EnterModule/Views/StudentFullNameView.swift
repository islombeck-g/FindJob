import SwiftUI

struct StudentFullNameView: View {
    
    @EnvironmentObject var viewModel:RegistrationViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.white)
            
            VStack(alignment: .center) {
                Text("Личные данные")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: "Имя*", result: self.$viewModel.student.firstName)
                
                CustomTextFieldView(isSecureField: false, text: "Фамилия*", result: self.$viewModel.student.secondName)
                
                CustomTextFieldView(isSecureField: false, text: "Отчество", result: self.$viewModel.student.patronymicName)
                
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
                            .foregroundColor(.black)
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
                            .foregroundColor(.black)
                        }
                    }
                    .font(.system(size: 17))
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 40, alignment: .leading)
                    .padding(.leading, 45)
                    .padding(.trailing, 45)
                }
                Spacer()
                    .frame(height: 20)
                Text("*Обязательное поле")
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 41)
                    .foregroundStyle(Color("darkGray"))
                
                Button {
                    //add next tabView
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(
                                width: 293,
                                height: 46)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                        
                        Text("Далее")
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
    StudentFullNameView()
        .environmentObject(RegistrationViewModel())
}
