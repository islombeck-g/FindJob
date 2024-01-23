import SwiftUI

struct FullInfoView: View {
    
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
                
                Text("39")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                
                Text(verbatim: vc.nameOfCompany)
                    .font(.system(size: 17))
                Spacer()
                    .frame(height: 15)
                
                Text("40")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(verbatim: vc.activity)
                    .font(.system(size: 17))
                Spacer()
                    .frame(height: 15)
                
                Text(LocalizedStringKey("13"))
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 10)
                
                Text("41")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(verbatim: vc.jobType)
                    .font(.system(size: 17))
                Divider()
                
            }
            Spacer()
                .frame(height: 10)
            
            Text("42")
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
            
            Text("43")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text(verbatim: vc.location)
                .font(.system(size: 17))
            Divider()
            Spacer()
                .frame(height: 15)
            
            Text("44")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text(verbatim: vc.money)
                .font(.system(size: 17))
            Divider()
            Spacer()
                .frame(height: 15)
            
            Text("45")
                .font(.system(size: 15))
                .fontWeight(.bold)
            Text(verbatim: vc.description)
                .font(.system(size: 17))
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}

#Preview {
    FullInfoView(vc: Job(
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
