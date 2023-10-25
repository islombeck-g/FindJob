import SwiftUI

struct CvCreateView: View {
    
    @EnvironmentObject var viewModel:ProfileViewModel
    @Environment (\.dismiss) var dismiss
    
    @State private var cv:CvData = CvData(
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
                Color.white.ignoresSafeArea()
                
                VStack{
                    HStack {
                        
                        Button {
                            self.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 19))
                                .fontWeight(.regular)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        Text("Создание резюме")
                            .padding(.trailing, 35)
                        
                        Spacer()
                    }
                    .font(.system(size: 18))
                    
                    ScrollView {
                        
                        CVTextField(cv: self.$cv)
                        
                        Spacer()
                            .frame(height: 20)
                        Button {
                            self.viewModel.appendNewCV(newCV: self.cv)
                            self.dismiss()
                        }label: {
                            Group {
                                Text("Cоздать резюме")
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
                            .frame(height: 20)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CvCreateView()
        .environmentObject(ProfileViewModel())
}
