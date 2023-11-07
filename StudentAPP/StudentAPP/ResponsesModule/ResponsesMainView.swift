import SwiftUI

struct ResponsesMainView: View {
    
    @StateObject private var viewModel =  ResponsesViewModel()
    
    var body: some View {
        NavigationStack {
         
            VStack (alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Отклики")
                        .bold()
                        .padding()
                    Spacer()
                }
                
                Picker("Тип платежа", selection: self.$viewModel.chosenCategory) {
                    
                    Text("Отклики")
                        .tag("Отклики")
                    
                    Text("Приглашения")
                        .tag("Приглашения")
                }
                .pickerStyle(.palette)
                .padding(.horizontal, 16)

                Spacer()
            }
        }
    }
}

#Preview {
    ResponsesMainView()
}
