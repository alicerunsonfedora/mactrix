import MatrixRustSDK
import OSLog
import SwiftUI
import UI

struct SearchInspectorView: View {
    @Environment(AppState.self) var appState
    @Environment(WindowState.self) var windowState

    @ViewBuilder
    var viewSelector: some View {
        if windowState.searchTokens.contains(.messages) {
            Text("Search messages")
        } else if windowState.searchTokens.contains(.rooms) {
            SearchRoomInspectorView()
        } else if windowState.searchTokens.contains(.spaces) {
            Text("Search spaces")
        } else if windowState.searchTokens.contains(.users) {
            SearchUserInspectorView()
        } else {
            Text("Select a search term")
        }
    }

    var body: some View {
        viewSelector
            .inspectorColumnWidth(min: 300, ideal: 300, max: 600)
    }
}
