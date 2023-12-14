import SwiftUI

struct ProfileEditCenterImage: View {
    let image:String
    
    var body: some View {
        Group {
            if image == "" {
                Circle()
                    .foregroundStyle(.gray)
            } else {
                Image(image)
                    .resizable()
                    .cornerRadius(100)
            }
        }
        .frame(width: 160, height: 160)
    }
}

#Preview {
    ProfileEditCenterImage(image: "userImage")
}
