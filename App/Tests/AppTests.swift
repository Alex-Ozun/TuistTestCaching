@testable import App
import FeatureA
import XCTest

final class AppTests: XCTestCase {
  func test() {
    FeatureA.hello()
    XCTAssertEqual(1, 1)
  }
}

