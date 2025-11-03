


import XCTest
@testable import JIN_App

final class HelloTests: XCTestCase {

    func testMorningGreeting() {
        let date = Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!
        XCTAssertEqual(hello(for: date), "Good morning")
    }

    func testAfternoonGreeting() {
        let date = Calendar.current.date(bySettingHour: 15, minute: 0, second: 0, of: Date())!
        XCTAssertEqual(hello(for: date), "Good afternoon")
    }

    func testEveningGreeting() {
        let date = Calendar.current.date(bySettingHour: 21, minute: 0, second: 0, of: Date())!
        XCTAssertEqual(hello(for: date), "Good evening")
    }

    func testLateNightGreeting() {
        let date = Calendar.current.date(bySettingHour: 2, minute: 0, second: 0, of: Date())!
        XCTAssertEqual(hello(for: date), "Welcome back")
    }
}
