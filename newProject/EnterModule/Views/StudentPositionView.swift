import SwiftUI

struct StudentPositionView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.orange)
            
            VStack {
                Text("Student position view")
            }
        }
        .frame(
            width: 343,
            height: 389,
            alignment: .center)
    }
}

#Preview {
    StudentPositionView()
}
