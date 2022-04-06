import XCTest
@testable import ios_autolayout

class UIViewExtTests: XCTestCase {
    
    func test_withPadding_anchors() {
        // Arrange
        let superView = UIView()
        let sut = makeSUT(superView: superView)
        
        //Act
        let anchors = sut.anchor(
            top: superView.topAnchor,
            bottom: superView.bottomAnchor,
            leading: superView.leadingAnchor,
            trailing: superView.trailingAnchor,
            padding: UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4),
            size: CGSize(width: 5, height: 6)
        )
        
        //Assert
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.top })?.constant, 1)
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.bottom })?.constant, 3)
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.leading })?.constant, 2)
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.trailing })?.constant, 4)
        
        XCTAssertEqual(sut.constraints.first(where: { $0 == anchors.width })?.constant, 5)
        XCTAssertEqual(sut.constraints.first(where: { $0 == anchors.height })?.constant, 6)
    }
    
    func test_noPadding_anchors() {
        // Arrange
        let superView = UIView()
        let sut = makeSUT(superView: superView)
        
        //Act
        let anchors = sut.anchor(
            top: superView.topAnchor,
            bottom: superView.bottomAnchor,
            leading: superView.leadingAnchor,
            trailing: superView.trailingAnchor,
            padding: nil,
            size: CGSize(width: 5, height: 6)
        )
        
        //Assert
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.top })?.constant, 0)
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.bottom })?.constant, 0)
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.leading })?.constant, 0)
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.trailing })?.constant, 0)
        
        XCTAssertEqual(sut.constraints.first(where: { $0 == anchors.width })?.constant, 5)
        XCTAssertEqual(sut.constraints.first(where: { $0 == anchors.height })?.constant, 6)
    }
    
    func test_withPadding_center() {
        // Arrange
        let superView = UIView()
        let sut = makeSUT(superView: superView)
        
        // Act
        let anchors = sut.center(
            centerX: superView.centerXAnchor,
            centerY: superView.centerYAnchor,
            paddingX: 1,
            paddingY: 2
        )
        
        // Assert
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.centerX })?.constant, 1)
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.centerY })?.constant, 2)
    }
    
    func test_noPadding_center() {
        // Arrange
        let superView = UIView()
        let sut = makeSUT(superView: superView)
        
        // Act
        let anchors = sut.center(
            centerX: superView.centerXAnchor,
            centerY: superView.centerYAnchor
        )
        
        // Assert
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.centerX })?.constant, 0)
        XCTAssertEqual(superView.constraints.first(where: { $0 == anchors.centerY })?.constant, 0)
    }
    
    func test_size() {
        // Arrange
        let sut = makeSUT()
        
        // Act
        let anchors = sut.size(
            CGSize(width: 1, height: 2)
        )

        // Assert
        XCTAssertEqual(sut.constraints.first(where: { $0 == anchors.width })?.constant, 1)
        XCTAssertEqual(sut.constraints.first(where: { $0 == anchors.height })?.constant, 2)
    }
    
    // MARK: Helpers
    func makeSUT(superView: UIView) -> UIView {
        let sut = UIView()
        superView.addSubview(sut)
        return sut
    }
    
    func makeSUT() -> UIView {
        UIView()
    }
}
