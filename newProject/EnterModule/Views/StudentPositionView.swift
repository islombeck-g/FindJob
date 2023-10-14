import SwiftUI

struct StudentPositionView: View {
    
    @EnvironmentObject var viewModel:RegistrationViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.orange)
            
            VStack {
                
                Text("Личные данные")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                DropDownView(menuActions: self.viewModel.cities, title: self.$viewModel.chosenCity)

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
        .environmentObject(RegistrationViewModel())
}
