import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel:MainModuleViewModel = MainModuleViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button{
                        self.viewModel.isFavouriteList.toggle()
                    }label: {
                        Image(systemName: self.viewModel.isFavouriteList == true ?  "star.fill" : "star")
                            .padding(8)
                    }
                    .padding(.leading, 16)
                    
                    Spacer()
                    
                    Text("Главная")
                    
                    Spacer()
                    
                    Button {
                        
                    }label: {
                        Image(systemName: "arrow.up.and.down.text.horizontal")
//                            .frame(width: 20, height: 30)
                            .padding(8)
                            
                    }
                    .padding(.trailing, 16)
                }
                .font(.system(size: 18))
                
                ScrollView {
                    
                    if self.viewModel.isFavouriteList == true {
                        
                        ForEach(self.viewModel.exampleFavouriteListOfjob.indices, id: \.self){ index in
                            
                            JobInfoView(vc: self.$viewModel.exampleFavouriteListOfjob[index])
                                .padding(.vertical, 10)
                        }
                        .listStyle(.inset)
                    } else {
                        
                        ForEach(self.viewModel.exampleListOfJobs.indices, id: \.self){ index in
                            
                            JobInfoView(vc: self.$viewModel.exampleListOfJobs[index])
                                .padding(.vertical, 10)
                        }
                        .listStyle(.inset)
  
                    }
                }
                
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    MainView()
}
