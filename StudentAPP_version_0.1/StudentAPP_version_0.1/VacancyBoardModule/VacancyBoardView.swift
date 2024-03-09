import SwiftUI

struct VacancyBoardView: View {
    
    @EnvironmentObject var presenter: VacancyBoardPresenter
    @EnvironmentObject var router: AppRouter
    //    init() {
    //        UISearchBar.appearance().tintColor = .white
    //    }
    @State private var isShowingSearchBar = false
    
    var body: some View {
        ZStack {
            
            Color("ForegroundColor")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    if isShowingSearchBar {
                        TextField("Поиск...", text: self.$presenter.searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } else {
                        
                        Button {
                            //sort items
                        } label: {
                            Image(systemName: "arrow.up.and.down.text.horizontal")
                                .padding(8)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Главная")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                        
                        Button {
                            withAnimation(.spring) {
                                self.presenter.isFavouriteList.toggle()
                            }
                        }label: {
                            Image(systemName: self.presenter.isFavouriteList == true ?  "star.fill" : "star")
                                .padding(8)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                }
                .padding(.horizontal, 16)
                
                ScrollView {
                    
                    if self.presenter.isFavouriteList == true {
                        
                        Spacer()
                            .frame(height: 15)
                        
                        ForEach(Array(self.presenter.favouriteListOfJob)){ job in
                            Button {
                                self.router.navigateTo(.vacationDetail(job: job, isFavourite: self.presenter.favouriteListOfJob.contains(job)))
                            } label: {
                                VacancyOverView(vc: job)
                            }
                            .padding(.horizontal, 16)
                        }
                        .listStyle(.inset)
                    } else {
                        
                        if self.presenter.searchText == "" {
                            
                            ScrollView(.horizontal) {
                                
                                LazyHStack {
                                    
                                    ForEach(Array(self.presenter.listOfJobs)){ job in
                                        
                                        Button {
                                            self.router.navigateTo(.vacationDetail(job: job, isFavourite: self.presenter.favouriteListOfJob.contains(job)))
                                        } label: {
                                            VacancyOverView(vc: job)
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
                        
                        ForEach(Array(self.presenter.filteredJobs)){ job in
                            
                            Button {
                                self.router.navigateTo(.vacationDetail(job: job, isFavourite: self.presenter.favouriteListOfJob.contains(job)))
                            } label: {
                                VacancyOverView(vc: job)
                            }
                            .padding(.horizontal, 16)
                        }
                        .listStyle(.inset)
                    }
                }
            }
        }
    }
}

#Preview {
    VacancyBoardView()
        .environmentObject(VacancyBoardPresenter())
}


//import SwiftUI
//
//struct VacancyBoardView: View {
//
//    @EnvironmentObject var presenter: VacancyBoardPresenter
//    @EnvironmentObject var router: AppRouter
//    //    init() {
//    //        UISearchBar.appearance().tintColor = .white
//    //    }
//
//    @State private var isShowingSearchBar = false
//
//
//    var body: some View {
//        ZStack {
//
//            Color("ForegroundColor")
//                .ignoresSafeArea()
//
//            VStack {
//                HStack {
//                    if isShowingSearchBar {
//                        // Ваша строка поиска
//                        TextField("Поиск...", text: self.$presenter.searchText)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                    } else {
//
//                        Button {
//                            //sort items
//                        } label: {
//                            Image(systemName: "arrow.up.and.down.text.horizontal")
//                                .padding(8)
//                                .foregroundStyle(Color("SecondaryColor"))
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                        Text("Главная")
//                            .font(.system(size: 22))
//                            .fontWeight(.bold)
//                            .foregroundStyle(Color("SecondaryColor"))
//
//                        Button {
//                            withAnimation(.spring) {
//                                self.presenter.isFavouriteList.toggle()
//                            }
//                        }label: {
//                            Image(systemName: self.presenter.isFavouriteList == true ?  "star.fill" : "star")
//                                .padding(8)
//                                .foregroundStyle(Color("SecondaryColor"))
//                        }
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//
//                    }
//                }
//                .padding(.horizontal, 16)
//
//                ScrollView {
//                    GeometryReader { geometry in
//                        Color.clear.preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
//                    }
//                    .frame(height: 0)
//                    if self.presenter.isFavouriteList == true {
//
//                        Spacer()
//                            .frame(height: 15)
//
//                        ForEach(Array(self.presenter.favouriteListOfJob)){ job in
//
//                            //                            NavigationLink {
//                            //                                VacancyDetailView(vc: job, isFavorite: self.presenter.favouriteListOfJob.contains(job))
//                            //                            } label: {
//                            //                                VacancyOverView(vc: job)
//                            //                            }
//                            Button {
//                                self.router.navigateTo(.vacationDetail(job: job, isFavourite: self.presenter.favouriteListOfJob.contains(job)))
//                            } label: {
//                                VacancyOverView(vc: job)
//                            }
//                            .padding(.horizontal, 16)
//                        }
//                        .listStyle(.inset)
//                    } else {
//
//                        if self.presenter.searchText == "" {
//
//                            ScrollView(.horizontal) {
//
//                                LazyHStack {
//
//                                    ForEach(Array(self.presenter.listOfJobs)){ job in
//
//                                        NavigationLink {
//                                            VacancyDetailView(vc: job, isFavorite: self.presenter.favouriteListOfJob.contains(job))
//                                        } label: {
//                                            VacancyOverView(vc: job)
//                                        }
//                                        .shadow(radius: 10)
//                                    }
//                                    .scrollTargetLayout()
//                                }
//                            }
//                            .safeAreaPadding(.vertical, 0)
//                            .frame(height: 200)
//                            .contentMargins(.horizontal, 16, for:.scrollContent)
//                            .scrollIndicators(.hidden)
//                            .scrollClipDisabled()
//                            .scrollTargetBehavior(.paging)
//                        }
//
//                        ForEach(Array(self.presenter.filteredJobs)){ job in
//
//                            Button {
//                                //                                VacancyDetailView(vc: job, isFavorite: self.presenter.favouriteListOfJob.contains(job))
//                                self.router.navigateTo(.vacationDetail(job: job, isFavourite: self.presenter.favouriteListOfJob.contains(job)))
//                            } label: {
//                                VacancyOverView(vc: job)
//                            }
//                            .padding(.horizontal, 16)
//                        }
//                        .listStyle(.inset)
//                    }
//                }
//                .onPreferenceChange(ViewOffsetKey.self) { value in
//                    // Обновляем состояние, чтобы показать/скрыть строку поиска в зависимости от прокрутки
//                    self.isShowingSearchBar = value < 0
//                }
//            }
//
//            //                .navigationBarTitleDisplayMode(.inline)
//
//        }
//    }
//}
//
//#Preview {
//    VacancyBoardView()
//        .environmentObject(VacancyBoardPresenter())
//}
//
//// Ключ для отслеживания предпочтений в GeometryReader
//struct ViewOffsetKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value += nextValue()
//    }
//}

//
//import SwiftUI
//
//struct PullToRefreshView: View {
//    @State private var text = ""
//    @State private var isRefreshing = false
//
//    var body: some View {
//        ScrollView {
//            // A hidden text field that appears when the scroll view is pulled down
//            TextField("Введите текст", text: $text)
//                .frame(height: 50)
//                .background(Color.gray.opacity(0.2))
//                .offset(y: -50)
//
//            // A spacer that acts as a trigger for the refresh action
//            Spacer()
//                .frame(height: 50)
//                .onAppear {
//                    // Set the isRefreshing flag to true and perform some action
//                    isRefreshing = true
//                    // Simulate a network request with a delay
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        // Set the isRefreshing flag to false and reset the text field
//                        isRefreshing = false
//                        text = ""
//                    }
//                }
//
//            // The main content of the scroll view
//            VStack(spacing: 20) {
//                ForEach(1...10, id: \.self) { i in
//                    Text("Item \(i)")
//                        .font(.title)
//                        .frame(width: 300, height: 100)
//                        .background(Color.blue.opacity(0.2))
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//        }
//        // Add a refresh indicator at the top of the scroll view
//        .refreshable {
//            isRefreshing
//        }
//    }
//}
//
//struct PullToRefreshView_Previews: PreviewProvider {
//    static var previews: some View {
//        PullToRefreshView()
//    }
//}
