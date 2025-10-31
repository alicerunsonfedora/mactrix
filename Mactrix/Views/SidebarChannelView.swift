import SwiftUI

struct SidebarChannelView: View {
    let channels = ["First Channel", "Second Channel", "Third Channel"]
    @State private var selectedChannel: String = "First Channel"
    
    var body: some View {
        List(channels, id: \.self, selection: $selectedChannel) { channel in
            HStack(alignment: .center) {
                RoomIcon()
                    .frame(width: 32, height: 32)

                VStack(alignment: .leading) {
                    Spacer()
                    Text(channel)
                    Spacer()
                    Divider()
                }
                
                Spacer()
            }
            .frame(height: 48)
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.sidebar)
        .padding(.top, 10)
        .background()
    }
}

#Preview {
    SidebarChannelView()
}
