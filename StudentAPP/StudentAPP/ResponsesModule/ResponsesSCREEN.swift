import SwiftUI

struct ResponsesSCREEN: View {
    
    @StateObject private var viewModel =  ResponsesViewModel()
    
    @ObservedObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    
                    Picker("", selection: self.$viewModel.chosenCategory) {
                        
                        ForEach(Categories.allCases, id: \.self) { category in
                            Text(LocalizedStringKey(category.rawValue))
                                .tag(category)
                        }  
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
                
                ToolbarItem(placement: .principal) {
                        Text("14")
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
