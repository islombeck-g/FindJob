import Foundation
import SwiftUI

final class EnterViewModel:ObservableObject {
   
    private var userStateViewModel:UserStateViewModel
    
    init(userStateViewModel: UserStateViewModel) {
        self.userStateViewModel = userStateViewModel
    }
    
    @Published var loginText: String = ""
    @Published var passwodText: String = ""
 
   
    func register() {
            guard let url = URL(string: "https://3513-85-249-28-180.ngrok-free.app/register") else {
                print("Invalid URL")
                return
            }

            let parameters = ["username": loginText, "password": passwodText]

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
                        self.userStateViewModel.logIn(user: self.student)
                    } else {
                        print("Registration failed. Status code: \(httpResponse.statusCode)")
                    }
                }

            }.resume()
        }

        func login() {
            guard let url = URL(string: "https://3513-85-249-28-180.ngrok-free.app/login") else {
                print("Invalid URL")
                return
            }

            let parameters = ["username": loginText, "password": passwodText]

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

                // Обработка ответа от сервера, например, проверка успешного входа
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        print("Login successful!")
                        self.userStateViewModel.logIn(user: self.student)
                    } else {
                        print("Login failed. Status code: \(httpResponse.statusCode)")
                    }
                }

            }.resume()
        }
    
    
    
    
    func sendData(){
        print(11)
        if checkData() {
            print(21)
            self.userStateViewModel.logIn(user: self.student)
        }
    }
    
    private func checkData() -> Bool {
        
        return true
    }
    
    //good
    func nextTabView(){
        guard selectedTab != 3 else {
            selectedTab = 1
            return
        }
        self.selectedTab += 1
    }
    

    
    @Published var selectedTab: Int = 0
    
    @Published var StudentViews: [AnyView] = [
        AnyView(EnterFullNameView()),
        AnyView(EnterPositionView()),
        AnyView(EnterPasswordView())]
    
    @Published var cities:[ChoseName] = [
        .init(title: "Казань"),
        .init(title: "Москва"),
        .init(title: "Санкт-Питербург"),
        .init(title: "Воронеж"),
        .init(title: "Саратов"),
        .init(title: "Самара"),
        .init(title: "Тюмень"),
        .init(title: "Томск")]
    @Published var universitys:[ChoseName] = [
        .init(title: "Казанский(Приволжский) Федеральный Университет"),
        .init(title: "КАЗАНСКИЙ НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ ТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ"),
        .init(title: "Санкт-Питербургский Государственный Университет"),
        .init(title: "Московский Государственный Университет"),
        .init(title: "Казанский Национальный Иследовательский Технический Университет"),
        .init(title: "Казанский государственный медицинский университет"),
        .init(title: "Российский исламский институтка")]
    
    @Published var student:StudentData = StudentData(firstName: "", secondName: "", patronymicName: "", gender: .male, city: "", university: "", phoneNumber: "", image: "", email: "", password: "", birthDate: "", aboutMe: "", institute: "", direction: "")
    
    @Published var secondPassword:String = ""
    @Published var emailAgree: Bool = false
    @Published var userAgreement: Bool = false
    @Published var chosenCity: String = "Город*"
    @Published var chosenUniversity: String = "Учебное заведение*"
  
}


