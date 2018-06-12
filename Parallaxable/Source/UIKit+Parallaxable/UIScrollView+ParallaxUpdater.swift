//
//  UIScrollView+ParallaxUpdater.swift
//  Parallaxable
//
//  Created by Maxim Kotliar on 6/10/18.
//  Copyright © 2018 Maxim Kotliar. All rights reserved.
//

import UIKit.UIScrollView

private var contentOffsetObserverHandle = "contentOffsetObserverHandle"
extension UIScrollView: ParallaxUpdater {
    private var contentOffsetObserver: NSKeyValueObservation?  {
        get {
            return objc_getAssociatedObject(self,
                                            &contentOffsetObserverHandle) as?NSKeyValueObservation
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
        contentOffsetObserver = observe(\.contentOffset) { [weak driver] _, _ in
            driver?.updateParallaxOnVisibleItems()
        }
    }

    public func stopUpdatingParallax() {
        contentOffsetObserver = nil
    }
}
