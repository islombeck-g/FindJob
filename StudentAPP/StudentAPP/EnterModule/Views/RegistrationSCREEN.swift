import SwiftUI

struct RegistrationSCREEN: View {
    
    @EnvironmentObject var viewModel:EnterViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    
                    Group {
                        
                        Spacer()
                            .frame(height: 37.5)
                        
                        Text(LocalizedStringKey("4"))
                            .foregroundStyle(Color("SecondaryColor"))
                            .font(.system(size: 34))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                            .frame(height: 24)
                    }
                    
                    GeometryReader {geometry in
                        
                        ScrollView (.init()){
                            TabView(selection: $viewModel.selectedTab) {
                                ForEach( self.viewModel.StudentViews.indices, id: \.self) { i in
                                    
                                    self.viewModel.StudentViews[i]
                                        .environmentObject(viewModel)
                                }
                                .frame(maxHeight: .infinity, alignment: .top)
                            }
                            .tabViewStyle(.page)
//                            .animation(.easeInOut, value: 1)
                        }
                    }
                }
                
                if self.viewModel.isLoading {
                    LoadSpinnerView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.dismiss()
                    } label: {
                        
                        Image(systemName: "chevron.left")
                        Text(LocalizedStringKey("5"))
                    }
                    .font(.system(size: 19))
                    .fontWeight(.regular)
                    .foregroundStyle(Color("SecondaryColor"))
                }
                
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RegistrationSCREEN()
        .environmentObject(EnterViewModel(userStateManager: UserStateManager()))
}
