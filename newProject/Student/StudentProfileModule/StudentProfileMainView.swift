import SwiftUI

struct StudentProfileMainView: View {
    
    @StateObject private var viewModel:StudentProfileViewModel = StudentProfileViewModel()
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
                    UserProfileImage(name: self.viewModel.student.firstName, secondName: self.viewModel.student.secondName, patronymicName: self.viewModel.student.patronymicName, image: self.viewModel.student.image, phoneNumber: self.viewModel.student.phoneNumber)
                        .padding(.vertical, 16)
                    
                    NavigationLink{}label: {
                        Text("Мое резюме")
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .foregroundStyle(.white)
                            .background(.blue)
                        
                    }
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    StudentProfileMainView()
}
