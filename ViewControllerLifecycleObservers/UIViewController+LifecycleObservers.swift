//
//  UIViewController+LifecycleObservers.swift
//  ViewControllerLifecycleObserversTests
//
//  Created by Derek Roberson on 10/29/21.
//

import UIKit

public protocol Observer {
	func remove()
}

public extension UIViewController {
	@discardableResult
	func onViewWillAppear(run callback: @escaping () -> Void) -> Observer {
		let observer = ViewControllerLifecycleObserver(parent: self, viewWillAppearCallback: callback)
		return observer
	}
	
	@discardableResult
	func onViewDidAppear(run callback: @escaping () -> Void) -> Observer {
		let observer = ViewControllerLifecycleObserver(parent: self, viewDidAppearCallback: callback)
		return observer
	}
	
	@discardableResult
	func onViewWillDisappear(run callback: @escaping () -> Void) -> Observer {
		let observer = ViewControllerLifecycleObserver(parent: self, viewWillDisappearCallback: callback)
		return observer
	}
	
	@discardableResult
	func onViewDidDisappear(run callback: @escaping () -> Void) -> Observer {
		let observer = ViewControllerLifecycleObserver(parent: self, viewDidDisappearCallback: callback)
		return observer
	}
}

private class ViewControllerLifecycleObserver: UIViewController, Observer {
	private var viewWillAppearCallback: (() -> Void)? = nil
	private var viewDidAppearCallback: (() -> Void)? = nil
	private var viewWillDisappearCallback: (() -> Void)? = nil
	private var viewDidDisappearCallback: (() -> Void)? = nil
	
	convenience init(parent: UIViewController, viewWillAppearCallback: (() -> Void)? = nil, viewDidAppearCallback: (() -> Void)? = nil, viewWillDisappearCallback: (() -> Void)? = nil, viewDidDisappearCallback: (() -> Void)? = nil) {
		self.init()
		self.add(to: parent)
		self.viewWillAppearCallback = viewWillAppearCallback
		self.viewDidAppearCallback = viewDidAppearCallback
		self.viewWillDisappearCallback = viewWillDisappearCallback
		self.viewDidDisappearCallback = viewDidDisappearCallback
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewWillAppearCallback?()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		viewDidAppearCallback?()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		viewWillDisappearCallback?()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		viewDidDisappearCallback?()
	}
	
	private func add(to parent: UIViewController) {
		parent.addChild(self)
		parent.view.addSubview(view)
		view.isHidden = true
		didMove(toParent: self)
	}
	
	func remove() {
		willMove(toParent: nil)
		view.removeFromSuperview()
		removeFromParent()
	}
}
