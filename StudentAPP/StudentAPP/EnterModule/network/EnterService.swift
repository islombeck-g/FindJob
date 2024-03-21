import Foundation

enum EnterServiceError: Error {
    case networkError
    case invalidResponse
    case loginFailed
    case noData
    case jsonDecodingError
    case registrationFailed
    case invalidURL
    case encodingError
}

class EnterService {
    
    var enterAPI = EnterAPI()
    
    func registerUser(userData: inout StudentData,password: inout String,  success: @escaping () -> Void, failure: @escaping (EnterServiceError) -> Void) {
        self.enterAPI.registration(userData: &userData, password: &password) { error in
            if let error = error {
                failure(error)
            } else {
                success()
            }
        }
    }
    
    func login(userName: inout String, password: inout String, success: @escaping (StudentData) -> Void, failure:@escaping (EnterServiceError) -> Void) {
        self.enterAPI.logIn(username: &userName, password: &password) { result in
            switch result {
            case .success(let student):

                success(student)
                
            case .failure(let error):
                // Call the failure closure with the encountered error
                failure(error)
            }
        }
    }
    
    func userRegistration(email: inout String, password: inout String, completion: @escaping (Result<RegistrationResponse, Error>)-> Void) {
        enterAPI.userRegistration(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response): 
                    completion(.success(response))
                    break
                
                case .failure(let error):
                    completion(.failure(error))
                    break
                }
            }
        }
    }
}
