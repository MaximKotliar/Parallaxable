//
//  UIScrollView+ParallaxUpdater.swift
//  Parallaxable
//
//  Created by Maxim Kotliar on 6/10/18.
//  Copyright © 2018 Maxim Kotliar. All rights reserved.
//

import UIKit.UIScrollView

private var contentOffsetObserverHandle = "contentOffsetObserverHandle"
typealias ParallaxDriverScrollView = UIScrollView & ParallaxDriver

extension UIScrollView: ParallaxUpdater {

    private var contentOffsetObserver: Observer?  {
        get {
            return objc_getAssociatedObject(self, &contentOffsetObserverHandle) as? Observer
        }

        set {
            objc_setAssociatedObject(self,
                                     &contentOffsetObserverHandle,
                                     newValue,
                                     .OBJC_ASSOCIATION_RETAIN)
        }
    }

    public func startUpdatingParallax() {
        guard let driver = self as? (UIScrollView & ParallaxDriver) else { return }
        contentOffsetObserver = Observer(object: self,
                                         keyPath: "contentOffset") { [weak driver] in
                                            driver?.updateParallaxOnVisibleItems()
        }
    }

    public func stopUpdatingParallax() {
        contentOffsetObserver = nil
    }
}
