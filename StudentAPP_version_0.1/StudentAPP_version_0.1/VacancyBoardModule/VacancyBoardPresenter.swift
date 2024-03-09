import Foundation

class VacancyBoardPresenter: ObservableObject {
    
    @Published var listOfJobs: Set<Job>
    @Published var isFavouriteList = false
    @Published var favouriteListOfJob: Set<Job>
    
    @Published var searchText:String = ""
    
    init(){
        self.listOfJobs = listOfJob
        self.favouriteListOfJob = []
    }
    
    var filteredJobs: Set<Job> {
        guard !searchText.isEmpty else { return listOfJobs}

        return listOfJobs.filter { job in
            job.nameOfCompany.lowercased().contains(searchText.lowercased()) ||
            job.description.lowercased().contains(searchText.lowercased())
        }
    }
    
    func addToFavourite(job: Job) {
        favouriteListOfJob.insert(job)
    }
    func removeFromFavourite(job: Job) {
        favouriteListOfJob.remove(job)
    }
}

//MARK: for debag, in realese remove
var listOfJob:Set<Job> = [
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
    Job(id: "24", activity: "Программировани",
        nameOfCompany: "ГУГЛ",
        position: "Программист 1С",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2),
    Job(id: "14", activity: "Программировани",
        nameOfCompany: "ГУГЛ",
        position: "Программист 1С",
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
        minExperience: 2)
]
