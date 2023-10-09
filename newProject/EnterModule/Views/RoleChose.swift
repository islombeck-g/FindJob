import SwiftUI

struct RoleChose: View {
    
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Binding var doneChoseRole: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.white)
            
            VStack {
                //Intro part
                Group {
                    Text("Личные данные")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Роль*")
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 41)
                    
                }
                //chose enter positiont
                Group {
                    
                    HStack {

                        Button{
                            withAnimation {
                                self.viewModel.role = .student
                            }
                            
                        }label: {
                            Group {
                               
                                Image(systemName: self.viewModel.role == .student ? "largecircle.fill.circle" : "circle")
                                    .clipShape(Circle())
                                
                                Text("Студент")
                            }
                            .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button{
                            withAnimation {
                                self.viewModel.role = .organization
                            }
                            
                        }label: {
                            Group {
                               
                                Image(systemName: self.viewModel.role == .organization ? "largecircle.fill.circle" : "circle")
                                    .clipShape(Circle())
                                
                                Text("Организация")
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
                
                Text("*Обязательное поле")
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 41)
                    .foregroundStyle(Color("darkGray"))
                
                
                Button {
                    self.doneChoseRole.toggle()
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
            height: 250,
            alignment: .center)
        
    }
}

#Preview {
    RoleChose(doneChoseRole: .constant(false))
        .environmentObject(RegistrationViewModel())
}
//увеличил размер с 15 на 17
