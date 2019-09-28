import XCTest
@testable import Email

final class EmailTests: XCTestCase {

    func testValidation() {
        let email: Email = "gamalal3yk@gmail.com"
        XCTAssertTrue(email.isValid)
    }
    
    func testDecoding() {
        let jsonData = """
        {
            "email": "gamalal3yk@gmail.com"
        }
""".data(using: .utf8) ?? .init()
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(Address.self, from: jsonData)
            XCTAssertEqual(object.email, "gamalal3yk@gmail.com")
        } catch {
            XCTAssertThrowsError(error)
        }
    }
    
    func testEncoding() {
        let target: Address = .init(email: "gamalal3yk@gmail.com")
        do {
            let data = try JSONEncoder().encode(target)
            let decoder = JSONDecoder()
            let object = try decoder.decode(Address.self, from: data)
            XCTAssertEqual(object.email, target.email)
        } catch {
            XCTAssertThrowsError(error)
        }
    }
    
    struct Address: Codable {
        let email: Email?
    }
    
    /*static var allTests = [
        ("testExample", testExample),
    ]*/
}
