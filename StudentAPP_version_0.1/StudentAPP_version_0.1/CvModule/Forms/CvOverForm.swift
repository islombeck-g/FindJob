import SwiftUI

struct CvOverForm: View {

    @Bindable var cv:CvData
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                    .frame(maxWidth: .infinity, maxHeight: 175)
                    .foregroundColor(Color("infoView"))
                
                VStack(alignment: .leading) {
                    HStack{ Spacer() }
                    
                    Text(verbatim: cv.position)
                        .lineLimit(1)
                        .font(.system(size: 17))
                        .bold()
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Group {
                        Text("Возраст: \(cv.age) лет")
                        Text(cv.employmentType)
                            .lineLimit(1)
                        Text("ВУЗ: \(cv.university)")
                            .lineLimit(1)
                    }
                    .font(.system(size: 9))
                    
                    Spacer()
                        .frame(height: 4)
                    
                    Text(verbatim: cv.money)
                        .lineLimit(1)
                   
                    Spacer()
                        .frame(height: 10)
                    
                    Text(verbatim: cv.aboutMe)
                        .font(.system(size: 12))
                        .lineLimit(2)
                }
                .padding(.all, 10)
                .foregroundStyle(Color("SecondaryColor"))
            }
        }
    }
}

//#Preview {
//    CvOverForm()
//}
