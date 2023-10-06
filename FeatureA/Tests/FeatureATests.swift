@testable import FeatureA
import XCTest

final class FeatureATests: XCTestCase {
  func test() {
    FeatureA.hello()
    XCTAssertEqual(1, 1)
  }
}

