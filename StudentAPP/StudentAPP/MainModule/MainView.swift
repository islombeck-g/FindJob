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
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                    }label: {
                        
                        Image(systemName: "arrow.up.and.down.text.horizontal")
                            .padding(8)
                    }
                    .padding(.trailing, 16)
                }
                .font(.system(size: 18))
                
                ScrollView {
                    
                    if self.viewModel.isFavouriteList == true {
                        
                        ForEach(self.viewModel.exampleFavouriteListOfJob.indices, id: \.self){ index in
                            
                            NavigationLink {
                                JobFullInfoView(isFavour: true, vc: self.$viewModel.exampleFavouriteListOfJob[index])
                                    .environmentObject(self.viewModel)
                            } label: {
                                JobInfoView(vc: self.$viewModel.exampleFavouriteListOfJob[index])
                                    .padding(.vertical, 10)
                            }
                        }
                        .listStyle(.inset)
                    } else {
                        
                        ForEach(self.viewModel.exampleListOfJobs.indices, id: \.self){ index in
                            NavigationLink {
                                JobFullInfoView(isFavour: false, vc: self.$viewModel.exampleListOfJobs[index])
                                    .environmentObject(self.viewModel)
                            }label: {
                                JobInfoView(vc: self.$viewModel.exampleListOfJobs[index])
                                    .padding(.vertical, 10)
                            }
                        }
                        .listStyle(.inset)
                    }
                    
                }
                .searchable(text: self.$viewModel.searchText)
                
                Spacer()
            }
        }
       
    }
}

#Preview {
    MainView()
}

//                HStack(spacing: 15) {
//                    Image(systemName: "magnifyingglass")
//                    TextField("Поиск вакансий", text: self.$searchText)
//                }
//                .padding(.vertical, 10)
//                .padding(.horizontal)
//                .background(Color.primary.opacity(0.05))
//                .clipShape(.rect(cornerRadius: 10))
//                .padding()



//
//ScrollView {
//
//    if self.viewModel.isFavouriteList == true {
//
//        ForEach(self.viewModel.exampleFavouriteListOfJob.indices, id: \.self){ index in
//
//            NavigationLink {
//                JobFullInfoView(isFavour: true, vc: self.$viewModel.exampleFavouriteListOfJob[index])
//                    .environmentObject(self.viewModel)
//            } label: {
//                JobInfoView(vc: self.$viewModel.exampleFavouriteListOfJob[index])
//                    .padding(.vertical, 10)
//            }
//        }
//        .listStyle(.inset)
//    } else {
//
//        ForEach(self.viewModel.exampleListOfJobs.indices, id: \.self){ index in
//            NavigationLink {
//                JobFullInfoView(isFavour: false, vc: self.$viewModel.exampleListOfJobs[index])
//                    .environmentObject(self.viewModel)
//            }label: {
//                JobInfoView(vc: self.$viewModel.exampleListOfJobs[index])
//                    .padding(.vertical, 10)
//            }
//        }
//        .listStyle(.inset)
//    }
//
//}
