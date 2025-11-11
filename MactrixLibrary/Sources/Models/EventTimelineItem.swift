import Foundation

public enum ProfileDetails {
    case unavailable
    case pending
    case ready(displayName: String?, displayNameAmbiguous: Bool, avatarUrl: String?)
    case error(message: String)
}

public protocol EventTimelineItem {
    var isRemote: Bool { get }
    //var eventOrTransactionId: EventOrTransactionId { get }
    var sender: String { get }
    var senderProfile: ProfileDetails { get }
    var isOwn: Bool { get }
    var isEditable: Bool { get }
    //var content: TimelineItemContent { get }
    var timestamp: Date { get }
    //var localSendState: EventSendState? { get }
    var localCreatedAt: UInt64? { get }
    //var readReceipts: [String: Receipt] { get }
    //var origin: EventItemOrigin? { get }
    var canBeRepliedTo: Bool { get }
    //var lazyProvider: LazyTimelineItemProvider { get }
}
