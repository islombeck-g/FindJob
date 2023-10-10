import SwiftUI

struct StudentFullNameView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.red)
            
            VStack {
                Text("full name view")
            }
        }
        .frame(
            width: 343,
            height: 403,
            alignment: .center)
    }
}

#Preview {
    StudentFullNameView()
}
