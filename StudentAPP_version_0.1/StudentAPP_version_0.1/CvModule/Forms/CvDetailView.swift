import SwiftUI
//import SwiftData

struct CvDetailView: View {
    
    @EnvironmentObject var presenetr: CvPresenter
    @Bindable var cv:CvData
    @EnvironmentObject var router: AppRouter
    @Environment(\.modelContext) private var modelContest
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteCV_isAllertShow:Bool = false
    @State private var isFavorite = false
    
    
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack {
                    
                    ScrollView {
                        
                        CircleImageForm(
                            name: self.$cv.firstName,
                            secondName: self.$cv.secondName,
                            patronymicName: self.$cv.patronymicName,
                            image: .constant(ProfileInteractor.shared.userData.image),
                            phoneNumber: self.$cv.phoneNumber)
                            .padding(.vertical, 16)
                         
                        Spacer()
                            .frame(height: 25)
                        
                        CvScrollInfoForm(cv: cv)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                            .frame(height: 30)
                      
                        Divider()
                        
                        Spacer()
                            .frame(height: 10)
                        
                        .alert("Удалить резюме", isPresented: self.$deleteCV_isAllertShow) {
                            Button{
                                
                            }label: {
                                Text("Отмена")
                            }
                                
                            Button{
                                self.modelContest.delete(cv)
                            }label: {
                                Text("Удалить")
                            }
                        } message: {
                            Text("Восстановление резюме после удаления невозможно")
                        }
                    }
                    .foregroundStyle(Color("SecondaryColor"))
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
                
                        Text("Резюме")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                
                    ToolbarItem(placement: .topBarTrailing) {
                        withAnimation(.spring) {
                            Menu {
                                Button {
                                    self.router.navigateTo(.cvUpdate(cv: self.cv))
                                }label:{
                                    Text("Редактировать резюме")
                                }
                                
                                Divider()
                                
                                Button(role: .destructive) {
                                    self.deleteCV_isAllertShow.toggle()
                                }label:{
                                    Text("Удалить резюме")
                                }
                            }label: {
                                Image(systemName: "ellipsis")
                                    .rotationEffect(.degrees(90))
                                    .frame(width: 20, height: 30)
                                    .padding(4)
                                    .padding(.trailing, 13)
                                    .foregroundStyle(Color("AccentColor"))
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    CvDetailView(cv: cvTestData)
        .environmentObject(AppRouter())
}
