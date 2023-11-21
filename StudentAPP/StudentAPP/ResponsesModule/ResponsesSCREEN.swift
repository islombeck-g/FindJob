import SwiftUI

struct ResponsesSCREEN: View {
    
    @StateObject private var viewModel =  ResponsesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    
                    
                    Picker("", selection: self.$viewModel.chosenCategory) {
                        
                        Text("Отклики")
                            .tag("Отклики")
                        
                        Text("Приглашения")
                            .tag("Приглашения")
                    }
                    .background(Color("darkAccentColor"))
                    .foregroundStyle(Color("SecondaryColor"))
                    .clipShape(.rect(cornerRadius: 8))
                    .pickerStyle(.palette)
                    .padding(.horizontal, 16)

                    Spacer()
                    
                        
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem (placement: .principal) {
                        Text("Отклики")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("SecondaryColor"))
                     
                }
            }
            
        }
    }
}

#Preview {
    ResponsesSCREEN()
}
