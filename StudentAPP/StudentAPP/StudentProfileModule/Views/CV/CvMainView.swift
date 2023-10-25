import SwiftUI

struct CvMainView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack{
                    HStack {
                        
                        Spacer().frame(width: 45)
                        
                        Spacer()
                        
                        Text("Резюме")
                        
                        Spacer()
                        
                        NavigationLink {
                           
                            CvCreateView()
                                .environmentObject(self.viewModel)
                            
                        }label: {
                            Image(systemName: "square.badge.plus")
                                .foregroundStyle(.black)
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                                .padding(4)
                                .padding(.trailing, 16)
                        }
                    }
                    .font(.system(size: 18))
                    ScrollView {
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
    }
}

#Preview {
    CvMainView()
        .environmentObject(ProfileViewModel())
}
