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
                        }label: {
                            Image(systemName: "ellipsis")
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                                .padding(4)
                                .padding(.trailing, 6)
                        }
                    }
                    .font(.system(size: 18))
                    
                    
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
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .foregroundStyle(.white)
                                    .background(Color("buttonBlue"))
                                    .clipShape(.rect(cornerRadius: 13))
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        Spacer()
                            .frame(height: 36)
                        
//                        ProfileItemsView(
//                            aboutMe: self.$viewModel.newAboutMe ,
//                                           birthDate:
//                                self.$viewModel.newBirthday,
//                                           institute:
//                                self.$viewModel.newInstitute,
//                                           direction:
//                                self.$viewModel.newDirection ,
//                                           university:
//                                self.$viewModel.newUniversity)
                        ProfileItemsView(aboutMe: self.$viewModel.student.aboutMe, birthDate: self.$viewModel.student.birthDate, institute: self.$viewModel.student.institute, direction: self.$viewModel.student.direction, university: self.$viewModel.student.university)
                        
                    
                        Spacer()
                            .frame(height: 30)
                        
                        NavigationLink{
                            
                        }label: {
                            Group {
                                Text("Тех. поддержка")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .foregroundStyle(.white)
                                    .background(.black)
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
                                .padding()
                                .bold()
                                .foregroundStyle(.red)
                        }
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
        }
    }
}

#Preview {
    ProfileMainView(userStateViewModel: UserStateViewModel())
}
