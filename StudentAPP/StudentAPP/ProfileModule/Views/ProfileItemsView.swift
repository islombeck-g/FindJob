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
                Text(LocalizedStringKey("27"))
                    .fontWeight(.bold)
                    .font(.system(size:15))
                
                Spacer()
            }
            
            Text(verbatim: birthDate)
                .font(.system(size:17))
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("28")
                    .fontWeight(.bold)
                    .font(.system(size:20))
                
                Text("29")
                    .fontWeight(.bold)
                    .font(.system(size:15))
                
                Text(verbatim: university)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("30")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Text(verbatim: institute)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("31")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Text(verbatim: direction)
                    .font(.system(size: 17))
                    .lineLimit(1)
            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("32")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    
                Text(verbatim: aboutMe)
                    .font(.system(size: 17))
            } 
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
