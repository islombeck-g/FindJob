import SwiftUI

struct JobFullInfoView: View {

        @Environment(\.dismiss) var dismiss
        @EnvironmentObject var viewModel: MainModuleViewModel
        @Binding var vc: Job
        let isFavour: Bool
        @State var isF: Bool
    
    init(isFavour: Bool, vc: Binding<Job>) {
            self.isFavour = isFavour
            self._vc = vc
            self._isF = State(initialValue: isFavour)
        }
  
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        self.dismiss()
                        if isFavour != isF {
                            if isFavour == true {
                                self.viewModel.removeFromFavourite(job: vc)
                            } else {
                                self.viewModel.addToFavourite(job: vc)
                            }
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 19))
                            .fontWeight(.regular)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    Text("Вакансия")
                    
                    Spacer()
                    
                    Button {
                        self.isF.toggle()
                    }label: {
                        Image(systemName: self.isF == true ?  "star.fill" : "star")
                            .rotationEffect(.degrees(90))
                            .frame(width: 20, height: 30)
                            .padding(4)
                            .padding(.trailing, 13)
                    }
                }
                .font(.system(size: 18))
                
                ScrollView {
                    FullInfoView(vc: $vc)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                        .frame(height: 25)
                    Button{
                        self.dismiss()
                    } label: {
                        
                        Text("Откликнутся")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color("buttonBlue"))
                            .clipShape(.rect(cornerRadius: 13))
                            .padding(.horizontal, 16)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .toolbar(.hidden, for: .tabBar)

    }
}

#Preview {
    JobFullInfoView(isFavour: true, vc: .constant(Job(
        activity: "Юриспрюденция",
        nameOfCompany: "Газпром нефть",
        position: "Юрист",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2)))
    .environmentObject(MainModuleViewModel())
}


//
//я сейчас закину данные, запомни их
//struct Job:Hashable {
//    var id: UUID = UUID()
//    var activity:String // деятельность компании
//    var nameOfCompany:String
//    var position:String // должность
//    var jobType:String // полный день, 20ч в неделю
//    var experience:[String] // навыки
//    var location:String // Расположение
//    var money:String // зп
//    var description:String
//    var minExperience:Int // минимальный опыт работы
//}
//
//struct MainView: View {
//
//    @StateObject private var viewModel:MainModuleViewModel = MainModuleViewModel()
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                HStack {
//                    Button{
//                        self.viewModel.isFavouriteList.toggle()
//                    }label: {
//                        Image(systemName: self.viewModel.isFavouriteList == true ?  "star.fill" : "star")
//                            .padding(8)
//                    }
//                    .padding(.leading, 16)
//
//                    Spacer()
//
//                    Text("Главная")
//
//                    Spacer()
//
//                    Button {
//                    }label: {
//
//                        Image(systemName: "arrow.up.and.down.text.horizontal")
//                            .padding(8)
//                    }
//                    .padding(.trailing, 16)
//                }
//                .font(.system(size: 18))
//
//                ScrollView {
//
//                    if self.viewModel.isFavouriteList == true {
//
//                        ForEach(self.viewModel.exampleFavouriteListOfJob.indices, id: \.self){ index in
//
//                            NavigationLink {
//
//                            } label: {
//                                JobInfoView(vc: self.$viewModel.exampleFavouriteListOfJob[index])
//                                    .padding(.vertical, 10)
//                            }
//                        }
//                        .listStyle(.inset)
//                    } else {
//
//                        ForEach(self.viewModel.exampleListOfJobs.indices, id: \.self){ index in
//                            NavigationLink {
//
//                            }label: {
//                                JobInfoView(vc: self.$viewModel.exampleListOfJobs[index])
//                                    .padding(.vertical, 10)
//                            }
//                        }
//                        .listStyle(.inset)
//                    }
//                }
//                Spacer()
//            }
//        }
//    }
//}
//final class MainModuleViewModel: ObservableObject {
//    private var exampleJob: Job = Job(
//        activity: "Юриспрюденция",
//        nameOfCompany: "Газпром нефть",
//        position: "Юрист",
//        jobType: "Полный день",
//        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
//        location: "Центр Казани",
//        money: "от 40 000 до 120 000",
//        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
//        minExperience: 2)
//    @Published var exampleListOfJobs: [Job]
//    @Published var isFavouriteList = false
//    @Published var exampleFavouriteListOfJob: [Job] = [Job]()
//    init(){
//        self.exampleListOfJobs = [exampleJob,exampleJob,exampleJob,exampleJob,exampleJob,exampleJob,exampleJob,exampleJob,exampleJob]
//    }
//    func addToFavourite(job: Job) {
//        if !exampleFavouriteListOfJob.contains(job) {
//            exampleFavouriteListOfJob.append(job)
//            isFavouriteList = true
//        }
//    }
//    func removeFromFavourite(job: Job) {
//        if let index = exampleFavouriteListOfJob.firstIndex(of: job) {
//            exampleFavouriteListOfJob.remove(at: index)
//            if exampleFavouriteListOfJob.isEmpty {
//                isFavouriteList = false
//            }
//        }
//    }
//}
//struct JobFullInfoView: View {
//    @Environment (\.dismiss) var dismiss
//    @EnvironmentObject var viewModel:MainModuleViewModel
//    @Binding var vc: Job
//    var body: some View {
//        NavigationStack {
//            VStack {
//                HStack {
//                    Button {
//                        self.dismiss()
//                    } label: {
//                            Image(systemName: "chevron.left")
//                        .font(.system(size: 19))
//                        .fontWeight(.regular)
//                    }
//                    .padding(.leading, 20)
//                    Spacer()
//                    Text("Вакансия")
//                    Spacer()
//                    Button {
//
//                    }label: {
//                        Image(systemName: self.viewModel.isFavouriteList == true ?  "star.fill" : "star")
//                            .rotationEffect(.degrees(90))
//                            .frame(width: 20, height: 30)
//                            .padding(4)
//                            .padding(.trailing, 13)
//                    }
//                }
//                .font(.system(size: 18))
//                ScrollView {
//                    FullInfoView(vc: $vc)
//                        .padding(.horizontal, 16)
//
//                    Spacer()
//                        .frame(height: 25)
//                    Button{
//                        self.dismiss()
//                    } label: {
//
//                        Text("Откликнутся")
//                            .foregroundStyle(.white)
//                            .frame(maxWidth: .infinity)
//                            .frame(height: 60)
//                            .background(Color("buttonBlue"))
//                            .clipShape(.rect(cornerRadius: 13))
//                            .padding(.horizontal, 16)
//                    }
//                }
//            }
//        }
//    }
//}
//мне нужно что бы работало удаление и добавление в favouriteList
//что делать?
