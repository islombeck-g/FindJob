import SwiftUI

extension Text {
    
    func mainSemiBold() ->some View {
        self
            .font(.system(size: 34))
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
    func bold28ForegColor() ->some View {
        self
            .foregroundStyle(Color("ForegroundColor"))
            .fontWeight(.bold)
            .font(.system(size: 28))
    }
    func errorText() ->some View {
        self
            .font(.system(size: 16))
            .foregroundStyle(Color("errorColor"))
            .multilineTextAlignment(.leading)
    }
    
}

