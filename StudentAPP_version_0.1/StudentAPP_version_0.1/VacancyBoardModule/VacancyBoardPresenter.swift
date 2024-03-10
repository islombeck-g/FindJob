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
