import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel:MainModuleViewModel = MainModuleViewModel()
    
    init() {
        UISearchBar.appearance().tintColor = .white
//        UISearchBar.appearance().searchTextField.textColor = .red
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                 
                        if self.viewModel.isFavouriteList == true {
                            
                            Spacer()
                                .frame(height: 15)
                            ForEach(self.viewModel.exampleFavouriteListOfJob){ job in
                                
                                NavigationLink {
                                    JobFullInfoView(vc: job, isFavorite: self.viewModel.exampleFavouriteListOfJob.contains(job))
                                        .environmentObject(self.viewModel)
                                } label: {
                                    JobInfoView(vc: job)
                                }
                                .padding(.horizontal, 16)
                                
                            }
                            .listStyle(.inset)
                            
                        } else {
                            
                            if self.viewModel.searchText == "" {
                                
                                ScrollView(.horizontal) {
                                    
                                    LazyHStack {
                                        
                                        ForEach(self.viewModel.exampleListOfJobs){ job in
                                            
                                            NavigationLink {
                                                JobFullInfoView(vc: job, isFavorite: self.viewModel.exampleFavouriteListOfJob.contains(job))
                                                    .environmentObject(self.viewModel)
                                            } label: {
                                                
                                                JobInfoView(vc: job)
                                            }
                                            .shadow(radius: 10)
                                        }
                                        .scrollTargetLayout()
                                    }
                                }
                                .safeAreaPadding(.vertical, 0)
                                .frame(height: 200)
                                .contentMargins(.horizontal, 16, for:.scrollContent)
                                .scrollIndicators(.hidden)
                                .scrollClipDisabled()
                                .scrollTargetBehavior(.paging)
                                
                            }
                            
                            ForEach(self.viewModel.filteredJobs){ job in
                                
                                NavigationLink {
                                    JobFullInfoView(vc: job, isFavorite: self.viewModel.exampleFavouriteListOfJob.contains(job))
                                        .environmentObject(self.viewModel)
                                }label: {
                                    JobInfoView(vc: job)
                                }
                                .padding(.horizontal, 16)
                            }
                            .listStyle(.inset)
                        }
                    
                }

                .toolbar {
                    
                    ToolbarItem(placement: .topBarLeading) {
                        
                        Button {
                            withAnimation(.spring) {
                                self.viewModel.isFavouriteList.toggle()
                            }
                        }label: {
                            Image(systemName: self.viewModel.isFavouriteList == true ?  "star.fill" : "star")
                                .padding(8)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        
                        Text("Главная")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        withAnimation(.spring) {
                            Button {
                                //sort items
                            }label: {
                                Image(systemName: "arrow.up.and.down.text.horizontal")
                                    .padding(8)
                                    .foregroundStyle(Color("SecondaryColor"))
                            }
                        }
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

