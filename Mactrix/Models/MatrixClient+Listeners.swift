import Foundation
import MatrixRustSDK
import UserNotifications

extension MatrixClient: RoomListEntriesListener {
    func onUpdate(roomEntriesUpdate: [RoomListEntriesUpdate]) {
        for update in roomEntriesUpdate {
            switch update {
            case .append(let values):
                rooms.append(contentsOf: values.map(SidebarRoom.init(room:)))
            case .clear:
                rooms.removeAll()
            case .pushFront(let room):
                rooms.insert(SidebarRoom(room: room), at: 0)
            case .pushBack(let room):
                rooms.append(SidebarRoom(room: room))
            case .popFront:
                rooms.removeFirst()
            case .popBack:
                rooms.removeLast()
            case .insert(let index, let room):
                rooms.insert(SidebarRoom(room: room), at: Int(index))
            case .set(let index, let room):
                rooms[Int(index)] = SidebarRoom(room: room)
            case .remove(let index):
                rooms.remove(at: Int(index))
            case .truncate(let length):
                rooms.removeSubrange(Int(length)..<rooms.count)
            case .reset(values: let values):
                rooms = values.map(SidebarRoom.init(room:))
            }
        }
    }
}

extension MatrixClient: SyncServiceStateObserver {
    func onUpdate(state: MatrixRustSDK.SyncServiceState) {
        self.syncState = state
    }
}

extension MatrixClient: VerificationStateListener {
    func onUpdate(status: MatrixRustSDK.VerificationState) {
        self.verificationState = status
    }
}

extension MatrixClient: SessionVerificationControllerDelegate {
    func didReceiveVerificationRequest(details: MatrixRustSDK.SessionVerificationRequestDetails) {
        print("session verification: didReceiveVerificationRequest")
        self.sessionVerificationRequest = details
    }
    
    func didAcceptVerificationRequest() {
        print("session verification: didAcceptVerificationRequest")
    }
    
    func didStartSasVerification() {
        print("session verification: didStartSasVerification")
    }
    
    func didReceiveVerificationData(data: MatrixRustSDK.SessionVerificationData) {
        print("session verification: didReceiveVerificationData")
        sessionVerificationData = data
    }
    
    func didFail() {
        print("session verification: didFail")
        self.sessionVerificationRequest = nil
        self.sessionVerificationData = nil
    }
    
    func didCancel() {
        print("session verification: didCancel")
        self.sessionVerificationRequest = nil
        self.sessionVerificationData = nil
    }
    
    func didFinish() {
        print("session verification: didFinish")
        self.sessionVerificationRequest = nil
        self.sessionVerificationData = nil
    }
}
