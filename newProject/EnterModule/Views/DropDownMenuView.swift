import SwiftUI

struct DropDownMenuView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DropDownMenuView()
}



struct DropDownAction {
    var title: String
    var action: () -> ()
}


private struct DropDownButton: View {
    var actionModel: DropDownAction
    var select: (DropDownAction) -> ()
    var body: some View {
        Button(actionModel.title, action: {
            self.select(self.actionModel)
        })
    }
}
               
               
