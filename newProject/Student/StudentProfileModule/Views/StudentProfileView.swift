import SwiftUI

struct StudentProfileView: View {
    
    let aboutMe:String
    let birthDate: String
    let institute: String
    let direction: String
    let university: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text("Дата рождения")
                    .foregroundColor(.gray)
                    .font(.system(size:15))
                
                Spacer()
            }
            
            Text(birthDate)
                .font(.system(size:17))
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("Место учёбы")
                    .foregroundColor(.black)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                
                Text("Университет")
                    .foregroundColor(.gray)
                    .font(.system(size:15))
                
                Text(university)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("Институт")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                
                Text(institute)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("Направление")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                
                Text(direction)
                    .font(.system(size: 17))
                    .lineLimit(1)
            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("О себе")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Text(aboutMe)
//                    .lineLimit(1)
                    .font(.system(size: 17))
            }
            
            
            
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    StudentProfileView(
        aboutMe: "Я очень интреесный человек, учусь, не работаю",
        birthDate: "10.02.2000",
        institute: "Институт вычислительной математики и информационных техноолгий",
        direction: "Фундаментальная информатики и информационные технологии",
        university: "Московский Государственный Университет")
}
