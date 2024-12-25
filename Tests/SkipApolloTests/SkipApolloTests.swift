import XCTest
//import Apollo

#if SKIP
import SkipApollo
#else
import Apollo
#endif
import OSLog
import Foundation
@testable import SkipApollo

let logger: Logger = Logger(subsystem: "SkipApollo", category: "Tests")

@available(macOS 13, *)
final class SkipApolloTests: XCTestCase {

    func testSkipApollo() throws {
        logger.log("running testSkipApollo")
        
        let inMemory = InMemoryNormalizedCache()
        let store = ApolloStore(cache: inMemory)
        let client = URLSessionClient(sessionConfiguration: URLSessionConfiguration.default, callbackQueue: OperationQueue.current)
        
        let defaultInterceptorProvider = DefaultInterceptorProvider(client: client, store: store)
        
        
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testDecodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SkipApollo", testData.testModuleName)
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
