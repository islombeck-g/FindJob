import SwiftUI

struct ProfileImage: View {
    
    @Binding var name:String
    @Binding var secondName:String
    @Binding var patronymicName:String
    @Binding var image:String
    @Binding var phoneNumber:String
    
    var body: some View {
        HStack{
            Group {
                if image == "" {
                    Circle()
                        .foregroundStyle(.gray)
                }else {
                    Image("\(image)")
                        .resizable()
                        .cornerRadius(100)
                        
                }
            }
                .frame(width: 77, height: 77)
                .padding(.leading, 16)
            Spacer()
                .frame(width: 14)
            
            VStack(alignment: .leading) {
                Text(verbatim: "\(name) \(secondName) \(patronymicName)")
                    .lineLimit(1)
                    .fontWeight(.bold)
                Text(verbatim: "\(phoneNumber)")
            }
            .foregroundStyle(Color("SecondaryColor"))
            
            Spacer()
        }
    }
}

#Preview {
    ProfileSCREEN()
}
