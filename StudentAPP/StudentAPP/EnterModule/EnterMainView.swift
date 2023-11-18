import SwiftUI

struct EnterMainView: View {
    
    @StateObject var viewModel:EnterViewModel
    
    init(userStateViewModel: UserStateViewModel) {
        _viewModel = StateObject(wrappedValue: EnterViewModel(userStateViewModel: userStateViewModel))
            }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    Group {
                        Text ("Здравствуйте!")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        
                        Text ("Биржа талантов - возможность получить любимую работу")
                            .font(.system(size: 20))
                            
                    }
                    .foregroundStyle(Color("SecondaryColor"))
//                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    
                    Group {
                        NavigationLink {
                            LoginView()
                                .environmentObject(self.viewModel)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 343, height: 46)
                                    .foregroundColor(Color("SecondaryColor"))
                                
                                Text ("Вход")
                                    .foregroundStyle(Color("ForegroundColor"))
                                    .fontWeight(.bold)
                                     
                            }
                        }
 
                        NavigationLink{
                            RegistrationView()
                                .environmentObject(self.viewModel)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                                    .frame(width: 343, height: 46)
                                
                                Text("Регистрация")
                                    .foregroundStyle(Color("SecondaryColor"))
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    EnterMainView(userStateViewModel: UserStateViewModel())
}
