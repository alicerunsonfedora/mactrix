import SwiftUI
import MatrixRustSDK

struct RoomInspectorView: View {
    let room: RoomProtocol
    @Binding var inspectorVisible: Bool
    
    var body: some View {
        VStack {
            Text(room.displayName() ?? "Unknown Room").font(.title)
            Text(room.topic() ?? "No Topic")
        }
        .inspectorColumnWidth(min: 200, ideal: 250, max: 400)
        .toolbar {
            Spacer()
            Button {
                inspectorVisible.toggle()
            } label: {
                Label("Toggle Inspector", systemImage: "info.circle")
            }
        }
    }
}


#Preview {
    RoomInspectorView(room: RoomMock(), inspectorVisible: .constant(true))
}
