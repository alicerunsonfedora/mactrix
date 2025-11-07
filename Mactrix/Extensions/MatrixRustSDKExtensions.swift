import Foundation
import MatrixRustSDK

extension MatrixRustSDK.Room: @retroactive Identifiable {
    public var id: String {
        self.id()
    }
}

extension MatrixRustSDK.Room: @retroactive Hashable {
    public static func == (lhs: MatrixRustSDK.Room, rhs: MatrixRustSDK.Room) -> Bool {
        return lhs.id() == rhs.id()
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(self.id())
    }
}

extension MatrixRustSDK.TimelineItem: @retroactive Equatable, @retroactive Identifiable {
    public var id: String {
        self.uniqueId().id
    }
    
    public static func == (lhs: MatrixRustSDK.TimelineItem, rhs: MatrixRustSDK.TimelineItem) -> Bool {
        return lhs.id == rhs.id
    }
}

extension MatrixRustSDK.Reaction: @retroactive Identifiable {
    public var id: String {
        self.key
    }
}

extension MatrixRustSDK.Timestamp {
    public var date: Date {
        Date(timeIntervalSince1970: Double(self) / 1000)
    }
}
