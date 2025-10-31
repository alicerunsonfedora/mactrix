import SwiftUI
import MatrixRustSDK

struct ChatInput: View {
    
    @State private var chatInput: String = ""
    
    var body: some View {
        VStack {
            //TextEditor(text: $chatInput)
            TextField("Message room", text: $chatInput, axis: .vertical)
                .textFieldStyle(.plain)
                .lineLimit(nil)
                .scrollContentBackground(.hidden)
                .background(.clear)
                .padding(10)
                //.padding(.horizontal, 5)
        }
        .font(.system(size: 14))
        .background(Color(NSColor.textBackgroundColor))
        .cornerRadius(4)
        .lineSpacing(2)
        .frame(minHeight: 20)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(NSColor.separatorColor), lineWidth: 1)
        )
        //.shadow(color: .black.opacity(0.1), radius: 4)
        .padding([.horizontal, .bottom], 10)
        .background(Color(NSColor.windowBackgroundColor))
    }
}

struct ChatMessage: View {
    
    let event: EventTimelineItem
    
    var name: String {
        if case let .ready(displayName, _, _) = event.senderProfile, let displayName = displayName {
            return displayName
        }
        return event.sender
    }
    
    var message: String {
        "message"
    }
    
    var timestamp: Date {
        Date(timeIntervalSince1970: Double(event.timestamp))
    }
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    @State private var hoverText: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 32, height: 32)
                        
                    }.frame(width: 64)
                    
                    Text(name)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                HStack(alignment: .top, spacing: 0) {
                    HStack {
                        Text(timeFormat.string(from: timestamp))
                            .foregroundStyle(.gray)
                            .font(.system(.footnote))
                            .padding(.trailing, 5)
                            .padding(.top, 3)
                    }
                    .frame(width: 64 - 10)
                    .opacity(hoverText ? 1 : 0)
                    Text(message).textSelection(.enabled)
                    Spacer()
                }
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.tertiary)
                        .opacity(hoverText ? 1 : 0)
                )
                .padding(.horizontal, 10)
            }
            
            HStack {
                Button(action: {}) {
                    Image(systemName: "face.smiling")
                }.buttonStyle(.plain)
                
                Button(action: {}) {
                    Image(systemName: "arrowshape.turn.up.left")
                }.buttonStyle(.plain)
                
                Button(action: {}) {
                    Image(systemName: "ellipsis.message")
                }.buttonStyle(.plain)
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(NSColor.controlBackgroundColor))
                    .stroke(Color(NSColor.separatorColor), lineWidth: 1)
                    .shadow(color: .black.opacity(0.1), radius: 4)
            )
            .padding(.trailing, 20)
            .padding(.top, 18)
            .opacity(hoverText ? 1 : 0)
            
        }
        .padding(.top, 5)
        .onHover { hover in
            hoverText = hover
        }
    }
}

struct TimelineItemView: View {
    
    let item: TimelineItem
    
    var body: some View {
        if let event = item.asEvent() {
            ChatMessage(event: event)
        }
    }
}

struct ChatView: View {
    @Environment(AppState.self) private var appState
    
    let room: Room
    @State private var timeline: RoomTimeline? = nil
    
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView([.vertical]) {
                if let timelineItems = timeline?.timelineItems {
                    ForEach(timelineItems) { item in
                        TimelineItemView(item: item)
                    }
                } else {
                    ProgressView()
                }
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(Color.red)
                        .frame(maxWidth: .infinity)
                }
            }
            .defaultScrollAnchor(.bottom)
            ChatInput()
                .padding(.top, 20)
        }
        .background(Color(NSColor.windowBackgroundColor))
        .task(id: room) {
            do {
                self.timeline = try await RoomTimeline(room: room)
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
