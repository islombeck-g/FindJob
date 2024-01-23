//class EnterAPI {
//    let url = "https://3513-85-249-28-180.ngrok-free.app"
//
//    func logIn(username: String, password: String, completion: @escaping (Result<StudentData, EnterServiceError>) -> Void) {
//        guard let url = URL(string: "\(self.url)/login") else {
//            print("Invalid URL")
//            return
//        }
//
//        let parameters = ["username": username, "password": password]
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
//        } catch {
//            print("Error encoding parameters: \(error.localizedDescription)")
//            return
//        }
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                completion(.failure(.networkError))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                print("Invalid HTTP response")
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            guard httpResponse.statusCode == 200 else {
//                print("Login failed. Status code: \(httpResponse.statusCode)")
//                completion(.failure(.loginFailed))
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                completion(.failure(.noData))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let studentData = try decoder.decode(StudentData.self, from: data)
//                completion(.success(studentData))
//            } catch {
//                print("Error decoding JSON: \(error.localizedDescription)")
//                completion(.failure(.jsonDecodingError))
//            }
//
//        }.resume()
//    }
//}
