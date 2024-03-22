import Foundation

class AuthInteractor {
    
    static var shared = AuthInteractor()
//    private let url = "http://85.193.90.205:5001/api/"

    private let url = "https://f209-176-15-222-240.ngrok-free.app"
    
    func userRegistration(email: String, password: String, completion: @escaping (Result<RegistrationResponse, Error>) -> Void) {
        
        guard let url = URL(string: "\(url)/api/registration") else {
            completion(.failure(EnterServiceError.invalidURL))
            return
        }
        
        let registrationData = ["email": email, "password": password]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: registrationData)// тут не дописал
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
             
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                
                completion(.failure(NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "Server responded with an error"])))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let registrationResponse = try JSONDecoder().decode(RegistrationResponse.self, from: data)
            
                completion(.success(registrationResponse))
            } catch {
            
                completion(.failure(error))
            }
        }.resume()
    }
    
    func userRegistrationPartTwo(userData: UserFullData, completion: @escaping (Result<Int, Error>) -> Void) {
        
        guard let url = URL(string: "\(url)/student-registration") else {
            completion(.failure(EnterServiceError.invalidURL))
            return
        }
        
        let registration = ["name": userData.firstName,
                            "second_name": userData.patronymicName,
                            "surname": userData.secondName,
                            "education_data": userData.university,
                            "telephon_number": userData.phoneNumber,
                            "birth_date": userData.birthDate]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: registration)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                
                completion(.failure(NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "Server responded with an error"])))
                return
            }
            guard data != nil else {
                completion(.failure(NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            print(response ?? "no data")
            completion(.success(1))
        }
        .resume()
        
    }
}



