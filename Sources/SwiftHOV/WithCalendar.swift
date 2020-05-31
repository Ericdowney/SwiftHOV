import Foundation
import SwiftUI

public struct WithCalendar<ViewType: View>: View {
    
    // MARK: - Properties
    
    @Environment(\.calendar) var calendar: Calendar
    
    public var body: some View { content(calendar) }
    
    var content: (Calendar) -> ViewType
    
    // MARK: - Lifecycle
    
    public init(@ViewBuilder _ content: @escaping (Calendar) -> ViewType) {
        self.content = content
    }
    
    // MARK: - Methods
}

// MARK: - Preview

struct WithCalendar_Previews: PreviewProvider {
    static var previews: some View {
        WithCalendar { calendar in
            calendar.date(from: .init(hour: 8, minute: 33)).map {
                Text("\($0, formatter: DateFormatter())")
            }
        }
    }
}
