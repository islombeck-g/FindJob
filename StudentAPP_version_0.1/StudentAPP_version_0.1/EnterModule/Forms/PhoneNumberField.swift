class PhoneFormatter {
    func format(number: String) -> String {
        let digits = number.filter { $0.isNumber }
        let mask = "+X (XXX) XXX-XX-XX"
        
        var result = ""
        var index = digits.startIndex
        
        for ch in mask where index < digits.endIndex {
            if ch == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

//MARK: for debug
//import SwiftUI
//struct PhoneNumberField: View {
//    @State private var phoneNumber = ""
//    private let formatter = PhoneFormatter()
//    
//    var body: some View {
//        TextField("Введите номер телефона", text: $phoneNumber)
//            .keyboardType(.numberPad)
//            .onChange(of: phoneNumber) { newValue in
//                phoneNumber = formatter.format(number: newValue)
//            }
//            .padding()
//    }
//}
//#Preview {
//    PhoneNumberField()
//}
