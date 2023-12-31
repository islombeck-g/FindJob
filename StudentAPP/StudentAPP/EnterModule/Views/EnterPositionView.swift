import SwiftUI

struct EnterPositionView: View {
    @EnvironmentObject var viewModel:EnterViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("SecondaryColor"))
            
            VStack {
                Spacer()
                    .frame(height: 20)
                Text("7")
                    .foregroundStyle(Color("ForegroundColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                
                ZStack {
                    
                    VStack {
                        Spacer()
                            .frame(height: 100)
                        
                        CustomTextFieldView(isSecureField: false, text: "Телефон*", result: self.$viewModel.student.phoneNumber)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Button {
                            //add next tabView
                        } label: {
                            
                            Text("Прикрепить аватар")
                                .foregroundColor(.black)
                                .frame(
                                    width: 293,
                                    height: 46)
                                .font(.system(size: 18))
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                }
                        }
                        .background(Color.white)
                        .clipShape(.buttonBorder)
                        
                        Spacer()
                            .frame(height: 15)
                        
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
                    
                    VStack {
                        Spacer()
                            .frame(height: 55)
                        
                        DropDownView(menuActions: self.viewModel.universitys, title: self.$viewModel.chosenUniversity)
                    }
                    
                    DropDownView(menuActions: self.viewModel.cities, title: self.$viewModel.chosenCity)
                }
            }
        }
        .frame(
            width: 343,
            height: 389,
            alignment: .center)
    }
}

#Preview {
    EnterPositionView()
        .environmentObject(EnterViewModel(userStateManager: UserStateManager()))
}
