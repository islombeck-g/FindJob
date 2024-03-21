import SwiftUI

struct DropDownMenuView: View {
    
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
            withAnimation {
                self.expand = false
                self.selectedTitle = text
            }
            
        } label: {
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
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
                        DropDownButton(text: action.title, expand: self.$expand, selectedTitle: $title)
                        Divider()
                    }
                }
                .frame(height: 150)
            
            .foregroundStyle(Color("darkGray"))
            .background(Color("lightGray"))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
        
    }
}

struct DropDownHeader: View {
    
    var title: String
    var action: () -> ()
    var expand: Bool
    
    var body: some View {
        Button {
            withAnimation {
                action()
            }} label: {
                HStack {
                    Text(title + " ")
                    Spacer()
                    Image(systemName: "chevron.\(expand ? "up" : "down")")
                }
                .padding(.all, 10)
            }
            .frame(height: 50)
            .background(Color("lightGray"))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    DropDownMenuView(menuActions: [ChoseName(title: "one"), ChoseName(title: "two"), ChoseName(title: "three")], title: .constant("title"))
}

struct ChoseName {
    var title: String
}

