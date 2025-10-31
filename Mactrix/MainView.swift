import SwiftUI



struct RoomIcon: View {
    var body: some View {
        Rectangle()
            .aspectRatio(1.0, contentMode: .fit)
            .background(Color.blue)
    }
}

struct MainView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            SidebarSpacesView()
            
            NavigationSplitView {
                SidebarChannelView()
            } detail: {
                ChatView()
            }
            .toolbarColorScheme(.light, for: .windowToolbar)
            .toolbar(removing: .title)
        }
    }
}

#Preview {
    MainView()
}
