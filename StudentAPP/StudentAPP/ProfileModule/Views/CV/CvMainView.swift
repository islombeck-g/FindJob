import SwiftUI

struct CvMainView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    @Environment (\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        Button {
                            self.dismiss()
                        } label: {
                                Image(systemName: "chevron.left")
                            .font(.system(size: 19))
                            .fontWeight(.regular)
                            .foregroundStyle(Color("AccentColor"))
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        Text("Резюме")
                            .foregroundStyle(Color("SecondaryColor"))
                        Spacer()
                        
                        NavigationLink {
                           
                            CvCreateView()
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
                    .foregroundStyle(Color("SecondaryColor"))
                    .font(.system(size: 18))
                    ScrollView {
                        
                        Spacer()
                            .frame(height: 20)
                        
                        ForEach(self.viewModel.cvArray.indices, id: \.self) { i in
                            
                            NavigationLink {
                                CvFullInfoView(cv: self.$viewModel.cvArray[i])
                                    .environmentObject(self.viewModel)
                            }label: {
                                CVInfoView(cv: self.$viewModel.cvArray[i])
                            }
                           
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
    CvMainView()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
