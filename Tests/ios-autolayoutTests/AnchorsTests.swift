import XCTest
@testable import ios_autolayout

final class AnchorsTests: XCTestCase {
    
    func test_activateContraints() {
        // Arrange
        let superView = UIView()
        let subView = UIView()
        let sut = makeSUT(superView: superView, subView: subView)
        
        // Act
        sut.activateConstraints()
        
        // Assert
        XCTAssertEqual(sut.top?.isActive, true)
        XCTAssertEqual(sut.bottom?.isActive, true)
        XCTAssertEqual(sut.leading?.isActive, true)
        XCTAssertEqual(sut.trailing?.isActive, true)
        XCTAssertEqual(sut.centerX?.isActive, true)
        XCTAssertEqual(sut.centerY?.isActive, true)
        XCTAssertEqual(sut.width?.isActive, true)
        XCTAssertEqual(sut.height?.isActive, true)
    }
    
    func test_deactivateContraints() {
        // Arrange
        let superView = UIView()
        let subView = UIView()
        let sut = makeSUT(superView: superView, subView: subView)
        
        // Act
        sut.deactivateConstraints()
        
        // Assert
        XCTAssertEqual(sut.top?.isActive, false)
        XCTAssertEqual(sut.bottom?.isActive, false)
        XCTAssertEqual(sut.leading?.isActive, false)
        XCTAssertEqual(sut.trailing?.isActive, false)
        XCTAssertEqual(sut.centerX?.isActive, false)
        XCTAssertEqual(sut.centerY?.isActive, false)
        XCTAssertEqual(sut.width?.isActive, false)
        XCTAssertEqual(sut.height?.isActive, false)
    }
    
    // MARK: Helpers
    
    func makeSUT(superView: UIView, subView: UIView) -> Anchors {
        superView.addSubview(subView)
        
        let anchors = Anchors()
        anchors.top = subView.topAnchor.constraint(equalTo: superView.topAnchor)
        anchors.bottom = subView.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        anchors.leading = subView.leadingAnchor.constraint(equalTo: superView.leadingAnchor)
        anchors.trailing = subView.trailingAnchor.constraint(equalTo: superView.trailingAnchor)
        anchors.centerX = subView.centerXAnchor.constraint(equalTo: superView.centerXAnchor)
        anchors.centerY = subView.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        anchors.width = subView.widthAnchor.constraint(equalToConstant: 1)
        anchors.height = subView.heightAnchor.constraint(equalToConstant: 1)
        
        return anchors
    }
}
