import Foundation

final class MainModuleViewModel: ObservableObject {
    
    @Published var exampleListOfJobs: [Job]
    @Published var isFavouriteList = false
    
    @Published var exampleFavouriteListOfJob: [Job] = [Job]()
    
    init(){
        self.exampleListOfJobs = [
            Job(activity: "Программировани",
            nameOfCompany: "Газпром нефть",
            position: "Программист 1С",
            jobType: "Полный день",
            experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
            location: "Центр Казани",
            money: "от 40 000 до 120 000",
            description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
            minExperience: 2),
            Job(activity: "Юриспрюденция",
            nameOfCompany: "Газпром нефть",
            position: "Юрист стажер",
            jobType: "Полный день",
            experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
            location: "Центр Казани",
            money: "от 40 000 до 120 000",
            description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
            minExperience: 2),
            Job(activity: "Юриспрюденция",
            nameOfCompany: "Газпром нефть",
            position: "Юрист тимлид",
            jobType: "Полный день",
            experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
            location: "Центр Казани",
            money: "от 40 000 до 120 000",
            description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
            minExperience: 2),
            Job(activity: "Программировани",
            nameOfCompany: "Газпром нефть",
            position: "Java developer",
            jobType: "Полный день",
            experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
            location: "Центр Казани",
            money: "от 40 000 до 120 000",
            description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
            minExperience: 2)]
    }
    
    func addToFavourite(job: Job) {
        if !exampleFavouriteListOfJob.contains(job) {
            exampleFavouriteListOfJob.append(job)
            isFavouriteList = true
        }
    }
    
    func removeFromFavourite(job: Job) {
            if let index = exampleFavouriteListOfJob.firstIndex(where: { $0.id == job.id }) {
                exampleFavouriteListOfJob.remove(at: index)
                if exampleFavouriteListOfJob.isEmpty {
                    isFavouriteList = false
                }
            }
        }
    
}
