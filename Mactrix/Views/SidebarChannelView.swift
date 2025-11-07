import SwiftUI
import MatrixRustSDK

struct RoomIcon: View {
    @Environment(AppState.self) private var appState
    
    let room: Room
    @State private var avatar: Image? = nil
    
    var body: some View {
        if let avatar = avatar {
            avatar
                .aspectRatio(1.0, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        } else {
            Image(systemName: "number")
                .aspectRatio(1.0, contentMode: .fit)
                .foregroundStyle(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .task {
                    guard let avatarUrl = room.avatarUrl() else { return }
                    guard let imageData = try? await appState.matrixClient?.client.getUrl(url: avatarUrl) else { return }
                    avatar = try? await Image(importing: imageData, contentType: nil)
                }
        }
    }
}

struct SidebarChannelView: View {
    @Environment(AppState.self) var appState
    
    var rooms: [Room] {
        appState.matrixClient?.rooms ?? []
    }
    
    @Binding var selectedRoomId: String?
    
    var body: some View {
        List(selection: $selectedRoomId) {
            Section("Rooms") {
                ForEach(rooms) { room in
                    Label(
                        title: { Text(room.displayName() ?? "Unknown Room") },
                        icon: { RoomIcon(room: room) }
                    )
                }
            }
        }
    }
}

#Preview {
    SidebarChannelView(selectedRoomId: .constant(nil))
}
