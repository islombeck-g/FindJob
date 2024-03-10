import SwiftUI

struct ProfileItemsForm: View {
    
    @Binding var aboutMe:String
    @Binding var birthDate: String
    @Binding var institute: String
    @Binding var direction: String
    @Binding var university: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(LocalizedStringKey("Дата рождения"))
                    .fontWeight(.bold)
                    .font(.system(size:15))
                
                Spacer()
            }
            
            Text(verbatim: birthDate)
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
                
                Text(verbatim: university)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("Институт")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Text(verbatim: institute)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Divider()
                
                Text("Направление")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Text(verbatim: direction)
                    .font(.system(size: 17))
                    .lineLimit(1)
            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("О себе")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    
                Text(verbatim: aboutMe)
                    .font(.system(size: 17))
            }
        }
        .foregroundColor(Color("SecondaryColor"))
        .padding(.horizontal, 16)
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfilePresenter())
}
