import SwiftUI

struct StudentProfileMainView: View {
    
    @State private var isFavorite = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button{
                            //don't understand why it is here
                        }label: {
                            Image(systemName: "bell")
                                .padding(5)
                        }
                        .padding(.leading, 7)
                        
                        Spacer()
                        
                        Text("Профиль")
                            
                        Spacer()
                        
                        Menu {
                            Button {
                                
                            }label:{
                                Text("Редактировать профиль")
                            }
                            Divider()
                            Button(role: .destructive) {
                                
                            }label:{
                                Text("Удалить аккаунт")
                            }
                        }label: {
                            Image(systemName: "ellipsis")
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                                .padding(4)
                                .padding(.trailing, 6)
                        }
                    }
                    .font(.system(size: 18))
                    Text("some")
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    StudentProfileMainView()
}
