import Foundation

final class ResponsesViewModel:ObservableObject {
    
    @Published var categories = ["Отклики", "Приглашения"]
    @Published var chosenCategory = "Отклики"
    
    @Published var exampleResponses:[Job] = [Job]()
    @Published var exampleInvites:[Job] =  [Job]()
    
}
