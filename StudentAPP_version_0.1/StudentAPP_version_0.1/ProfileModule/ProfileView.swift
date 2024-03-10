import SwiftUI

struct ProfileView: View {
     
    @EnvironmentObject var router: AppRouter
    @EnvironmentObject private var presenetr:ProfilePresenter
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteAcount_isAllertShow:Bool = false
    @State private var isFavorite = false
    
    
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack {
                    HStack {
                        Menu {
                            
                            Button{
                                
                            }label: {
                                Label("English", image: "en")
                            }
                            Button{
                                
                            }label: {
                                Label("Русский", image: "ru")
                            }
                            Button{
                                
                            }label: {
                                Label("Uzbek", image: "uz")
                            }
                            
                        } label: {
                            
                                Image(systemName: "globe.europe.africa.fill")
                                    .font(.system(size: 19))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("SecondaryColor"))
                            
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Профиль")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                        Menu {
                            Button{
                                //                            EditAccountSCREEN()
                                //                                .environmentObject(self.viewModel)
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
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .foregroundStyle(Color("SecondaryColor"))
                    }
                    .padding(.horizontal, 16)
                    ScrollView {
                        
                        CircleImageForm(
                            name: self.$presenetr.userFullData.firstName,
                            secondName: self.$presenetr.userFullData.secondName,
                            patronymicName: self.$presenetr.userFullData.patronymicName,
                            image: self.$presenetr.userFullData.image,
                            phoneNumber: self.$presenetr.userFullData.phoneNumber)
                        .padding(.vertical, 16)
                        
                        Button {
                            router.navigateTo(.cv)
                            //                            CvMainSCREEN()
                            //                                .environmentObject(self.viewModel)
                            
                        } label: {
                            Group {
                                Text(LocalizedStringKey("Мое резюме"))
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
                        
                        ProfileItemsForm(aboutMe: self.$presenetr.userFullData.aboutMe, birthDate: self.$presenetr.userFullData.birthDate, institute: self.$presenetr.userFullData.institute, direction: self.$presenetr.userFullData.direction, university: $presenetr.userFullData.university)
                        
                        Spacer()
                            .frame(height: 30)
                        
                        Button {
                            //                            SupportSCREEN()
                            //                                .environmentObject(self.viewModel)
                        } label: {
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
                                //                                self.viewModel.logOut()
                            }label: {
                                Text("Выйти")
                            }
                        } message: {
                            Text("")
                        }
                        
                        .alert("Удалить аккаунт", isPresented: self.$deleteAcount_isAllertShow) {
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
            
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfilePresenter())
        .environmentObject(AppRouter())
}


//.toolbar {
//
//    ToolbarItem(placement: .topBarLeading) {
//
//        Menu {
//
//            Button{
//                self.languageManager.selectedLanguage = .english
//            }label: {
//                Label("English", image: "en")
//            }
//            Button{
//                self.languageManager.selectedLanguage = .russian
//            }label: {
//                Label("Русский", image: "ru")
//            }
//            Button{
//                self.languageManager.selectedLanguage = .uzbek
//            }label: {
//                Label("Uzbek", image: "uz")
//            }
//
//        } label: {
//            HStack {
//                Spacer()
//                Image(systemName: "globe.europe.africa.fill")
//                    .font(.system(size: 19))
//                    .fontWeight(.bold)
//                    .foregroundStyle(Color("SecondaryColor"))
//                Spacer()
//                    .frame(width: 16)
//            }
//        }
//    }
//
//    ToolbarItem(placement: .principal) {
//
//        Text("17")
//            .font(.system(size: 22))
//            .fontWeight(.bold)
//            .foregroundStyle(Color("SecondaryColor"))
//    }
//
//    ToolbarItem(placement: .topBarTrailing) {
//        Menu {
//            Button{
////                            EditAccountSCREEN()
////                                .environmentObject(self.viewModel)
//            }label:{
//                Text("Редактировать профиль")
//            }
//
//            Divider()
//
//            Button(role: .destructive) {
//                self.deleteAcount_isAllertShow.toggle()
//            }label:{
//                Text("Удалить аккаунт")
//            }
//        } label: {
//            Image(systemName: "ellipsis")
//                .rotationEffect(.degrees(90))
//                .frame(width: 20, height: 30)
//                .padding(4)
//                .padding(.trailing, 6)
//        }
//        .foregroundStyle(Color("SecondaryColor"))
//    }
//}
