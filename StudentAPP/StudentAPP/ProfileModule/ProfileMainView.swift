import SwiftUI

struct ProfileMainView: View {
    
    @StateObject private var viewModel:ProfileViewModel
    
    init(userStateViewModel: UserStateViewModel) {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(userStateViewModel: userStateViewModel))
    }
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteAcount_isAllertShow:Bool = false
    @State private var isFavorite = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack {
                    
                    
                    
                    ScrollView {
                        
                        ProfileImage(
                            name: self.$viewModel.student.firstName,
                            secondName: self.$viewModel.student.secondName,
                            patronymicName: self.$viewModel.student.patronymicName,
                            image: self.$viewModel.student.image,
                            phoneNumber: self.$viewModel.student.phoneNumber)
                        .padding(.vertical, 16)
                        
                        NavigationLink{
                            CvMainView()
                                .environmentObject(self.viewModel)
                        }label: {
                            Group {
                                Text("Мое резюме")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .foregroundStyle(Color.white)
                                    .background(Color("AccentColor"))
                                    .clipShape(.rect(cornerRadius: 13))
                                
                            }
                            .padding(.horizontal, 16)
                            
                        }
                        
                        
                        Spacer()
                            .frame(height: 36)
                        
                        ProfileItemsView(aboutMe: self.$viewModel.student.aboutMe, birthDate: self.$viewModel.student.birthDate, institute: self.$viewModel.student.institute, direction: self.$viewModel.student.direction, university: self.$viewModel.student.university)
                        
                        Spacer()
                            .frame(height: 30)
                        
                        NavigationLink{
                            SupportMainView()
                                .environmentObject(self.viewModel)
                        }label: {
                            Group {
                                Text("Тех. поддержка")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .foregroundStyle(Color.white)
                                    .background(Color("AccentColor"))
                                    .clipShape(.rect(cornerRadius: 13))
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        Spacer()
                            .frame(height: 15)
                        
                        Divider()
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Button {
                            self.logOut_isAllertShow.toggle()
                        }label: {
                            
                            Text("Выйти")
                            
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .foregroundStyle(.red)
                                .background(Color("darkAccentColor"))
                                .clipShape(.rect(cornerRadius: 13))
                            
                        }
                        .padding(.horizontal, 16)
                        .alert("Хотите выйти?", isPresented: self.$logOut_isAllertShow) {
                            
                            Text("Отмена")
                            
                            Button{
                                self.viewModel.logOut()
                            }label: {
                                Text("Выйти")
                            }
                        } message: {
                            Text("")
                        }
                        
                        .alert("Удалить аккаунт?", isPresented: self.$deleteAcount_isAllertShow) {
                            Button{}label: {
                                Text("Отмена")
                            }
                            
                            Button{
                                
                            }label: {
                                Text("Удалить")
                            }
                        } message: {
                            Text("Восстановление аккаунта невозможно после удаления.")
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
                        //don't understand why it is here
                    } label: {
                        Image(systemName: "bell")
                            .font(.system(size: 19))
                            .fontWeight(.regular)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    
                    Text("Профиль")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("SecondaryColor"))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        NavigationLink{
                            EditAccount()
                                .environmentObject(self.viewModel)
                        }label:{
                            Text("Редактировать профиль")
                        }
                        
                        Divider()
                        
                        Button(role: .destructive) {
                            self.deleteAcount_isAllertShow.toggle()
                        }label:{
                            Text("Удалить аккаунт")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .frame(width: 20, height: 30)
                            .padding(4)
                            .padding(.trailing, 6)
                    }
                    .foregroundStyle(Color("SecondaryColor"))
                }
            }
        }
    }
}

#Preview {
    ProfileMainView(userStateViewModel: UserStateViewModel())
}
