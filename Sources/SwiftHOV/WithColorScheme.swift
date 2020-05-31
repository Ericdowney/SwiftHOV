import Foundation
import SwiftUI

public struct WithColorScheme<ViewType: View>: View {
    
    // MARK: - Properties
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    public var body: some View { content(colorScheme) }
    
    var content: (ColorScheme) -> ViewType
    
    // MARK: - Lifecycle
    
    public init(@ViewBuilder _ content: @escaping (ColorScheme) -> ViewType) {
        self.content = content
    }
    
    // MARK: - Methods
}

// MARK: - Preview

struct WithColorScheme_Previews: PreviewProvider {
    static var previews: some View {
        WithColorScheme { colorScheme in
            Text("Hello World!")
                .foregroundColor(colorScheme == .light ? .blue : .yellow)
        }
    }
}
