import Foundation
import MatrixRustSDK
import Models

@Observable
public final class LiveRoom: Models.Room {
    let room: MatrixRustSDK.Room
    
    var typingHandle: TaskHandle?
    
    public var typingUserIds: [String] = []
    
    public init(room: MatrixRustSDK.Room) {
        self.room = room
        
        self.typingHandle = room.subscribeToTypingNotifications(listener: self)
    }
    
    public var displayName: String? {
        room.displayName()
    }
    
    public var topic: String? {
        room.topic()
    }
    
    public var encryptionState: Models.EncryptionState {
        room.encryptionState().asModel
    }
}

extension LiveRoom: TypingNotificationsListener {
    public func call(typingUserIds: [String]) {
        self.typingUserIds = typingUserIds
    }
}

extension MatrixRustSDK.EncryptionState {
    var asModel: Models.EncryptionState {
        switch self {
        case .notEncrypted:
            return .notEncrypted
        case .encrypted:
            return .encrypted
        case .unknown:
            return .unknown
        }
    }
}
