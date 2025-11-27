import MatrixRustSDK
import Models
import OSLog
import SwiftUI
import UI

struct SearchResolvedRoomInspectorView: View {
    @Environment(AppState.self) var appState

    @State private var roomPreview: MatrixRustSDK.RoomPreview?

    let alias: String
    let resolvedRoom: ResolvedRoomAlias

    var body: some View {
        Group {
            if let roomPreview {
                UI.RoomPreviewView(preview: roomPreview.info(), imageLoader: appState.matrixClient)
            } else {
                UI.RoomPreviewView(preview: MockRoomPreviewInfo(), imageLoader: appState.matrixClient)
                    .redacted(reason: .placeholder)
            }
        }
        .task(id: alias) {
            do {
                let preview = try await appState.matrixClient?.client.getRoomPreviewFromRoomId(roomId: resolvedRoom.roomId, viaServers: resolvedRoom.servers)
                self.roomPreview = preview
            } catch {
                Logger.viewCycle.error("failed to get room preview: \(error)")
            }
        }
    }
}

struct SearchInspectorView: View {
    @Environment(AppState.self) var appState
    @Environment(WindowState.self) var windowState

    @ViewBuilder
    var viewSelector: some View {
        switch windowState.searchTokens.first {
        case .messages:
            Text("Search messages")
        case .rooms:
            SearchRoomInspectorView()
        case .users:
            SearchUserInspectorView()
        case .spaces:
            Text("Search spaces")
        case let .resolvedRoomAlias(alias: alias, resolvedRoom: resolvedRoom):
            SearchResolvedRoomInspectorView(alias: alias, resolvedRoom: resolvedRoom)
        case let .resolvedRoomId(roomPreview: roomPreview):
            UI.RoomPreviewView(preview: roomPreview.info(), imageLoader: appState.matrixClient)
        case let .resolvedUser(profile: userProfile):
            UI.UserProfileView(
                profile: userProfile,
                isUserIgnored: appState.matrixClient?.isUserIgnored(userProfile.userId) == true,
                actions: appState.matrixClient?.userProfileActions(for: userProfile.userId, windowState: windowState),
                timelineActions: nil,
                imageLoader: appState.matrixClient
            )
        case nil:
            ContentUnavailableView("Select a search term", systemImage: "magnifyingglass")
            Text("or enter a room alias or a user id")
                .foregroundStyle(.secondary)
        }
    }

    var body: some View {
        viewSelector
            .inspectorColumnWidth(min: 300, ideal: 300, max: 600)
    }
}
