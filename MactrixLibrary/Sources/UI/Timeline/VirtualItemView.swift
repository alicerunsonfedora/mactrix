import SwiftUI
import Models

public struct VirtualItemView: View {
    let item: VirtualTimelineItem
    
    public init(item: VirtualTimelineItem) {
        self.item = item
    }
    
    public var body: some View {
        switch item {
        case .dateDivider(let date):
            Divider()
                .overlay {
                    Text(date.formatted(date: .long, time: .shortened))
                        .padding(.horizontal, 10)
                        .background(Color(NSColor.controlBackgroundColor))
                }
                .frame(height: 40)
        case .readMarker:
            Divider()
                .overlay {
                    Text("Read Marker")
                        .fontWeight(.medium)
                        .padding(.horizontal, 10)
                        .background(Color(NSColor.controlBackgroundColor))
                }
                .frame(height: 40)
        case .timelineStart:
            Divider()
                .overlay {
                    Text("Start of conversation")
                        .fontWeight(.medium)
                        .padding(.horizontal, 10)
                        .background(Color(NSColor.controlBackgroundColor))
                }
                .frame(height: 40)
        }
    }
}

#Preview {
    VStack(spacing: 0) {
        VirtualItemView(item: .timelineStart)
        VirtualItemView(item: .dateDivider(date: Date()))
        VirtualItemView(item: .readMarker)
    }
    .padding(40)
    .frame(width: 400)
    .background(Color(NSColor.controlBackgroundColor))
}
