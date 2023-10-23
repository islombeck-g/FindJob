import SwiftUI

struct ProfileItemsView: View {
    @Binding var name:String
    @Binding var dateOfCreation:String
    @Binding var INN:String
    @Binding var activity:String
    @Binding var description:String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Информация о компании")
                    .foregroundColor(.black)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Text("Название")
                .foregroundColor(.gray)
                .font(.system(size:15))
            
            Text(name)
                .font(.system(size:17))
            
            Divider()
            
//            Spacer()
//                .frame(height: 0)
            
            Group {
                Text("Дата основания")
                    .foregroundColor(.gray)
                    .font(.system(size:15))
                
                Text(dateOfCreation)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("ИНН")
                    .foregroundColor(.gray)
                    .font(.system(size:15))
                
                Text(INN)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("Сфера деятельности")
                    .foregroundColor(.gray)
                    .font(.system(size:15))
                
                Text(activity)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("О компании")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.system(size: 17))
            }
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProfileItemsView(name: .constant("ООО “Газпром”"), dateOfCreation: .constant("10.02.2000"), INN: .constant("111111111111111111111111"), activity: .constant("Информационные технологии, системная интеграция, интеренет"), description: .constant("очень хорошая компания"))
}
