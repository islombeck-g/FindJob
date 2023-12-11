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
                    
                    Group {
                        Picker(selection: $languageManager.selectedLanguage, label: Text(LocalizedStringKey("Select Language"))) {
                            ForEach(Language.allCases, id: \.self) { language in
                                Text(language.rawValue).tag(language)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                    
                    Spacer()
                        
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem (placement: .principal) {
                        Text(LocalizedStringKey("14"))
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("SecondaryColor"))
                     
                }
            }
            
        }
        .environment(\.locale, .init(identifier:  LanguageManager.shared.selectedLanguage.rawValue))
    }
}

#Preview {
    ResponsesSCREEN()
}
