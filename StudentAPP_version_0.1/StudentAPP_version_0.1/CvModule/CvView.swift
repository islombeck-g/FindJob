import SwiftUI
import SwiftData

struct CvView: View {
    
    @EnvironmentObject var presenter: CvPresenter
    @EnvironmentObject var router: AppRouter
    @Query var cvs: [CvData]
    
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        Button {
                            self.router.navigateBack()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 19))
                                .fontWeight(.regular)
                                .foregroundStyle(Color("AccentColor"))
                                .frame(width: 20, height: 30)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Резюме")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                        
                        Button {
                            router.navigateTo(.cvCreate)
                        }label: {
                            Image(systemName: "square.badge.plus")
                                .foregroundStyle(Color("AccentColor"))
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                            //                                    .padding(4)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .padding(.horizontal, 16)
                    ScrollView {
                        
                        Spacer()
                            .frame(height: 20)
                        
                        
                        
                        ForEach(cvs) { cv in
                            
                            Button {
                                self.router.navigateTo(.cvDetail(cv: cv))
                                //                                CvFullInfoSCREEN(cv: cv)
                            } label: {
                                CvOverForm(cv: cv)
                            }
                            .padding(.horizontal, 16)
                            
                        }
                    }
                }
            }
            //            .navigationBarTitleDisplayMode(.inline)
            
        }
        .navigationBarBackButtonHidden(true)
        //        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    CvView()
        .environmentObject(CvPresenter())
        .environmentObject(AppRouter())
}
