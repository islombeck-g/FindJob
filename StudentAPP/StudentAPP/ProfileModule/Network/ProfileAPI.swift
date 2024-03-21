import Foundation

final class ProvileAPI {
    
    func updateProfile(userData: inout StudentData, completion: @escaping(ProfileServiceError?)-> Void) {
        guard let url = URL(string: "\(url)/update_user") else {
            print("invalid url")
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
                "birthDate": userData.birthDate,
                "aboutMe": userData.aboutMe,
                "institute": userData.institute,
                "direction": userData.direction,
                "login": userData.email]
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        } catch {
            print("error: \(error.localizedDescription)")
            completion(.encodingError)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("error \(error.localizedDescription)")
                completion(.networkError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid HTTP response")
                completion(.invalidResponse)
                return
            }
            guard httpResponse.statusCode == 200 else {
                print("UpdateProfile failed. Status code: \(httpResponse.statusCode)")
                completion(.updateProfileFailed)
                return
            }
            DispatchQueue.main.async {
                print("update success")
                completion(nil)
            }
        }
        .resume()
    }
}
