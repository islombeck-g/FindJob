import SwiftUI

struct ProfileSCREEN: View {
    
    @StateObject private var viewModel:ProfileViewModel
    
    init(userStateViewModel: UserStateViewModel) {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(userStateViewModel: userStateViewModel))
    }
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteAcount_isAllertShow:Bool = false
    @State private var isFavorite = false
    
    @ObservedObject var languageManager = LanguageManager.shared
    
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
                                Text(LocalizedStringKey("21"))
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
                            
                            Text(LocalizedStringKey("22"))
                            
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .foregroundStyle(.red)
                                .background(Color("darkAccentColor"))
                                .clipShape(.rect(cornerRadius: 13))
                            
                        }
                        .padding(.horizontal, 16)
                        
                        Group {
                            Picker(selection: $languageManager.selectedLanguage, label: Text(LocalizedStringKey("Select Language"))) {
                                ForEach(Language.allCases, id: \.self) { language in
                                    Text(language.rawValue).tag(language)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                        }
                        
                        
                        .alert(LocalizedStringKey("23"), isPresented: self.$logOut_isAllertShow) {
                            
                            Text(LocalizedStringKey("24"))
                            
                            Button{
                                self.viewModel.logOut()
                            }label: {
                                Text(LocalizedStringKey("22"))
                            }
                        } message: {
                            Text("")
                        }
                        
                        .alert(LocalizedStringKey("19"), isPresented: self.$deleteAcount_isAllertShow) {
                            Button{}label: {
                                Text(LocalizedStringKey("24"))
                            }
                            
                            Button{
                                
                            }label: {
                                Text(LocalizedStringKey("25"))
                            }
                        } message: {
                            Text(LocalizedStringKey("26"))
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
                    
                    Text(LocalizedStringKey("17"))
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
                            Text(LocalizedStringKey("18"))
                        }
                        
                        Divider()
                        
                        Button(role: .destructive) {
                            self.deleteAcount_isAllertShow.toggle()
                        }label:{
                            Text(LocalizedStringKey("19"))
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
        .environment(\.locale, .init(identifier:  LanguageManager.shared.selectedLanguage.rawValue))
    }
}

#Preview {
    ProfileSCREEN(userStateViewModel: UserStateViewModel())
}
