import Foundation

class EnterAPI {
    let url = "https://cfe2-85-249-28-180.ngrok-free.app"
    
    func logIn(username: inout String, password: inout String, completion: @escaping (Result<StudentData, EnterServiceError>) -> Void) {
        
        guard let url = URL(string: "\(url)/login") else {
            print("Invalid URL")
            completion(.failure(.invalidURL))
            return
        }
        
        let parameters = ["userLogin": username, "password": password]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Error encoding parameters: \(error.localizedDescription)")
            completion(.failure(.encodingError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(.networkError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid HTTP response")
                completion(.failure(.invalidResponse))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Login failed. Status code: \(httpResponse.statusCode)")
                completion(.failure(.loginFailed))
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(.failure(.noData))
                return
            }
            
            do {
                // Decode the received data into a dictionary
                guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    print("decode_ Error converting data to dictionary")
                    completion(.failure(.jsonDecodingError))
                    return
                }
                print("JSON Response: \(jsonDictionary)")
                
                guard let userData = jsonDictionary["userData"] as? [String: Any],
                    let firstName = userData["firstName"] as? String,
                      let secondName = userData["secondName"] as? String,
                      let patronymicName = userData["patronymicName"] as? String,
                      let gender = userData["gender"] as? String,
                      let city = userData["city"] as? String,
                      let university = userData["university"] as? String,
                      let phoneNumber = userData["phoneNumber"] as? String,
                      let image = userData["image"] as? String,
                      let email = userData["email"] as? String,
                      let birthDate = userData["birthDate"] as? String,
                      let aboutMe = userData["aboutMe"] as? String,
                      let institute = userData["institute"] as? String,
                      let direction = userData["direction"] as? String
                else {
                    print("1_ Error extracting data from dictionary")
                    completion(.failure(.jsonDecodingError))
                    return
                }
                let student = StudentData(
                    firstName: firstName,
                    secondName: secondName,
                    patronymicName: patronymicName,
                    gender: gender == "male" ? Gender.male: Gender.female,
                    city: city,
                    university: university,
                    phoneNumber: phoneNumber,
                    image: image,
                    email: email,
                    birthDate: birthDate,
                    aboutMe: aboutMe,
                    institute: institute,
                    direction: direction)
                
                completion(.success(student))
                
            } catch {
                print("2_ Error decoding data: \(error.localizedDescription)")
                completion(.failure(.jsonDecodingError))
            }
        }.resume()
    }
    
    func registration(userData: inout StudentData, password: inout String, completion: @escaping (EnterServiceError?) -> Void) {
        
        guard let url = URL(string: "\(url)/registration") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let requestBody: [String: Any] = [
                "firstName": userData.firstName,
                "secondName": userData.secondName,
                "patronymicName": userData.patronymicName,
                "gender": userData.gender.rawValue,
                "city": userData.city,
                "university": userData.university,
                "phoneNumber": userData.phoneNumber,
                "image": userData.image,
                "email": userData.email,
                "password": password,
                "birthDate": userData.birthDate,
                "aboutMe": userData.aboutMe,
                "institute": userData.institute,
                "direction": userData.direction,
                "login": userData.email
            ]
            
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        } catch {
            print("error \(error.localizedDescription)")
            completion(.encodingError)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.networkError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid HTTP response")
                completion(.invalidResponse)
                return
            }
            guard httpResponse.statusCode == 200 else {
                print("Registration failed. Status code: \(httpResponse.statusCode)")
                completion(.registrationFailed)
                return
            }
            
            DispatchQueue.main.async {
                print("Registration success")
                completion(nil)
            }   
        }
        .resume()
    }
}
