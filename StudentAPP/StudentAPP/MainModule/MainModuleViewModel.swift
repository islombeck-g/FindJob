import Foundation

final class MainModuleViewModel: ObservableObject {
    
    private var exampleJob: Job = Job(
        activity: "Юриспрюденция",
        nameOfCompany: "Газпром нефть",
        position: "Юрист",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2)
    @Published var exampleListOfJobs: [Job]
    @Published var isFavouriteList = false
    
    @Published var exampleFavouriteListOfJob: [Job] = [Job]()
    
    init(){
        self.exampleListOfJobs = [exampleJob,exampleJob,exampleJob,exampleJob,exampleJob,exampleJob,exampleJob,exampleJob,exampleJob]
    }
    
    func addToFavourite(job: Job) {
        if !exampleFavouriteListOfJob.contains(job) {
            exampleFavouriteListOfJob.append(job)
            isFavouriteList = true
        }
    }
    
    func removeFromFavourite(job: Job) {
        if let index = exampleFavouriteListOfJob.firstIndex(of: job) {
            exampleFavouriteListOfJob.remove(at: index)
            if exampleFavouriteListOfJob.isEmpty {
                isFavouriteList = false
            }
        }
    }
    
}
