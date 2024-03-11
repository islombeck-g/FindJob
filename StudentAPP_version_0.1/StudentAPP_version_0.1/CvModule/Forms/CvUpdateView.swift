import SwiftUI

struct CvUpdateView: View {
    
    @Bindable var cv:CvData
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack{
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Spacer()
                            .frame(height: 10)
                        
                        ScrollView {
                            CvListOfTextFields_Bindable(cv: self.cv)
                                .padding(.horizontal, 16)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                
                    ToolbarItem(placement: .topBarLeading) {
                
                        Button {
                            self.router.navigateBack()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 19))
                                .fontWeight(.regular)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                    }
                
                    ToolbarItem(placement: .principal) {
                
                        Text("Редактировать резюме")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CvUpdateView(cv: cvTestData)
        .environmentObject(AppRouter())
}
