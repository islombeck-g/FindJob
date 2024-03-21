import SwiftUI

struct CVTextField_Bindable: View {
   
    @Bindable var cv: CvData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                Group {
                    HStack {
                        Text("33")
                            .font(.system(size:15))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.secondName, size: 0)
                }
                Group {
                    Text("34")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.firstName, size: 0)
                }
                Group {
                    Text("35")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.patronymicName, size: 0)
                }
                Group {
                    Text("27")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.birthDate, size: 0)
                }
                Group {
                    Text("54")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.birthCountry, size: 0)
                }
                Group {
                    Text("55")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.phoneNumber, size: 0)
                }
            }
            
            Spacer()
                .frame(height: 0)

            Group {
                Group {
                    Text("56")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                    
                    Text("29")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.university, size: 0)
                }
                Group {
                    Text("30")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.institute, size: 0)
                }
                Group {
                    Text("31")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.direction, size: 0)
                }
                Group {
                    Text("57")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.anotherEducation, size: 0)
                }
                Group {
                    Text("58")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.certificates, size: 0)
                }
            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("59")
                    .foregroundColor(.black)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                
                Text("60")
                    .fontWeight(.bold)
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.skills, size: 0)
            }
            Group {
                Text("67")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.position, size: 0)
            }
            Group {
                Text("61")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.money, size: 0)
            }
            Group {
                Text("62")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.workExperience, size: 0)
            }
            Group {
                Text("63")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.employmentType, size: 0)
            }
            Group {
                Text("64")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.aboutMe, size: 0)
            }
        }
        .foregroundStyle(Color("SecondaryColor"))
        .padding(.horizontal, 16)
    }
}

#Preview {
    CVTextField_Bindable(cv: CvData(
        age: 20,
        position: "IOS - developer",
        firstName: "Руслан",
        secondName: "Хамдамов",
        patronymicName: "Арсланович",
        birthDate: "25.12.2000",
        birthCountry: "Чехия",
        phoneNumber: "+998(97)231-43-21",
        university: "Казанский (Приволжский) Федеральный университет",
        institute: "Институт вычислительной математики и информационных технологий",
        direction: "Фундаментальная математика и информационные технологии",
        anotherEducation: "-",
        certificates: "IELTS 10",
        skills: "Swift, SwiftUI, algorithms, LaTex, cooking",
        money: "от 100 000 до 300 000 руб",
        workExperience: "Лаборатория КФУ",
        employmentType: "Полная занятость",
        aboutMe: "Очень хороший человек"))
}
