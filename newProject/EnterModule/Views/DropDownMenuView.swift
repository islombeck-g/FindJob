
import SwiftUI

let actions: [ChoseName] = [
    .init(title: "One"),
    .init(title: "Two"),
    .init(title: "Three")
]

struct DropDownMenuView: View {
   
    
    @State private var chosenName: String = actions[0].title
    
    var body: some View {
        VStack {
            DropDownView(menuActions: actions, title: self.$chosenName)
        }
    }
}

#Preview {
    DropDownMenuView()
}

struct ChoseName {
    var title: String
}

struct DropDownView: View {
    var menuActions: [ChoseName]
    @Binding var title: String
    @State private var expand: Bool = false

    var body: some View {
        VStack {
            DropDownHeader(
                title: title,
                action: {
                    expand.toggle()},
                expand: expand)
            if expand {
                DropDownViewMenu(
                    menuActions: menuActions,
                    expand: self.$expand,
                    title: self.$title)
            }
        }
    }
}

struct DropDownButton: View {
    var text: String
    @Binding var expand: Bool
    @Binding var selectedTitle: String
    
    var body: some View {
        
        Button {
            self.expand = false
            self.selectedTitle = text
        } label: {
            HStack{
                Text(text)
                Spacer()
            }
        }
        .padding(.all, 10)
    }
}

struct DropDownViewMenu: View {
    
    var menuActions: [ChoseName]
    @Binding var expand: Bool
    @Binding var title: String

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(menuActions, id: \.title) { action in
                
                DropDownButton(
                    text: action.title,
                    expand: self.$expand,
                    selectedTitle: $title)
            }
            .frame(width: 293, height: 50)
            
        }
        .foregroundStyle(.white)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 7)
    }
}

struct DropDownHeader: View {
    var title: String
    var action: () -> ()
    var expand: Bool

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title + " ")
                Spacer()
                Image(systemName: "chevron.\(expand ? "up" : "down")")
            }
            .padding(.all, 10)
        }
        .frame(width: 293, height: 50)
        .foregroundStyle(.white)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 7)
    }
}








//-------------------------------------
//
//import SwiftUI
//
//struct DropDownMenuView: View {
//    var body: some View {
//        
//        ZStack {
//            VStack {
//                DropDownView(menuActions: actions, title: "someHello")
//                Spacer()
//            }
//        }
//    }
//}
//
//#Preview {
//    DropDownMenuView()
//}
//
//struct DropDownAction {
//    var title: String
//    
//}
//
//private struct DropDownButton: View {
//    
//    var actionModel: DropDownAction
//    
//    
//    var body: some View {
//        Button(actionModel.title, action: {
//            
//        })
//    }
//}
//
//private struct DropDownViewMenu: View {
//    
//    var menuActions: [DropDownAction]
//    var select: (DropDownAction) -> ()
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10){
//            ForEach(menuActions, id: \.title, content: {
//                DropDownButton(actionModel: $0)
//            })
//        }
//        .foregroundStyle(.white)
//        .padding()
//        .background(.black)
//        .clipShape(RoundedRectangle(cornerRadius: 8))
//        .shadow(radius: 7)
//    }
//}
//
//private struct DropDownHeader: View {
//    
//    var title: String
//    var action: () -> ()
//    var expand: Bool
//    
//    var body: some View {
//        Button {
//            action()
//        }label: {
//            HStack {
//                Text(title + " ")
//                Image(systemName: "chevron.\(expand ? "up" : "down")")
//            }
//            .padding(.all, 10)
//        }
//        .foregroundStyle(.white)
//        .background(.black)
//        .clipShape(RoundedRectangle(cornerRadius: 8))
//        .shadow(radius: 7)
//    }
//}
//
//
//let actions : [DropDownAction] = [.init(title: "One"),
//                                  .init(title: "Two"),
//                                  .init(title: "Three")]
//
//struct DropDownView: View {
//    
//    var menuActions: [DropDownAction]
//    var title: String
//    @State var expand: Bool = false
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            DropDownHeader (title: title,
//                            action: { self.expand.toggle() }, expand: expand)
//            if expand {
//                DropDownViewMenu(menuActions: menuActions) { action in
//                    print(action)
//                    self.expand = false
//                }
//            }
//        }
//    }
//}









//-------------------------------------

//
//import SwiftUI
//
//struct DropDownMenuView: View {
//    var body: some View {
//        
//        ZStack {
//            VStack {
//                DropDownView(menuActions: actions, title: "someHello")
//                Spacer()
//            }
//        }
//    }
//}
//
//#Preview {
//    DropDownMenuView()
//}
//
//struct DropDownAction {
//    var title: String
//    var action: () -> ()
//}
//
//private struct DropDownButton: View {
//    
//    var actionModel: DropDownAction
//    var select: (DropDownAction) -> ()
//    
//    var body: some View {
//        Button(actionModel.title, action: {
//            self.select(self.actionModel)
//        })
//    }
//}
//
//private struct DropDownViewMenu: View {
//    
//    var menuActions: [DropDownAction]
//    var select: (DropDownAction) -> ()
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10){
//            ForEach(menuActions, id: \.title, content: {
//                DropDownButton(actionModel: $0, select: self.select)
//            })
//        }
//        .foregroundStyle(.white)
//        .padding()
//        .background(.black)
//        .clipShape(RoundedRectangle(cornerRadius: 8))
//        .shadow(radius: 7)
//    }
//}
//
//private struct DropDownHeader: View {
//    
//    var title: String
//    var action: () -> ()
//    var expand: Bool
//    
//    var body: some View {
//        Button {
//            action()
//        }label: {
//            HStack {
//                Text(title + " ")
//                Image(systemName: "chevron.\(expand ? "up" : "down")")
//            }
//            .padding(.all, 10)
//        }
//        .foregroundStyle(.white)
//        .background(.black)
//        .clipShape(RoundedRectangle(cornerRadius: 8))
//        .shadow(radius: 7)
//    }
//}
//
//
//let actions : [DropDownAction] = [.init(title: "One", action: {}),
//                                  .init(title: "Two", action: {}),
//                                  .init(title: "Three", action: {})]
//
//struct DropDownView: View {
//    
//    var menuActions: [DropDownAction]
//    var title: String
//    @State var expand: Bool = false
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            DropDownHeader (title: title,
//                            action: { self.expand.toggle() }, expand: expand)
//            if expand {
//                DropDownViewMenu(menuActions: menuActions) { action in
//                    action.action()
//                    self.expand = false
//                }
//            }
//        }
//    }
//}
