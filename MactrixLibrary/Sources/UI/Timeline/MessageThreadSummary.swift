import Models
import SwiftUI

public struct MessageThreadSummary: View {
    let summary: ThreadSummary
    let action: () -> Void

    public init(summary: ThreadSummary, action: @escaping () -> Void) {
        self.summary = summary
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            VStack(alignment: .leading) {
                Label("Thread (\(summary.numReplies()) messages)", systemImage: "arrow.turn.down.right")
                    .italic()

                if let description = summary.description {
                    Text(description.formatAsMarkdown)
                        .lineLimit(1)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .opacity(0.05)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MessageThreadSummary(summary: MockThreadSummary()) {}
        .padding()
}
