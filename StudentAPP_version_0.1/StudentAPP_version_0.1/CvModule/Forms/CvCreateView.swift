import SwiftUI

struct CvCreateView: View {
    
    @Environment(\.modelContext) private var modelContest
    @EnvironmentObject var router: AppRouter
    
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
        VStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack{
                    HStack {
                        GeometryReader { geo in
                            
                            Button {
                                self.router.navigateBack()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 19))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color("SecondaryColor"))
                            }
                            .position(x: 16, y: 25/2)
                            
                            Text("Создание резюме")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundStyle(Color("SecondaryColor"))
                                .position(x: geo.size.width / 2, y: 25/2)
                        }
                    }
                    .frame(height: 25)
                    ScrollView {
                        
                        Spacer()
                            .frame(height: 20)
                        
                        CvListOfTextFields_Binding(cv: self.cv)
                        
                        Group{
                            
                            Spacer()
                                .frame(height: 20)
                            Button {
                                self.cv = customCvData
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
                            }
                            .padding(.horizontal, 16)
                        }
                        Spacer()
                            .frame(height: 20)
                        Button {
                            
                            modelContest.insert(cv)
                            //                            self.dismiss()
                            
                        }label: {
                            Group {
                                Text("Cоздать резюме")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .foregroundStyle(.white)
                                    .background(Color("AccentColor"))
                                    .clipShape(.rect(cornerRadius: 13))
                            }
                        }
                        .padding(.horizontal, 16)
                        Spacer()
                            .frame(height: 20)
                    }
                    
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CvCreateView()
}
