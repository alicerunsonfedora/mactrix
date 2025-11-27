import Models
import SwiftUI

public struct RoomPreviewView<RoomPreview: RoomPreviewInfo>: View {
    let preview: RoomPreview
    let imageLoader: ImageLoader?

    public init(preview: RoomPreview, imageLoader: ImageLoader?) {
        self.preview = preview
        self.imageLoader = imageLoader
    }

    var header: some View {
        HStack(alignment: .top) {
            AvatarImage(avatarUrl: preview.avatarUrl, imageLoader: imageLoader)
                .frame(width: 42, height: 42)
                .clipShape(.circle)

            VStack(alignment: .leading) {
                Text(preview.name ?? "Unknown name")
                    .font(.title)
                    .textSelection(.enabled)

                if let alias = preview.canonicalAlias {
                    Text(alias)
                        .foregroundStyle(.secondary)
                        .textSelection(.enabled)
                }
                
                Text("^[\(preview.numJoinedMembers) member](inflect: true)")
                    .foregroundStyle(.blue.mix(with: Color(NSColor(.primary)), by: 0.3))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.blue.opacity(0.2))
                    )
            }
        }
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                
                Divider()
                
                if let topic = preview.topic {
                    Text(topic.formatAsMarkdown)
                        .textSelection(.enabled)
                    Divider()
                }
                
                LabeledContent(content: {
                    Text(preview.roomId)
                        .textSelection(.enabled)
                }, label: { Text("Room ID:").bold() })
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 30)
        }
    }
}

#Preview {
    RoomPreviewView(preview: MockRoomPreviewInfo(), imageLoader: nil)
        .frame(width: 400, height: 600)
}
