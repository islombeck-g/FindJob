import Foundation

enum Categories: String, CaseIterable {
    case responses = "14"
    case invitations = "15"
}

final class ResponsesViewModel:ObservableObject {
    
    @Published var chosenCategory:Categories = .responses
    
    @Published var exampleResponses:[Job] = [Job]()
    @Published var exampleInvites:[Job] =  [Job]()
    
}
