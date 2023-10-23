import SwiftUI

struct CvFullInfoListView: View {
    
    @EnvironmentObject var viewModel:ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                HStack {
                    if self.viewModel.cv.secondName != "" {
                        Text("Фамилия")
                            .font(.system(size:15))
                    }
                    
                    
                    Spacer()
                }
                if self.viewModel.cv.secondName != "" {
                    Text(self.viewModel.cv.secondName)
                }
            }
            
            Group {
                if self.viewModel.cv.firstName != "" {
                    
                    Text("Имя")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    Text(self.viewModel.cv.firstName)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.viewModel.cv.patronymicName != "" {
                    Text("Отчество")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    
                    Text(self.viewModel.cv.patronymicName)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.viewModel.cv.patronymicName != "" {
                    Text("Дата рождения")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    
                    Text(self.viewModel.cv.birthDate)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Group {
                if self.viewModel.cv.patronymicName != "" {
                    Text("Гражданство")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    
                    Text(self.viewModel.cv.birthCountry)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
                
            }
            
            Group {
                if self.viewModel.cv.patronymicName != "" {
                    Text("Телефон")
                        .foregroundColor(.gray)
                        .font(.system(size:15))
                    
                    Text(self.viewModel.cv.phoneNumber)
                        .font(.system(size: 17))
                        .lineLimit(1)
                }
            }
            
            Spacer()
                .frame(height: 0)
            
            if self.viewModel.cv.university != "" ||
                self.viewModel.cv.institute != "" ||
                self.viewModel.cv.direction != "" ||
                self.viewModel.cv.anotherEducation != "" ||
                self.viewModel.cv.certificates != "" {
                Group {
                    
                    Text("Образование")
                        .foregroundColor(.black)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                    if self.viewModel.cv.university != "" {
                        Text("Университет")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.university)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.viewModel.cv.institute != "" {
                        Text("Институт")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.institute)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.viewModel.cv.direction != "" {
                        Text("Направление")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.direction)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.viewModel.cv.anotherEducation != "" {
                        Text("Дополнительное образование")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.anotherEducation)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.viewModel.cv.certificates != "" {
                        Text("Сертификаты, рекомендательные письма")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.certificates)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                    
                }
            }
            
            Spacer()
                .frame(height: 0)
            
            if self.viewModel.cv.skills != "" ||
                self.viewModel.cv.money != "" ||
                self.viewModel.cv.aboutMe != "" ||
                self.viewModel.cv.workExperience != "" ||
                self.viewModel.cv.employmentType != "" {
                
                Group {
                    Text("Основное")
                        .foregroundColor(.black)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                   
                    if self.viewModel.cv.skills != "" {
                        Text("Навыки") 
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.skills)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.viewModel.cv.money != "" {
                        Text("Желаемый уровень заработной платы")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.money)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.viewModel.cv.workExperience != "" {
                        Text("Тип занятости")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.workExperience)  
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.viewModel.cv.employmentType != "" {
                        Text("Опыт работы")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.employmentType)
                            .font(.system(size: 17))
                            .lineLimit(1)
                    }
                }
                
                Group {
                    if self.viewModel.cv.aboutMe != "" {
                        Text("Обо мне")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                        
                        Text(self.viewModel.cv.aboutMe)
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
    CvFullInfoListView()
        .environmentObject(ProfileViewModel())
}
