//
//  Parallaxable.swift
//  Parallaxable
//
//  Created by Maxim Kotliar on 6/10/18.
//  Copyright © 2018 Maxim Kotliar. All rights reserved.
//

import CoreGraphics

public protocol Parallaxable {
    func updateVerticalParallaxOffset(with offset: CGFloat)
    func updateHorizontalParallaxOffset(with offset: CGFloat)
}

public extension Parallaxable {
    func updateVerticalParallaxOffset(with offset: CGFloat) {}
    func updateHorizontalParallaxOffset(with offset: CGFloat) {}
}

private struct AssociatedKey {
    static var parallaxXOffset: UInt8 = 0
    static var parallaxYOffset: UInt8 = 0
}

extension Parallaxable {

    public var parallaxXOffset: CGFloat?  {
        get {
            let valueBox = objc_getAssociatedObject(self, &AssociatedKey.parallaxXOffset) as? ValueBox<CGFloat>
            return valueBox?.value
        }

        set {
            let newValueBox = newValue.flatMap { ValueBox<CGFloat>($0) }
            objc_setAssociatedObject(self, &AssociatedKey.parallaxYOffset, newValueBox, .OBJC_ASSOCIATION_RETAIN)
            newValue.flatMap {
                self.updateHorizontalParallaxOffset(with: $0)
            }
        }
    }

    public var parallaxYOffset: CGFloat?  {
        get {
            let valueBox = objc_getAssociatedObject(self, &AssociatedKey.parallaxYOffset) as? ValueBox<CGFloat>
            return valueBox?.value
        }

        set {
            let newValueBox = newValue.flatMap { ValueBox<CGFloat>($0) }
            objc_setAssociatedObject(self, &AssociatedKey.parallaxYOffset, newValueBox, .OBJC_ASSOCIATION_RETAIN)
            newValue.flatMap {
                self.updateVerticalParallaxOffset(with: $0)
            }
        }
    }
}
