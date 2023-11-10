import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel:MainModuleViewModel = MainModuleViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScrollView {
                    
                    if self.viewModel.isFavouriteList == true {
                        
                        ForEach(self.viewModel.exampleFavouriteListOfJob.indices, id: \.self){ index in
                            
                            NavigationLink {
                                JobFullInfoView(isFavour: true, vc: self.$viewModel.exampleFavouriteListOfJob[index])
                                    .environmentObject(self.viewModel)
                            } label: {
                                JobInfoView(vc: self.$viewModel.exampleFavouriteListOfJob[index])
//                                    .padding(.vertical, 10)
                            }
                        }
                        .listStyle(.inset)
                    } else {
                        
                        ScrollView(.horizontal) {
                            
                            LazyHStack {
                                
                                ForEach(self.viewModel.exampleListOfJobs.indices, id: \.self){ index in
                                    NavigationLink {
                                        JobFullInfoView(isFavour: false, vc: self.$viewModel.exampleListOfJobs[index])
                                            .environmentObject(self.viewModel)
                                    }label: {
                                        
                                        JobInfoView(vc: self.$viewModel.exampleListOfJobs[index])
                                    }
                                    .shadow(radius: 10)
                                }
                                .scrollTargetLayout()
                            }
                        }
                        .frame(height: 200)
                        .contentMargins(.horizontal, 16, for:.scrollContent)
                        .scrollIndicators(.hidden)
                        .scrollClipDisabled()
                        .scrollTargetBehavior(.paging)
                        
                        ForEach(self.viewModel.exampleListOfJobs.indices, id: \.self){ index in
                            
                            NavigationLink {
                                JobFullInfoView(isFavour: false, vc: self.$viewModel.exampleListOfJobs[index])
                                    .environmentObject(self.viewModel)
                            }label: {
                                JobInfoView(vc: self.$viewModel.exampleListOfJobs[index])
                            }
                            .padding(.horizontal, 16)
                        }
                        .listStyle(.inset)
                    }
                }
                
            }
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button{
                        self.viewModel.isFavouriteList.toggle()
                    }label: {
                        Image(systemName: self.viewModel.isFavouriteList == true ?  "star.fill" : "star")
                            .padding(8)
                    }
                }
                ToolbarItem(placement: .principal) {
                    
                        Text("Главная")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                    }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    //sort items
                    }label: {
                        Image(systemName: "arrow.up.and.down.text.horizontal")
                            .padding(8)
                    }
                }
            }
        }
        .searchable(text: self.$viewModel.searchText)
    }
}

#Preview {
    MainView()
}


//ScrollView(.horizontal) {
//    LazyHStack {
//        ForEach(self.viewModel.exampleListOfJobs.indices, id: \.self){ index in
//            NavigationLink {
//                JobFullInfoView(isFavour: false, vc: self.$viewModel.exampleListOfJobs[index])
//                    .environmentObject(self.viewModel)
//            }label: {
//                JobInfoView(vc: self.$viewModel.exampleListOfJobs[index])
//                    .frame(width: 320)
//            }
//
//            .shadow(radius: 10)
////                                        .containerRelativeFrame(.vertical)
//        }
//        .scrollTargetLayout()
//    }
//
//}
//.frame(height: 200)
//.safeAreaPadding(.horizontal, 16)
//.scrollIndicators(.hidden)
////.scrollClipDisabled()
//.scrollTargetBehavior(.paging)
////                            .contentMargins(.horizontal, 16)
