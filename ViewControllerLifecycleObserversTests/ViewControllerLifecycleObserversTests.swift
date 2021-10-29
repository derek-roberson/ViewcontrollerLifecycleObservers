//
//  ViewControllerLifecycleObserversTests.swift
//  ViewControllerLifecycleObserversTests
//
//  Created by Derek Roberson on 10/29/21.
//

import XCTest
@testable import ViewControllerLifecycleObservers

class ViewControllerLifecycleObserversTests: XCTestCase {

	// MARK: ViewWillAppearTests
	
    func testViewWillAppearObserverIsAddedAsChild() throws {
		let sut = UIViewController()
		sut.onViewWillAppear { }
		
		XCTAssertEqual(sut.children.count, 1)
    }
	
	func testViewWillAppearObserverViewIsAddedAsSubview() throws {
		let sut = UIViewController()
		sut.onViewWillAppear { }
		
		XCTAssertEqual(sut.children.count, 1)
		let observer = sut.children.first
		XCTAssertEqual(observer?.view.superview, sut.view)
	}
	
	func testViewWillAppearObserverViewIsInvisible() throws {
		let sut = UIViewController()
		sut.onViewWillAppear { }
		
		XCTAssertEqual(sut.children.count, 1)
		let observer = sut.children.first
		XCTAssertEqual(observer?.view.isHidden, true)
	}
	
	func testViewWillAppearObserverFiresCallback() throws {
		let sut = UIViewController()
		var count = 0
		sut.onViewWillAppear { count += 1 }
		
		let observer = sut.children.first
		
		observer?.viewWillAppear(false)
		XCTAssertEqual(count, 1)
		observer?.viewWillAppear(false)
		XCTAssertEqual(count, 2)
	}
	
	func testCanRemoveViewWillAppearObserver() throws {
		let sut = UIViewController()
		sut.onViewWillAppear(run: {}).remove()
		XCTAssertEqual(sut.children.count, 0)
	}
	
	func testCanRemoveViewWillAppearObserverView() throws {
		let sut = UIViewController()
		sut.onViewWillAppear(run: {}).remove()
		XCTAssertEqual(sut.view.subviews.count, 0)
	}
	
	// MARK: ViewDidAppear Tests
	
	func testViewDidAppearObserverIsAddedAsChild() throws {
		let sut = UIViewController()
		sut.onViewDidAppear { }
		
		XCTAssertEqual(sut.children.count, 1)
	}
	
	func testViewDidAppearObserverViewIsAddedAsSubview() throws {
		let sut = UIViewController()
		sut.onViewDidAppear { }
		
		XCTAssertEqual(sut.children.count, 1)
		let observer = sut.children.first
		XCTAssertEqual(observer?.view.superview, sut.view)
	}
	
	func testViewDidAppearObserverViewIsInvisible() throws {
		let sut = UIViewController()
		sut.onViewDidAppear { }
		
		XCTAssertEqual(sut.children.count, 1)
		let observer = sut.children.first
		XCTAssertEqual(observer?.view.isHidden, true)
	}
	
	func testViewDidAppearObserverFiresCallback() throws {
		let sut = UIViewController()
		var count = 0
		sut.onViewDidAppear { count += 1 }
		
		let observer = sut.children.first
		
		observer?.viewDidAppear(false)
		XCTAssertEqual(count, 1)
		observer?.viewDidAppear(false)
		XCTAssertEqual(count, 2)
	}
	
	func testCanRemoveViewDidAppearObserver() throws {
		let sut = UIViewController()
		sut.onViewDidAppear(run: {}).remove()
		XCTAssertEqual(sut.children.count, 0)
	}
	
	func testCanRemoveViewDidAppearObserverView() throws {
		let sut = UIViewController()
		sut.onViewDidAppear(run: {}).remove()
		XCTAssertEqual(sut.view.subviews.count, 0)
	}
	
	// MARK: ViewWillDisappear Tests
	
