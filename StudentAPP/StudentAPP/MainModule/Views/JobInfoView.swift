import SwiftUI

struct JobInfoView: View {
    
    let vc:Job
    
    var body: some View {
        VStack {
            ZStack {
         
                Color("buttonBlue")
                    .frame(maxWidth: .infinity, maxHeight: 175)
                    .clipShape(.rect(cornerRadius: 15))
                
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
                    
                    Text(vc.money)
                        .lineLimit(1)
                   
                    Spacer()
                        .frame(height: 10)
                    
                    Text(vc.description)
                        .font(.system(size: 12))
                        .lineLimit(2)
                }
                .padding(.all, 10)
                .foregroundStyle(.white)
            }
        }
        .frame(width: 368)
    }
}

#Preview {
    JobInfoView(vc:
        Job(
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
