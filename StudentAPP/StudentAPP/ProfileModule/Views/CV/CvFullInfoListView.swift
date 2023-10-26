import SwiftUI

struct CvFullInfoListView: View {
    
    @Binding var cv: CvData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                HStack {
                    if self.cv.secondName != "" {
                        Text("Фамилия")
                            .font(.system(size:15))
                    }
                    
                    
                    Spacer()
                }
                if self.cv.secondName != "" {
                    Text(self.cv.secondName)
                }
            }
            
            Group {
                if self.cv.firstName != "" {
                    
                    Text("Имя")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    Text(self.cv.firstName)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.cv.patronymicName != "" {
                    Text("Отчество")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    
                    Text(self.cv.patronymicName)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.cv.patronymicName != "" {
                    Text("Дата рождения")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    
                    Text(self.cv.birthDate)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.cv.patronymicName != "" {
                    Text("Гражданство")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    
                    Text(self.cv.birthCountry)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
                
            }
            
            Group {
                if self.cv.patronymicName != "" {
                    Text("Телефон")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    
                    Text(self.cv.phoneNumber)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Spacer()
                .frame(height: 0)
            
            if self.cv.university != "" ||
                self.cv.institute != "" ||
                self.cv.direction != "" ||
                self.cv.anotherEducation != "" ||
                self.cv.certificates != "" {
                Group {
                    
                    Text("Образование")
                        .foregroundColor(.black)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                    if self.cv.university != "" {
                        Text("Университет")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.university)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.institute != "" {
                        Text("Институт")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.institute)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.direction != "" {
                        Text("Направление")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.direction)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.anotherEducation != "" {
                        Text("Дополнительное образование")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.anotherEducation)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.certificates != "" {
                        Text("Сертификаты, рекомендательные письма")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.certificates)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                    
                }
            }
            
            Spacer()
                .frame(height: 0)
            
            if self.cv.skills != "" ||
                self.cv.money != "" ||
                self.cv.aboutMe != "" ||
                self.cv.workExperience != "" ||
                self.cv.employmentType != "" {
                
                Group {
                    Text("Основное")
                        .foregroundColor(.black)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                   
                    if self.cv.skills != "" {
                        Text("Навыки") 
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.skills)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.money != "" {
                        Text("Желаемый уровень заработной платы")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.money)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.workExperience != "" {
                        Text("Тип занятости")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.workExperience)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.employmentType != "" {
                        Text("Опыт работы")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.employmentType)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.aboutMe != "" {
                        Text("Обо мне")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.cv.aboutMe)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CvFullInfoListView(cv: .constant(CvData(
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
        aboutMe: "Очень хороший человек")))
}
