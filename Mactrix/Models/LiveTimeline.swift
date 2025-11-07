//
//  MatrixClient+Timeline.swift
//  Mactrix
//
//  Created by Viktor Strate Kløvedal on 31/10/2025.
//

import Foundation
import MatrixRustSDK

@Observable class LiveTimeline {
    let timeline: Timeline
    fileprivate var timelineHandle: TaskHandle?
    fileprivate var paginateHandle: TaskHandle?
    
    var timelineItems: [TimelineItem] = []
    var paginating: RoomPaginationStatus = .idle(hitTimelineStart: false)
    
    init(room: Room) async throws {
        timeline = try await room.timeline()
        
        // Listen to timeline item updates.
        timelineHandle = await timeline.addListener(listener: self)
        
        // Listen to paginate loading status updates.
        paginateHandle = try await timeline.subscribeToBackPaginationStatus(listener: self)
    }
    
    func fetchOlderMessages() async throws {
        guard paginating == .idle(hitTimelineStart: false) else { return }
        
        let _ = try await timeline.paginateBackwards(numEvents: 20)
    }
}

extension LiveTimeline: TimelineListener {
    func onUpdate(diff: [TimelineDiff]) {
        for update in diff {
            switch update {
            case .append(let values):
                timelineItems.append(contentsOf: values)
            case .clear:
                timelineItems.removeAll()
            case .pushFront(let room):
                timelineItems.insert(room, at: 0)
            case .pushBack(let room):
                timelineItems.append(room)
            case .popFront:
                timelineItems.removeFirst()
            case .popBack:
                timelineItems.removeLast()
            case .insert(let index, let room):
                timelineItems.insert(room, at: Int(index))
            case .set(let index, let room):
                timelineItems[Int(index)] = room
            case .remove(let index):
                timelineItems.remove(at: Int(index))
            case .truncate(let length):
                timelineItems.removeSubrange(Int(length)..<timelineItems.count)
            case .reset(values: let values):
                timelineItems = values
            }
        }
    }
}

extension LiveTimeline: PaginationStatusListener {
    func onUpdate(status: MatrixRustSDK.RoomPaginationStatus) {
        self.paginating = status
    }
    
    
}
