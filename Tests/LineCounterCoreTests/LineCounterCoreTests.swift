import Foundation
import Testing

@testable import LineCounterCore

struct LineCounterCoreTests {
    @Test func initializer() {
        let sut = LineCounterCore(path: "/Users/user/test.txt")
        let actual = sut.fileURL
        #expect(actual == URL(fileURLWithPath: "/Users/user/test.txt"))
    }

    @Test func count_success() throws {
        let testFileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let sut = LineCounterCore(path: testFileURL.path())
        let actual = try sut.count()
        #expect(actual == 3)
    }

    @Test func count_failure() throws {
        let notExistsFileURL = URL(fileURLWithPath: "/test.txt")
        let sut = LineCounterCore(path: notExistsFileURL.path())
        #expect(throws: LineCounterError.self) {
            try sut.count()
        }
    }
}
