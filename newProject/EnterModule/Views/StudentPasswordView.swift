import SwiftUI

struct StudentPasswordView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.blue)
            
            VStack {
                Text("Student password view")
            }
        }
        .frame(
            width: 343,
            height: 454,
            alignment: .center)
    }
}

#Preview {
    StudentPasswordView()
}
