import Foundation

final class SupportPresenter: ObservableObject {
    
    @Published var messages: [String] = ["Добро пожаловать в чат с поддержкой)\nпривет\nпроблема в\nхорошо" ]
    
    func sendMessageToSupport(text: String) {
        
        self.messages.append("[USER]" + text)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.messages.append(self.getResponse(message: text))
            
        }
    }
    
    func getResponse(message: String) -> String {
        let tempMessage = message.lowercased()
        
        if tempMessage.contains("привет") {
            return "Привет, всегда готовы помочь, опиши проблему и мы в кратчайшие сроки постараемся ответить тебе!"
        } else if tempMessage.contains("проблема в") {
            return "Сообщение отправлено в поддержку, скоро мы свяжемся с тобой)"
        } else if tempMessage.contains("хорошо") || tempMessage.contains("спасибо") {
            return "Мы всегда готовы помочь тебе"
        } else {
            return "начни с 'проблема в' и опиши проблему "
        }
    }
}
