import Foundation
import SwiftUI
import CoreData

public struct WithContext<ViewType: View>: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    public var body: some View { content(context) }
    
    var content: (NSManagedObjectContext) -> ViewType
    
    // MARK: - Lifecycle
    
    public init(@ViewBuilder _ content: @escaping (NSManagedObjectContext) -> ViewType) {
        self.content = content
    }
    
    // MARK: - Methods
}

public struct WithFetch<ObjectType: NSManagedObject, ViewType: View>: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    var data: FetchRequest<ObjectType>
    
    public var body: some View { content(data.wrappedValue, context) }
    
    private var content: (FetchedResults<ObjectType>, NSManagedObjectContext) -> ViewType
    
    // MARK: - Lifecycle
    
    public init(entity: NSEntityDescription,
                sortDescriptors: [NSSortDescriptor] = [],
                predicate: NSPredicate? = nil,
                animation: Animation? = nil,
                @ViewBuilder _ content: @escaping (FetchedResults<ObjectType>, NSManagedObjectContext) -> ViewType) {
        self.data = FetchRequest(entity: entity, sortDescriptors: sortDescriptors, predicate: predicate, animation: animation)
        self.content = content
    }
    
    public init(sortDescriptors: [NSSortDescriptor] = [],
                predicate: NSPredicate? = nil,
                animation: Animation? = nil,
                @ViewBuilder _ content: @escaping (FetchedResults<ObjectType>, NSManagedObjectContext) -> ViewType) {
        self.data = FetchRequest(sortDescriptors: sortDescriptors, predicate: predicate, animation: animation)
        self.content = content
    }
    
    // MARK: - Methods
}

// MARK: - Preview

struct WithContext_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WithContext { context in
                Text("Context: \(context)")
            }
            
            WithFetch(sortDescriptors: [.init(key: "someKey", ascending: true)]) { (listData: FetchedResults<NSManagedObject>, _) in
                List {
                    ForEach(listData, id: \.self) { object in
                        Text("Object: \(object)")
                    }
                }
            }
        }
    }
}
