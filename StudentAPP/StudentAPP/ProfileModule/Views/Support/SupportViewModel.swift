import Foundation

class SupportViewModel {
    
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
