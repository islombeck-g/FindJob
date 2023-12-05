import SwiftUI

struct CvFullInfoListView: View {
    
    @Bindable var cv: CvData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                HStack {
                    if self.cv.secondName != "" {
                        Text("Фамилия")
                            .font(.system(size:15))
                            .fontWeight(.bold)
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
                        .fontWeight(.bold)
                        .font(.system(size:15))
                    Text(self.cv.firstName)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.cv.patronymicName != "" {
                    Text("Отчество")
                        .fontWeight(.bold)
                        .font(.system(size:15))
                    
                    Text(self.cv.patronymicName)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.cv.patronymicName != "" {
                    Text("Дата рождения")
                        .fontWeight(.bold)
                        .font(.system(size:15))
                    
                    Text(self.cv.birthDate)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.cv.patronymicName != "" {
                    Text("Гражданство")
                        .fontWeight(.bold)
                        .font(.system(size:15))
                    
                    Text(self.cv.birthCountry)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
                
            }
            
            Group {
                if self.cv.patronymicName != "" {
                    Text("Телефон")
                        .fontWeight(.bold)
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
                        .fontWeight(.bold)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                    if self.cv.university != "" {
                        Text("Университет")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.university)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.institute != "" {
                        Text("Институт")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.institute)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.direction != "" {
                        Text("Направление")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.direction)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.anotherEducation != "" {
                        Text("Дополнительное образование")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.anotherEducation)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.certificates != "" {
                        Text("Сертификаты, рекомендательные письма")
                            .fontWeight(.bold)
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
                        .fontWeight(.bold)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                   
                    if self.cv.skills != "" {
                        Text("Навыки") 
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.skills)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.money != "" {
                        Text("Желаемый уровень заработной платы")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.money)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.workExperience != "" {
                        Text("Тип занятости")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.workExperience)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.employmentType != "" {
                        Text("Опыт работы")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.employmentType)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.cv.aboutMe != "" {
                        Text("Обо мне")
                            .fontWeight(.bold)
                            .font(.system(size:15))
                        
                        Text(self.cv.aboutMe)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
            }
        }
        .foregroundStyle(Color("SecondaryColor"))
        .padding(.horizontal, 16)
    }
}

#Preview {
    CvFullInfoListView(cv: CvData(age: 11, position: "21", firstName: "21", secondName: "21", patronymicName: "21", birthDate: "21", birthCountry: "21", phoneNumber: "21", university: "21", institute: "21", direction: "21", anotherEducation: "21", certificates: "21", skills: "21", money: "21", workExperience: "21", employmentType: "21", aboutMe: "21"))
}
