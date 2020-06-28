import Foundation
import SwiftUI

#if os(iOS)
public struct WithSizeClasses<ViewType: View>: View {
    
    // MARK: - Properties
    
    public var body: some View {
        content(horizontalSizeClass, verticalSizeClass)
    }
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var content: (UserInterfaceSizeClass?, UserInterfaceSizeClass?) -> ViewType
    
    // MARK: - Lifecycle
    
    public init(@ViewBuilder content: @escaping (UserInterfaceSizeClass?, UserInterfaceSizeClass?) -> ViewType) {
        self.content = content
    }
    
    // MARK: - Methods
    
}
#endif
