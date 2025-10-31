import Foundation
import MatrixRustSDK

extension MatrixClient: RoomListEntriesListener {
    func onUpdate(roomEntriesUpdate: [RoomListEntriesUpdate]) {
        for update in roomEntriesUpdate {
            switch update {
            case .append(let values):
                rooms.append(contentsOf: values)
            case .clear:
                rooms.removeAll()
            case .pushFront(let room):
                rooms.insert(room, at: 0)
            case .pushBack(let room):
                rooms.append(room)
            case .popFront:
                rooms.removeFirst()
            case .popBack:
                rooms.removeLast()
            case .insert(let index, let room):
                rooms.insert(room, at: Int(index))
            case .set(let index, let room):
                rooms[Int(index)] = room
            case .remove(let index):
                rooms.remove(at: Int(index))
            case .truncate(let length):
                rooms.removeSubrange(Int(length)..<rooms.count)
            case .reset(values: let values):
                rooms = values
            }
        }
    }
}
