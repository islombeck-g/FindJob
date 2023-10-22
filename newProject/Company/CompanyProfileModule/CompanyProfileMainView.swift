import SwiftUI

struct CompanyProfileMainView: View {
    
    @StateObject private var viewModel:CompanyProfileViewModel = CompanyProfileViewModel()
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteAcount_isAllertShow:Bool = false
    
    @State private var someVar: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                            NavigationLink
                            {
                                EditStudentAccount()
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
                        
                        UserProfileImage(
                            name: self.$viewModel.company.name,
                            secondName: self.$someVar,
                            patronymicName: self.$someVar,
                            image: self.$viewModel.company.image,
                            phoneNumber: self.$viewModel.company.phoneNumber)
                            .padding(.vertical, 16)
                        
                        NavigationLink{
                            
                        }label: {
                            Group {
                                Text("Вакансии")
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
                        
                        CompanyProfileView(
                            name: self.$viewModel.newName,
                            dateOfCreation: self.$viewModel.newDateOfCreation,
                            INN: self.$viewModel.newINN,
                            activity: self.$viewModel.newActivity,
                            description: self.$viewModel.newDescription)
                        
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
                                //выход из приложения
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
                                //удалить аккаунт из приложения
                            }label: {
                                Text("Удалить")
                            }
                        } message: {
                            Text("Восстановление аккаунта невозможно после удаления.")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CompanyProfileMainView()
}
