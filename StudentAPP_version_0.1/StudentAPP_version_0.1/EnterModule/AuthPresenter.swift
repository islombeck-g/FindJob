//
//  AuthPresenter.swift
//  StudentAPP_version_0.1
//
//  Created by Islombek Gofurov on 08/03/24.
//  что то похожее на ViewModel

import Foundation

class AuthPresenter: ObservableObject {
    
    @Published var response: RegistrationResponse?
    @Published var error: Error?
    
    @Published var email:String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    private var authIteractor: AuthInteractor = AuthInteractor.shared
    private var userStateManager: UserStateManager = UserStateManager.shared
    
    //    private var router: AppRouter = AppRouter.shared
    
    func authenticate(){
        
    }
    private func updatePublishedResponse(_ response: RegistrationResponse) {
        self.response = response
        self.isLoading = false
    }

    func registration() {
        self.isLoading = true
        authIteractor.userRegistration(email: self.email, password: self.password) { result in
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.updatePublishedResponse(response)
//                    self.router.navigateTo(.vacancyBoard)
                    print(response)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                    print(error)
                }
            }
        }
    }
}
