import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject var viewModel:EnterViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    Group {
                        
                        Button {
                            self.dismiss()
                        } label: {
                            HStack{
                                
                                Image(systemName: "chevron.left")
                                
                                Text("Назад")
                                
                                Spacer()
                            }
                            .font(.system(size: 19))
                            .fontWeight(.regular)
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                            .frame(height: 37.5)
                        
                        Text("Регистрация")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 34))
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
                            .animation(.easeInOut, value: 1)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(EnterViewModel())
}
