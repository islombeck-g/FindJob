import SwiftUI

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
            Spacer()
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
            
            ScrollView{
                ForEach(menuActions, id: \.title) { action in
                    DropDownButton(
                        text: action.title,
                        expand: self.$expand,
                        selectedTitle: $title)
                    Divider()
                }
            }
            .frame(width: 293, height: 150)
        }
        .foregroundStyle(Color("darkGray"))
        .background(Color("lightGray"))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
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
        .foregroundStyle(Color(self.title == "74" || self.title == "75" || self.title == "76" ? "darkGray": "black"))
        .background(Color("lightGray"))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}
