import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var viewModel: RegistrationViewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State private var doneChoseRole = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Group {
                        
                        Button {
                            self.dismiss()
                            self.doneChoseRole = false
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
                            ZStack{
//                                withAnimation(Animation.easeInOut) {
                                    RoleChose(doneChoseRole: $doneChoseRole)
                                        .environmentObject(viewModel)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                        .offset(
                                            x: !doneChoseRole  ? 0 : -geometry.size.width)
                                        .animation(.easeInOut)
//                                }
                                    
                                
                                    
                                
                                TabView{
                                    ForEach(self.viewModel.StudentViews.indices, id: \.self){i in
                                        self.viewModel.StudentViews[i]
                                    }.frame(maxHeight: .infinity, alignment: .top)
                                }
                                .tabViewStyle(.page)
                                .offset(
                                    x: doneChoseRole  ? 0 : geometry.size.width)
                                .animation(.easeInOut)
                                
                                
                                
                                
                            }
                        }
                        
                    }
                    
                    
                    Spacer()
                }
                
            }
            
            
        }
        
    }
}

#Preview {
    RegistrationView()
}
