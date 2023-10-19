import SwiftUI

struct UserProfileImage: View {
    
    let name:String
    let secondName:String
    let patronymicName:String
    let image:String
    let phoneNumber:String
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
                Text("\(name) \(secondName) \(patronymicName)")
                    .lineLimit(1)
                    .fontWeight(.bold)
                Text("\(phoneNumber)")
            }
            
            Spacer()
        }
    }
}

#Preview {
    UserProfileImage(name: "SomeName", secondName: "someSecondName", patronymicName: "somePatronymicName", image: "userImage", phoneNumber: "+7 (888) 888-88-88")
}
