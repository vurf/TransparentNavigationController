import XCTest
import UIKit
@testable import TransparentNavigationController

final class TransparentNavigationControllerTests: XCTestCase {
    
    func testInitTransparentNavigationController() {
        // arrange
        let viewController = UIViewController()
        
        // act
        let action = { TransparentNavigationController(rootViewController: viewController) }
        
        // assert
        XCTAssertNoThrow(action)
    }

    static var allTests = [
        ("testExample", testInitTransparentNavigationController),
    ]
}