	func testViewWillDisappearObserverIsAddedAsChild() throws {
		let sut = UIViewController()
		sut.onViewWillDisappear { }
		
		XCTAssertEqual(sut.children.count, 1)
	}
	
	func testViewWillDisappearObserverViewIsAddedAsSubview() throws {
		let sut = UIViewController()
		sut.onViewWillDisappear { }
		
		XCTAssertEqual(sut.children.count, 1)
		let observer = sut.children.first
		XCTAssertEqual(observer?.view.superview, sut.view)
	}
	
	func testViewWillDisappearObserverViewIsInvisible() throws {
		let sut = UIViewController()
		sut.onViewWillDisappear { }
		
		XCTAssertEqual(sut.children.count, 1)
		let observer = sut.children.first
		XCTAssertEqual(observer?.view.isHidden, true)
	}
	
	func testViewWillDisappearObserverFiresCallback() throws {
		let sut = UIViewController()
		var count = 0
		sut.onViewWillDisappear { count += 1 }
		
		let observer = sut.children.first
		
		observer?.viewWillDisappear(false)
		XCTAssertEqual(count, 1)
		observer?.viewWillDisappear(false)
		XCTAssertEqual(count, 2)
	}
	
	func testCanRemoveViewWillDisappearObserver() throws {
		let sut = UIViewController()
		sut.onViewWillDisappear(run: {}).remove()
		XCTAssertEqual(sut.children.count, 0)
	}
	
	func testCanRemoveViewWillDisappearObserverView() throws {
		let sut = UIViewController()
		sut.onViewWillDisappear(run: {}).remove()
		XCTAssertEqual(sut.view.subviews.count, 0)
	}
	
	// MARK: ViewDidDisappear Tests
	
	func testViewDidDisappearObserverIsAddedAsChild() throws {
		let sut = UIViewController()
		sut.onViewDidDisappear { }
		
		XCTAssertEqual(sut.children.count, 1)
	}
	
	func testViewDidDisappearObserverViewIsAddedAsSubview() throws {
		let sut = UIViewController()
		sut.onViewDidDisappear { }
		
		XCTAssertEqual(sut.children.count, 1)
		let observer = sut.children.first
		XCTAssertEqual(observer?.view.superview, sut.view)
	}
	
	func testViewDidDisappearObserverViewIsInvisible() throws {
		let sut = UIViewController()
		sut.onViewDidDisappear { }
		
		XCTAssertEqual(sut.children.count, 1)
		let observer = sut.children.first
		XCTAssertEqual(observer?.view.isHidden, true)
	}
	
	func testViewDidDisappearObserverFiresCallback() throws {
		let sut = UIViewController()
		var count = 0
		sut.onViewDidDisappear { count += 1 }
		
		let observer = sut.children.first
		
		observer?.viewDidDisappear(false)
		XCTAssertEqual(count, 1)
		observer?.viewDidDisappear(false)
		XCTAssertEqual(count, 2)
	}
	
	func testCanRemoveViewDidDisappearObserver() throws {
		let sut = UIViewController()
		sut.onViewDidDisappear(run: {}).remove()
		XCTAssertEqual(sut.children.count, 0)
	}
	
	func testCanRemoveViewDidDisappearObserverView() throws {
		let sut = UIViewController()
		sut.onViewDidDisappear(run: {}).remove()
		XCTAssertEqual(sut.view.subviews.count, 0)
	}
	
	// MARK: IntegrationTests
	func testObserversWorkingWithNavigationControllerTransitions() throws {
		let navigation = UINavigationController()
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = navigation
		window.makeKeyAndVisible()
		let expectation = expectation(description: "Wait for lifecycle callbacks")
		let viewController = UIViewController()
		viewController.onViewWillAppear { [weak viewController] in
			viewController?.onViewDidAppear {
				navigation.viewControllers.removeAll()
				viewController?.onViewWillDisappear {
					viewController?.onViewDidDisappear {
						expectation.fulfill()
					}
				}
			}
			
		}
		navigation.pushViewController(viewController, animated: true)
		wait(for: [expectation], timeout: 1)
	}
}
