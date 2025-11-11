import SwiftUI

struct UserTypingIndicator: View {
    
    let name: String
    
    var body: some View {
        Text(name).bold() +
        Text(" is typing...")
    }
}

#Preview {
    UserTypingIndicator(name: "John Doe")
        .padding()
}
