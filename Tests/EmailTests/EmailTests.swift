import XCTest
@testable import Email

final class EmailTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Email().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
