import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                        .frame(width: 55)
                    
                    Spacer()
                    
                    Text("Главная")
                    
                    Spacer()
                    
                    Button {
                        
                    }label: {
                        Image(systemName: "arrow.up.and.down.text.horizontal")
//                            .frame(width: 20, height: 30)
                            .padding(8)
                            .padding(.trailing, 6)
                    }
                }
                .font(.system(size: 18))
                
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    MainView()
}
