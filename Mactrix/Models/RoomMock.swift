import Foundation
import MatrixRustSDK

class RoomMock: RoomProtocol {
    
    struct MockError: Error {}
    
    func activeMembersCount() -> UInt64 {
        return 2
    }
    
    func activeRoomCallParticipants() -> [String] {
        return []
    }
    
    func alternativeAliases() -> [String] {
        return []
    }
    
    func applyPowerLevelChanges(changes: MatrixRustSDK.RoomPowerLevelChanges) async throws {}
    
    func avatarUrl() -> String? {
        return nil
    }
    
    func banUser(userId: String, reason: String?) async throws {}
    
    func canonicalAlias() -> String? {
        return nil
    }
    
    func clearComposerDraft(threadRoot: String?) async throws {}
    
    func clearEventCacheStorage() async throws {}
    
    func declineCall(rtcNotificationEventId: String) async throws {}
    
    func discardRoomKey() async throws {}
    
    func displayName() -> String? {
        return "Room Name"
    }
    
    func edit(eventId: String, newContent: MatrixRustSDK.RoomMessageEventContentWithoutRelation) async throws {}
    
    func enableEncryption() async throws {}
    
    func enableSendQueue(enable: Bool) {}
    
    func encryptionState() -> MatrixRustSDK.EncryptionState {
        return .encrypted
    }
    
    func fetchThreadSubscription(threadRootEventId: String) async throws -> MatrixRustSDK.ThreadSubscription? {
        return nil
    }
    
    func forget() async throws {}
    
    func getPowerLevels() async throws -> MatrixRustSDK.RoomPowerLevels {
        return .init(noPointer: .init())
    }
    
    func getRoomVisibility() async throws -> MatrixRustSDK.RoomVisibility {
        return .private
    }
    
    func hasActiveRoomCall() -> Bool {
        return false
    }
    
    func heroes() -> [MatrixRustSDK.RoomHero] {
        return []
    }
    
    func id() -> String {
        return "ROOM_ID"
    }
    
    func ignoreDeviceTrustAndResend(devices: [String : [String]], sendHandle: MatrixRustSDK.SendHandle) async throws {}
    
    func ignoreUser(userId: String) async throws {}
    
    func inviteUserById(userId: String) async throws {}
    
    func invitedMembersCount() -> UInt64 {
        return 1
    }
    
    func inviter() async throws -> MatrixRustSDK.RoomMember? {
        return nil
    }
    
    func isDirect() async -> Bool {
        return false
    }
    
    func isEncrypted() async -> Bool {
        return true
    }
    
    func isPublic() -> Bool? {
        return false
    }
    
    func isSendQueueEnabled() -> Bool {
        return false
    }
    
    func isSpace() -> Bool {
        return false
    }
    
    func join() async throws {}
    
    func joinedMembersCount() -> UInt64 {
        return 2
    }
    
    func kickUser(userId: String, reason: String?) async throws {}
    
    func latestEncryptionState() async throws -> MatrixRustSDK.EncryptionState {
        return .encrypted
    }
    
    func latestEvent() async -> MatrixRustSDK.EventTimelineItem? {
        return nil
    }
    
    func leave() async throws {}
    
    func loadComposerDraft(threadRoot: String?) async throws -> MatrixRustSDK.ComposerDraft? {
        return nil
    }
    
    func loadOrFetchEvent(eventId: String) async throws -> MatrixRustSDK.TimelineEvent {
        return TimelineEvent(noPointer: .init())
    }
    
    func markAsRead(receiptType: MatrixRustSDK.ReceiptType) async throws {}
    
    func matrixToEventPermalink(eventId: String) async throws -> String {
        return "PERMA_\(eventId)"
    }
    
    func matrixToPermalink() async throws -> String {
        return "ROOM_PERMA"
    }
    
    func member(userId: String) async throws -> MatrixRustSDK.RoomMember {
        throw MockError()
    }
    
    func memberAvatarUrl(userId: String) async throws -> String? {
        return nil
    }
    
    func memberDisplayName(userId: String) async throws -> String? {
        return nil
    }
    
    func memberWithSenderInfo(userId: String) async throws -> MatrixRustSDK.RoomMemberWithSenderInfo {
        throw MockError()
    }
    
    func members() async throws -> MatrixRustSDK.RoomMembersIterator {
        throw MockError()
    }
    
    func membersNoSync() async throws -> MatrixRustSDK.RoomMembersIterator {
        throw MockError()
    }
    
    func membership() -> MatrixRustSDK.Membership {
        return .joined
    }
    
    func newLatestEvent() async -> MatrixRustSDK.LatestEventValue {
        return .none
    }
    
    func ownUserId() -> String {
        return "USER_ID"
    }
    
    func predecessorRoom() -> MatrixRustSDK.PredecessorRoom? {
        return nil
    }
    
    func previewRoom(via: [String]) async throws -> MatrixRustSDK.RoomPreview {
        throw MockError()
    }
    
