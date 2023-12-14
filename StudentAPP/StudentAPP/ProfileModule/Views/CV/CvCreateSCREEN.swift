import SwiftUI
import SwiftData

struct CvCreateSCREEN: View {
    
    @EnvironmentObject var viewModel:ProfileViewModel
    @Environment (\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContest
    @State private var cv: CvData = CvData(
        age: 0,
        position: "",
        firstName: "",
        secondName: "",
        patronymicName: "",
        birthDate: "",
        birthCountry: "",
        phoneNumber: "",
        university: "",
        institute: "",
        direction: "",
        anotherEducation: "",
        certificates: "",
        skills: "",
        money: "",
        workExperience: "",
        employmentType: "",
        aboutMe: "")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack{
                    
                    ScrollView {
                        
                        Spacer()
                            .frame(height: 20)
                        
                        CVTextField(cv: self.$cv)
                        
                        Group{
                            
                            Spacer()
                                .frame(height: 20)
                            Button {
                                self.cv = CvData(
                                    age: 20, position: "IOS - developer", firstName: "Руслан", secondName: "Хамдамов", patronymicName: "Арсланович", birthDate: "25.12.2000", birthCountry: "Чехия", phoneNumber: "+998(97)231-43-21", university: "Казанский (Приволжский) Федеральный университет", institute: "Институт вычислительной математики и информационных технологий", direction: "Фундаментальная математика и информационные технологии", anotherEducation: "-", certificates: "IELTS 10", skills: "Swift, SwiftUI, algorithms, LaTex, cooking", money: "от 100 000 до 300 000 руб", workExperience: "Лаборатория КФУ", employmentType: "Полная занятость", aboutMe: "Очень хороший человек")
                            }label: {
                                Group {
                                    Text("Заполнить rand()")
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .foregroundStyle(.white)
                                        .background(Color("buttonBlue"))
                                        .clipShape(.rect(cornerRadius: 13))
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                        Spacer()
                            .frame(height: 20)
                        Button {
                            
                            modelContest.insert(cv)
                            self.dismiss()
                     
                        }label: {
                            Group {
                                Text("65")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .foregroundStyle(.white)
                                    .background(Color("AccentColor"))
                                    .clipShape(.rect(cornerRadius: 13))
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        Spacer()
                            .frame(height: 20)
                    }

                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                    
                        ToolbarItem(placement: .topBarLeading) {
                    
                            Button {
                                self.dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 19))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color("SecondaryColor"))
                            }
                        }
                    
                        ToolbarItem(placement: .principal) {
                    
                            Text("66")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.locale, .init(identifier:  LanguageManager.shared.selectedLanguage.rawValue))
    }
}

#Preview {
    CvCreateSCREEN()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
