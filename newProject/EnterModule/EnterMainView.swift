import SwiftUI

struct EnterMainView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Group {
                        Text ("Здравствуйте!")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        
                        Text ("Биржа талантов - возможность получить любимую работу")
                            .font(.system(size: 20))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    
                    Group {
                        NavigationLink {
                            LoginView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 46)
                                    .foregroundColor(.white)
                                
                                Text ("Вход")
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                            }
                        }
                        
                        NavigationLink{
                            RegistrationView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(
                                        width: UIScreen.main.bounds.width - 32,
                                        height: 46)
                                    .foregroundColor(.black)
                                Text("Регистрация")
                                    .foregroundColor(.white)
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
    EnterMainView()
}
