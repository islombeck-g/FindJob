import SwiftUI

struct VacancyScrollInfoForm: View {
    
    let vc: Job
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{Spacer()}
            
            Group {
                
                Text(verbatim: vc.position)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 30)
                
                Text("Компания")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                
                Text(verbatim: vc.nameOfCompany)
                    .font(.system(size: 17))
                Spacer()
                    .frame(height: 15)
                
                Text("Отрасль")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(verbatim: vc.activity)
                    .font(.system(size: 17))
                Spacer()
                    .frame(height: 15)
                
                Text(LocalizedStringKey("Вакансия"))
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 10)
                
                Text("Тип занятости")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(verbatim: vc.jobType)
                    .font(.system(size: 17))
                Divider()
                
            }
            Spacer()
                .frame(height: 10)
            
            Text("Требуемый опыт")
                .font(.system(size: 15))
                .fontWeight(.bold)
            
            ForEach(vc.experience.indices, id: \.self) {index in
                
                HStack {
                    Circle()
                        .frame(width: 7)
                    Text(verbatim: vc.experience[index])
                        .font(.system(size: 17))
                }.padding(.leading, 10)
            }
            Divider()
            Spacer()
                .frame(height: 15)
            
            Text("Расположение")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text(verbatim: vc.location)
                .font(.system(size: 17))
            Divider()
            Spacer()
                .frame(height: 15)
            
            Text("Заработная плата")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text(verbatim: vc.money)
                .font(.system(size: 17))
            Divider()
            Spacer()
                .frame(height: 15)
            
            Text("О вакансии")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text(verbatim: vc.description)
                .font(.system(size: 17))
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}

#Preview {
    VacancyScrollInfoForm(vc: Job(
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
