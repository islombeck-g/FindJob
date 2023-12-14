//enum Language: String, CaseIterable {
//    case english = "en"
//    case russian = "ru"
//}
//
//class LanguageManager: ObservableObject {
//    static let shared = LanguageManager()
//
//    @Published var : Language = .russian
//
//    private init() {}
//}


import SwiftUI

struct MainSCREEEN: View {
    
    @StateObject private var viewModel:MainModuleViewModel = MainModuleViewModel()
    
    init() {
        UISearchBar.appearance().tintColor = .white
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
//                    ...
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    ToolbarItem(placement: .principal) {
                        
                        Text(LocalizedStringKey("11"))
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                    
                }
            }
        }
        .searchable(text: self.$viewModel.searchText)
        .environment(\.locale, .init(identifier:  LanguageManager.shared.selectedLanguage.rawValue))
    }
}

#Preview {
    MainSCREEEN()
}
