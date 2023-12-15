import Foundation

class EnterAPI {
    func logIn (username: String, password: String, completion: @escaping (Result<StudentData, EnterServiceError>) -> Void) {
        guard let url = URL(string: "https://3513-85-249-28-180.ngrok-free.app/register") else {
            print("Invalid URL")
            return
        }

        let parameters = ["username": username, "password": password]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Error encoding parameters: \(error.localizedDescription)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // Обработка ответа от сервера, например, проверка успешной регистрации
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("Registration successful!")
                    completion(.success(<#T##StudentData#>))
                } else {
                    print("Registration failed. Status code: \(httpResponse.statusCode)")
                }
            }

        }.resume()
    }
}


func authenticate(username: String, password: String, completion: @escaping (Result<String, EnterServiceError>) -> Void) {
        // Здесь можно реализовать ваши логику аутентификации
        
        // В данном примере всегда возвращаем успешный результат с токеном
        let authToken = "exampleAuthToken"
        completion(.success(authToken))
    }
