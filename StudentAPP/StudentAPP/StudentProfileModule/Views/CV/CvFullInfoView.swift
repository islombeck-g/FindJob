import SwiftUI

struct CvFullInfoView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteCV_isAllertShow:Bool = false
    @State private var isFavorite = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button{
                            //don't understand why it is here
                        }label: {
                            Image(systemName: "bell")
                                .padding(5)
                        }
                        .padding(.leading, 7)
                        
                        Spacer()
                        
                        Text("Профиль")
                        
                        Spacer()
                        
                        Menu {
                            NavigationLink{
                                
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
                                .padding(.trailing, 6)
                        }
                    }
                    .font(.system(size: 18))
                    
                    
                    ScrollView {
                        
                        ProfileImage(
                            name: self.$viewModel.student.firstName,
                            secondName: self.$viewModel.student.secondName,
                            patronymicName: self.$viewModel.student.patronymicName,
                            image: self.$viewModel.student.image,
                            phoneNumber: self.$viewModel.student.phoneNumber)
                            .padding(.vertical, 16)
                         
                        Spacer()
                            .frame(height: 25)
                        
                        CvFullInfoListView()
                            .environmentObject(self.viewModel)
                        
                        Spacer()
                            .frame(height: 30)
                        
                      
                        Divider()
                        
                        Spacer()
                            .frame(height: 10)
                        
                        
                        .alert("Удалить аккаунт?", isPresented: self.$deleteCV_isAllertShow) {
                            Button{}label: {
                                Text("Отмена")
                            }
                                
                            Button{
                                //удалить резюме
                            }label: {
                                Text("Удалить")
                            }
                        } message: {
                            Text("Восстановление аккаунта невозможно после удаления.")
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}


#Preview {
    CvFullInfoView()
        .environmentObject(ProfileViewModel())
}
