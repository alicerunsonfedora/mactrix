import MatrixRustSDK
import SwiftUI
import UI

struct TimelineEventView: View {
    let timeline: LiveTimeline
    let event: MatrixRustSDK.EventTimelineItem

    var body: some View {
        switch event.content {
        case let .msgLike(content: content):
            ChatMessageView(timeline: timeline, event: event, msg: content)
        case .callInvite:
            UI.GenericEventView(event: event, name: "Call invite")
        case .rtcNotification:
            UI.GenericEventView(event: event, name: "Rtc notification")
        case let .roomMembership(userId: user, userDisplayName: _, change: change, reason: reason):
            let message = TimelineItemContent.roomMembershipDescription(userId: user, change: change, reason: reason)
            UI.GenericEventView(event: event, name: message)
        case let .profileChange(displayName: displayName, prevDisplayName: prevDisplayName, avatarUrl: avatarUrl, prevAvatarUrl: prevAvatarUrl):
            let changeMsg = switch (displayName, prevDisplayName, avatarUrl, prevAvatarUrl) {
            case (.some(_), .some(_), .some(_), .some(_)):
                "changed their display name and avatar"
            case let (.some(displayName), .some(prevDisplayName), _, _):
                "changed their display name from \(prevDisplayName) to \(displayName)"
            case (_, _, .some(_), .some(_)):
                "changed their avatar"
            case _:
                "unknown profile change"
            }

            UI.GenericEventView(event: event, name: changeMsg)
        case let .state(stateKey: stateKey, content: content):
            StateEventView(event: event, stateKey: stateKey, state: content)
        case .failedToParseMessageLike(eventType: _, error: let error):
            UI.GenericEventView(event: event, name: "Failed to parse message: \(error)")
        case .failedToParseState(eventType: _, stateKey: _, error: let error):
            UI.GenericEventView(event: event, name: "Failed to parse state: \(error)")
        }
    }
}

struct StateEventView: View {
    let event: EventTimelineItem
    let stateKey: String
    let state: OtherState

    var body: some View {
        GenericEventView(event: event, name: state.description)
    }
}
