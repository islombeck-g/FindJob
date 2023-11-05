import SwiftUI

struct SupportMainView: View {
    
    @EnvironmentObject var viewModel:ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var messageText:String = ""
    
    var body: some View {
        VStack {
            
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .padding(.leading, 15)
                        .font(.system(size: 25))
                }
                
                Text("Поддержка")
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 40)
                
            }
            .fontWeight(.regular)
            .foregroundStyle(.black)
            
            
            ScrollView {
                ForEach(self.viewModel.messages, id: \.self) { message in
                    // If the message contains [USER], that means it's us
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        // User message styles
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        
                        // Bot message styles
                        HStack {
                            Text(message)
                                .padding()
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            .background(Color.gray.opacity(0.1))
            
            
            // Contains the Message bar
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        self.viewModel.sendMessageToSupport(text: messageText)
                        self.messageText = ""
                    }
                
                Button {
                    self.viewModel.sendMessageToSupport(text: messageText)
                    self.messageText = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding(.horizontal)
            .padding(.vertical, 2)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        
    }
    
        
}
#Preview {
    SupportMainView()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