    func publishRoomAliasInRoomDirectory(alias: String) async throws -> Bool {
        return false
    }
    
    func rawName() -> String? {
        return nil
    }
    
    func redact(eventId: String, reason: String?) async throws {}
    
    func removeAvatar() async throws {}
    
    func removeRoomAliasFromRoomDirectory(alias: String) async throws -> Bool {
        return false
    }
    
    func reportContent(eventId: String, score: Int32?, reason: String?) async throws {}
    
    func reportRoom(reason: String) async throws {}
    
    func resetPowerLevels() async throws -> MatrixRustSDK.RoomPowerLevels {
        throw MockError()
    }
    
    func roomEventsDebugString() async throws -> [String] {
        return []
    }
    
    func roomInfo() async throws -> MatrixRustSDK.RoomInfo {
        throw MockError()
    }
    
    func saveComposerDraft(draft: MatrixRustSDK.ComposerDraft, threadRoot: String?) async throws {
        
    }
    
    func sendLiveLocation(geoUri: String) async throws {
        
    }
    
    func sendRaw(eventType: String, content: String) async throws {
        
    }
    
    func setIsFavourite(isFavourite: Bool, tagOrder: Double?) async throws {
        
    }
    
    func setIsLowPriority(isLowPriority: Bool, tagOrder: Double?) async throws {
        
    }
    
    func setName(name: String) async throws {
        
    }
    
    func setThreadSubscription(threadRootEventId: String, subscribed: Bool) async throws {
        
    }
    
    func setTopic(topic: String) async throws {
        
    }
    
    func setUnreadFlag(newValue: Bool) async throws {
        
    }
    
    func startLiveLocationShare(durationMillis: UInt64) async throws {
        
    }
    
    func stopLiveLocationShare() async throws {
        
    }
    
    func subscribeToCallDeclineEvents(rtcNotificationEventId: String, listener: any MatrixRustSDK.CallDeclineListener) throws -> MatrixRustSDK.TaskHandle {
        throw MockError()
    }
    
    func subscribeToIdentityStatusChanges(listener: any MatrixRustSDK.IdentityStatusChangeListener) async throws -> MatrixRustSDK.TaskHandle {
        throw MockError()
    }
    
    func subscribeToKnockRequests(listener: any MatrixRustSDK.KnockRequestsListener) async throws -> MatrixRustSDK.TaskHandle {
        throw MockError()
    }
    
    func subscribeToLiveLocationShares(listener: any MatrixRustSDK.LiveLocationShareListener) -> MatrixRustSDK.TaskHandle {
        return TaskHandle(noPointer: .init())
    }
    
    func subscribeToRoomInfoUpdates(listener: any MatrixRustSDK.RoomInfoListener) -> MatrixRustSDK.TaskHandle {
        return TaskHandle(noPointer: .init())
    }
    
    func subscribeToSendQueueUpdates(listener: any MatrixRustSDK.SendQueueListener) async throws -> MatrixRustSDK.TaskHandle {
        throw MockError()
    }
    
    func subscribeToTypingNotifications(listener: any MatrixRustSDK.TypingNotificationsListener) -> MatrixRustSDK.TaskHandle {
        return TaskHandle(noPointer: .init())
    }
    
    func successorRoom() -> MatrixRustSDK.SuccessorRoom? {
        return nil
    }
    
    func suggestedRoleForUser(userId: String) async throws -> MatrixRustSDK.RoomMemberRole {
        return .user
    }
    
    func timeline() async throws -> MatrixRustSDK.Timeline {
        throw MockError()
    }
    
    func timelineWithConfiguration(configuration: MatrixRustSDK.TimelineConfiguration) async throws -> MatrixRustSDK.Timeline {
        throw MockError()
    }
    
    func topic() -> String? {
        return "The room topic"
    }
    
    func typingNotice(isTyping: Bool) async throws {
        
    }
    
    func unbanUser(userId: String, reason: String?) async throws {
        
    }
    
    func updateCanonicalAlias(alias: String?, altAliases: [String]) async throws {
        
    }
    
    func updateHistoryVisibility(visibility: MatrixRustSDK.RoomHistoryVisibility) async throws {
        
    }
    
    func updateJoinRules(newRule: MatrixRustSDK.JoinRule) async throws {
        
    }
    
    func updatePowerLevelsForUsers(updates: [MatrixRustSDK.UserPowerLevelUpdate]) async throws {
        
    }
    
    func updateRoomVisibility(visibility: MatrixRustSDK.RoomVisibility) async throws {
        
    }
    
    func uploadAvatar(mimeType: String, data: Data, mediaInfo: MatrixRustSDK.ImageInfo?) async throws {
        
    }
    
    func withdrawVerificationAndResend(userIds: [String], sendHandle: MatrixRustSDK.SendHandle) async throws {
        
    }
    
    
}
