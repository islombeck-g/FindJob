import SwiftUI

struct VacancyOverView: View {
    
    let vc: Job
    
    var body: some View {
        VStack {
            ZStack {
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                    .frame(maxWidth: .infinity, maxHeight: 175)
                    .foregroundColor(Color("infoView"))
                
                VStack(alignment: .leading) {
                    HStack{ Spacer() }
                    
                    Text(vc.position)
                        .lineLimit(1)
                        .font(.system(size: 17))
                        .bold()
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Group {
                        Text("Требуемый опыт работы: \(vc.minExperience) лет")
                            .lineLimit(1)
                        Text("Занятость: \(vc.jobType)")
                            .lineLimit(1)
                        Text("Компания: \(vc.nameOfCompany)")
                    }
                    .font(.system(size: 9))
                    
                    Spacer()
                        .frame(height: 4)
                    
                    Text(verbatim: vc.money)
                        .lineLimit(1)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Text(verbatim: vc.description)
                        .font(.system(size: 12))
                        .lineLimit(2)
                }
                .padding(.all, 10)
                .foregroundStyle(Color("SecondaryColor"))
            }
        }
        .frame(width: 368)
    }
}

#Preview {
    VacancyOverView(vc: Job(
        id: "1",
        activity: "Юриспрюденция",
        nameOfCompany: "Газпром нефть",
        position: "Юрист",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2))
}
