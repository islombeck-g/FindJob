import SwiftUI

struct SupportView: View {
    
    @EnvironmentObject var router: AppRouter
    @EnvironmentObject var presenter: SupportPresenter
    
    @State private var messageText:String = ""
    
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                VStack {
                    
                    ScrollView {
                        ForEach(self.presenter.messages, id: \.self) { message in
                            // If the message contains [USER], that means it's us
                            if message.contains("[USER]") {
                                let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                                
                                // User message styles
                                HStack {
                                    Spacer()
                                    Text(verbatim: newMessage)
                                        .padding()
                                        .foregroundColor(Color("TextColorInverted"))
                                        .background(Color.blue.opacity(0.8))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                }
                            } else {
                                
                                // Bot message styles
                                HStack {
                                    Text(verbatim: message)
                                        .padding()
                                        .foregroundColor(Color("TextColorInverted"))
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
                        TextField("Задайте свой вопрос", text: $messageText)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .foregroundColor(Color("TextColorInverted"))
                            .onSubmit {
                                self.presenter.sendMessageToSupport(text: messageText)
                                self.messageText = ""
                            }
                        
                        Button {
                            self.presenter.sendMessageToSupport(text: messageText)
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
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                
                    ToolbarItem(placement: .topBarLeading) {
                
                        Button {
                            withAnimation {
                                self.router.navigateBack()
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 19))
                                .fontWeight(.regular)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                    }
                
                    ToolbarItem(placement: .principal) {
                
                        Text("Поддержка")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                }
            }
        }
    }
}

#Preview {
    SupportView()
        .environmentObject(AppRouter())
        .environmentObject(SupportPresenter())
    
}
