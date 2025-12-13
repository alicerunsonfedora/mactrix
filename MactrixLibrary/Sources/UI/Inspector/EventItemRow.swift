import Models
import SwiftUI

public struct EventItemRow: View {
    
    let event: EventTimelineItem
    
    public var body: some View {
        VStack {
            Text(event.sender)
        }
    }
}

#Preview {
    List {
        EventItemRow(event: MockEventTimelineItem())
        EventItemRow(event: MockEventTimelineItem())
        EventItemRow(event: MockEventTimelineItem())
    }
}
