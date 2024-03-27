import Foundation
import Combine

class AuthInteractor {
    
    static var shared = AuthInteractor()
    
    //    private let url = "http://85.193.90.205:5001/api/"
    private let url = "https://01e8-31-13-130-213.ngrok-free.app"
    
    private var decoder = JSONDecoder()
    private var encoder = JSONEncoder()
    
    func userRegistration(email: String, password: String) -> AnyPublisher<RegistrationResponse, Error> {
        
        guard let url = URL(string: "\(url)/api/registration") else {
            return Fail(error: EnterServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        let registrationData = ["email": email, "password": password]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? encoder.encode(registrationData)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw EnterServiceError.invalidResponse
                }
                return data
            }
            .decode(type: RegistrationResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func userRegistrationPartTwo(userData: UserFullData) -> AnyPublisher<Int, Error> {
        
        guard let url = URL(string: "\(url)/student-registration") else {
            return Fail(error: EnterServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        let registration = [
            "name": userData.firstName,
            "second_name": userData.patronymicName,
            "surname": userData.secondName,
            "education_data": userData.university,
            "telephon_number": userData.phoneNumber,
            "birth_date": userData.birthDate,
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? encoder.encode(registration)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap {
                data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw EnterServiceError.invalidResponse
                }
                return data
            }
            .map { _ in 1 }
            .eraseToAnyPublisher()
    }
}




// MARK: - old code without Combine
//import Foundation
//
//class AuthInteractor {
//
//    static var shared = AuthInteractor()
////    private let url = "http://85.193.90.205:5001/api/"
//
//    private let url = "https://f209-176-15-222-240.ngrok-free.app"
//
//    func userRegistration(email: String, password: String, completion: @escaping (Result<RegistrationResponse, Error>) -> Void) {
//
//        guard let url = URL(string: "\(url)/api/registration") else {
//            completion(.failure(EnterServiceError.invalidURL))
//            return
//        }
//
//        let registrationData = ["email": email, "password": password]
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: registrationData)// тут не дописал
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//
//                completion(.failure(error))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//
//                completion(.failure(NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "Server responded with an error"])))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                return
//            }
//
//            do {
//                let registrationResponse = try JSONDecoder().decode(RegistrationResponse.self, from: data)
//
//                completion(.success(registrationResponse))
//            } catch {
//
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//
//    func userRegistrationPartTwo(userData: UserFullData, completion: @escaping (Result<Int, Error>) -> Void) {
//
//        guard let url = URL(string: "\(url)/student-registration") else {
//            completion(.failure(EnterServiceError.invalidURL))
//            return
//        }
//
//        let registration = ["name": userData.firstName,
//                            "second_name": userData.patronymicName,
//                            "surname": userData.secondName,
//                            "education_data": userData.university,
//                            "telephon_number": userData.phoneNumber,
//                            "birth_date": userData.birthDate]
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: registration)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//
//                completion(.failure(NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "Server responded with an error"])))
//                return
//            }
//            guard data != nil else {
//                completion(.failure(NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                return
//            }
//            print(response ?? "no data")
//            completion(.success(1))
//        }
//        .resume()
//
//    }
//}
