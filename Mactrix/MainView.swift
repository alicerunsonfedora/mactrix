import SwiftUI



struct RoomIcon: View {
    var body: some View {
        Rectangle()
            .aspectRatio(1.0, contentMode: .fit)
            .background(Color.blue)
    }
}

struct MainView: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            SidebarSpacesView()
            
            NavigationSplitView {
                SidebarChannelView()
            } detail: {
                ContentUnavailableView("Select a room", systemImage: "message.fill")
            }
            .toolbarColorScheme(.light, for: .windowToolbar)
            .toolbar(removing: .title)
        }
    }
}

#Preview {
    MainView()
}
