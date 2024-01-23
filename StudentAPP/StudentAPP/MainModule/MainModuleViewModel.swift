import Foundation

final class MainModuleViewModel: ObservableObject {
    
    @Published var exampleListOfJobs: [Job]
    @Published var isFavouriteList = false
    
    @Published var exampleFavouriteListOfJob: [Job] = [Job]()
    
    @Published var searchText:String = ""
    
    var filteredJobs: [Job] {
        guard !searchText.isEmpty else { return exampleListOfJobs}

        return exampleListOfJobs.filter { job in
            job.nameOfCompany.lowercased().contains(searchText.lowercased())
        }
    }
    
    init(){
        self.exampleListOfJobs = [
            Job(id: "4", activity: "Программировани",
                nameOfCompany: "ГУГЛ",
                position: "Программист 1С",
                jobType: "Полный день",
                experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
                location: "Центр Казани",
                money: "от 40 000 до 120 000",
                description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
                minExperience: 2),
            Job(id: "5",
                activity: "Юр испрюденция",
                nameOfCompany: "Газпром нефть",
                position: "Юрист стажер",
                jobType: "Полный день",
                experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
                location: "Центр Казани",
                money: "от 40 000 до 120 000",
                description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
                minExperience: 2),
            Job(id: "6",
                activity: "Юриспрюденция",
                nameOfCompany: "Яндекс",
                position: "Юрист тимлид",
                jobType: "Полный день",
                experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
                location: "Центр Казани",
                money: "от 40 000 до 120 000",
                description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
                minExperience: 2),
            Job(id: "7",
                activity: "Программировани",
                nameOfCompany: "Яндекс",
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
//            isFavouriteList = true
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


//
//var filteredJobs: [Job] {
//    guard !searchText.isEmpty else { return exampleListOfJobs }
//    return exampleListOfJobs.filter { job in
//        let searchTextLowercased = searchText.lowercased()
//        return job.activity.lowercased().contains(searchTextLowercased) ||
//        job.nameOfCompany.lowercased().contains(searchTextLowercased) ||
//        job.position.lowercased().contains(searchTextLowercased) ||
//        job.jobType.lowercased().contains(searchTextLowercased) ||
//        job.experience.contains { exp in exp.lowercased().contains(searchTextLowercased) } ||
//        job.location.lowercased().contains(searchTextLowercased) ||
//        job.money.lowercased().contains(searchTextLowercased) ||
//        job.description.lowercased().contains(searchTextLowercased) ||
//        String(job.minExperience).contains(searchText)
//    }
//}
//
//var filteredFavouriteJobs: [Job] {
//    guard !searchText.isEmpty else { return exampleFavouriteListOfJob }
//    return exampleFavouriteListOfJob.filter { job in
//        let searchTextLowercased = searchText.lowercased()
//        return job.activity.lowercased().contains(searchTextLowercased) ||
//        job.nameOfCompany.lowercased().contains(searchTextLowercased) ||
//        job.position.lowercased().contains(searchTextLowercased) ||
//        job.jobType.lowercased().contains(searchTextLowercased) ||
//        job.experience.contains { exp in exp.lowercased().contains(searchTextLowercased) } ||
//        job.location.lowercased().contains(searchTextLowercased) ||
//        job.money.lowercased().contains(searchTextLowercased) ||
//        job.description.lowercased().contains(searchTextLowercased) ||
//        String(job.minExperience).contains(searchText)
//    }
//}
//
//func updateFilteredJobs() {
//    if isFavouriteList {
//        
//    } else {
//        
//    }
//}
