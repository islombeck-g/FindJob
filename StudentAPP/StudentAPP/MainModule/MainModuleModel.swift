import Foundation

struct Job:Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var activity:String // деятельность компании
    var nameOfCompany:String
    var position:String // должность
    var jobType:String // полный день, 20ч в неделю
    var experience:[String] // навыки
    var location:String // Расположение
    var money:String // зп
    var description:String
    var minExperience:Int // минимальный опыт работы
}
