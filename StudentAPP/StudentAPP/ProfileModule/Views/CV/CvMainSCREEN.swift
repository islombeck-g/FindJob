import SwiftUI
import SwiftData

struct CvMainSCREEN: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    @Environment (\.dismiss) var dismiss
    @Query private var cvs: [CvData]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack {
                    
                    ScrollView {
                        
                        Spacer()
                            .frame(height: 20)
                        
                        ForEach(cvs) { cv in
                            
                            NavigationLink {
                                CvFullInfoSCREEN(cv: cv)
                                    .environmentObject(self.viewModel)
                            }label: {
                                CVInfoView(cv: cv)
                            }
                           
                        }
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
            
                ToolbarItem(placement: .topBarLeading) {
            
                    Button {
                        self.dismiss()
            
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 19))
                            .fontWeight(.regular)
                            .foregroundStyle(Color("AccentColor"))
                    }
                }
            
                ToolbarItem(placement: .principal) {
            
                    Text("Резюме")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("SecondaryColor"))
                }
            
                ToolbarItem(placement: .topBarTrailing) {
                    withAnimation(.spring) {
                        NavigationLink {
                           
                            CvCreateSCREEN()
                                .environmentObject(self.viewModel)
                            
                        }label: {
                            Image(systemName: "square.badge.plus")
                                .foregroundStyle(Color("AccentColor"))
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                                .padding(4)
                                .padding(.trailing, 16)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        
        
    }
}

#Preview {
    CvMainSCREEN()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
