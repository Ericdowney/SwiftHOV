import Foundation
import Combine
import SwiftUI

public protocol DataSource {
    associatedtype Data
    associatedtype Failure: Error
    
    func fetchData() -> AnyPublisher<Data, Failure>
}

public struct WithDataSource<Source: DataSource, ViewType: View>: View {
    public enum DataSourceState {
        case prepared, loading, success(Source.Data), failed(Source.Failure)
    }
    
    // MARK: - Properties
    
    public var body: some View {
        content(state)
            .onAppear {
                self.state = .loading
                self.cancel = self.dataSource.fetchData().sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished: break
                    case .failure(let error):
                        self.state = .failed(error)
                    }
                }) { self.state = .success($0) }
            }
            .onDisappear { self.cancel?.cancel() }
    }
    
    var dataSource: Source
    var content: (DataSourceState) -> ViewType
    
    @State private var state: DataSourceState = .prepared
    @State private var cancel: AnyCancellable? = nil
    
    // MARK: - Lifecycle
    
    public init(_ dataSource: Source,
                @ViewBuilder _ content: @escaping (DataSourceState) -> ViewType) {
        self.dataSource = dataSource
        self.content = content
    }
    
    // MARK: - Methods
}

// MARK: - Previews

struct WithDataSource_Previews: PreviewProvider {
    struct PreviewDataSource: DataSource {
        typealias Data = [String]
        typealias Failure = Never
        
        func fetchData() -> AnyPublisher<Data, Failure> {
            Future { promise in
                promise(.success(["Hello", "World"]))
            }.eraseToAnyPublisher()
        }
    }
    
    static var previews: some View {
        WithDataSource(PreviewDataSource()) { state -> AnyView in
            switch state {
            case .prepared, .loading: return AnyView(Text("Loading..."))
            case .failed(let error): return AnyView(Text(error.localizedDescription))
            case .success(let data):
                return AnyView(
                    List {
                        ForEach(data, id: \.self) { Text($0) }
                    }
                )
            }
        }
    }
}
