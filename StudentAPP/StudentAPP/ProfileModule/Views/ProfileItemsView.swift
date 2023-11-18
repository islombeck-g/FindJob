import SwiftUI

struct ProfileItemsView: View {
    @Binding var aboutMe:String
    @Binding var birthDate: String
    @Binding var institute: String
    @Binding var direction: String
    @Binding var university: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text("Дата рождения")
                    .fontWeight(.bold)
                    .font(.system(size:15))
                
                Spacer()
            }
            
            Text(birthDate)
                .font(.system(size:17))
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("Место учёбы")
                    .fontWeight(.bold)
                    .font(.system(size:20))
                
                Text("Университет")
                    .fontWeight(.bold)
                    .font(.system(size:15))
                
                Text(university)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("Институт")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Text(institute)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("Направление")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Text(direction)
                    .font(.system(size: 17))
                    .lineLimit(1)
            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("О себе")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    
                
                Text(aboutMe)
                    .font(.system(size: 17))
            }
//            .navigationBarBackButtonHidden(true)
        }
        .foregroundColor(Color("SecondaryColor"))
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    ProfileItemsView( aboutMe: .constant("Я очень интреесный человек, учусь, не работаю"),
                      birthDate: .constant("10.02.2000"),
                      institute: .constant("Институт вычислительной математики и информационных техноолгий"),
                      direction: .constant("Фундаментальная информатики и информационные технологии"),
              university: .constant("Московский Государственный Университет"))
}
