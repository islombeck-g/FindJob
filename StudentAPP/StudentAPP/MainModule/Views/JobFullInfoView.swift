import SwiftUI

struct JobFullInfoView: View {
    
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel:MainModuleViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        self.dismiss()
                    } label: {
                            Image(systemName: "chevron.left")
                        .font(.system(size: 19))
                        .fontWeight(.regular)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    Text("Вакансия")
                    
                    
                    Spacer()
                    
                    Button {
                       
                    }label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .frame(width: 20, height: 30)
                            .padding(4)
                            .padding(.trailing, 13)
                    }
                }
                .font(.system(size: 18))
                Spacer()
            }
        }
    }
}

#Preview {
    JobFullInfoView()
        .environmentObject(MainModuleViewModel())
}
