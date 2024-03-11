import Foundation

final class ProfilePresenter: ObservableObject {
    
    @Published var userFullData: UserFullData
    
    init() {
        self.userFullData = ProfileInteractor.shared.userData
    }
    
    
}

