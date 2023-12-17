import SwiftUI

struct ProfileSCREEN: View {
    
    @EnvironmentObject private var viewModel:ProfileViewModel
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteAcount_isAllertShow:Bool = false
    @State private var isFavorite = false
    
    @ObservedObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            ZStack {
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
                        
                        NavigationLink {
                            
                            CvMainSCREEN()
                                .environmentObject(self.viewModel)
                            
                        } label: {
                            Group {
                                Text(LocalizedStringKey("20"))
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
                        
                        NavigationLink {
                            SupportSCREEN()
                                .environmentObject(self.viewModel)
                        } label: {
                            Group {
                                Text("21")
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
                            
                            Text("22")
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .foregroundStyle(.red)
                                .background(Color("darkAccentColor"))
                                .clipShape(.rect(cornerRadius: 13))
                            
                        }
                        .padding(.horizontal, 16)
                        
                        .alert("23", isPresented: self.$logOut_isAllertShow) {
                            
                            Text("24")
                            
                            Button{
                                self.viewModel.logOut()
                            }label: {
                                Text("22")
                            }
                        } message: {
                            Text("")
                        }
                        
                        .alert("19", isPresented: self.$deleteAcount_isAllertShow) {
                            Button{}label: {
                                Text("24")
                            }
                            
                            Button{
                                
                            }label: {
                                Text("25")
                            }
                        } message: {
                            Text("26")
                        }
                    }
                    
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Menu {
                        
                        Button{
                            self.languageManager.selectedLanguage = .english
                        }label: {
                            Label("English", image: "en")
                        }
                        Button{
                            self.languageManager.selectedLanguage = .russian
                        }label: {
                            Label("Русский", image: "ru")
                        }
                        Button{
                            self.languageManager.selectedLanguage = .uzbek
                        }label: {
                            Label("Uzbek", image: "uz")
                        }
                        
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "globe.europe.africa.fill")
                                .font(.system(size: 19))
                                .fontWeight(.bold)
                                .foregroundStyle(Color("SecondaryColor"))
                            Spacer()
                                .frame(width: 16)
                        }
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    
                    Text("17")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("SecondaryColor"))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        NavigationLink{
                            EditAccountSCREEN()
                                .environmentObject(self.viewModel)
                        }label:{
                            Text("18")
                        }
                        
                        Divider()
                        
                        Button(role: .destructive) {
                            self.deleteAcount_isAllertShow.toggle()
                        }label:{
                            Text("19")
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
            .onAppear {
                self.viewModel.getData()
            }
        }
    }
}

#Preview {
    ProfileSCREEN()
        .environmentObject(ProfileViewModel(userStateManager: UserStateManager()))
}
