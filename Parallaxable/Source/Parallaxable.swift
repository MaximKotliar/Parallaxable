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

private var parallaxXOffsetHandle = "parallaxXOffsetHandle"
private var parallaxYOffsetHandle = "parallaxYOffsetHandle"
extension Parallaxable {
    var parallaxXOffset: CGFloat?  {
        get {
            let valueBox = objc_getAssociatedObject(self, &parallaxXOffsetHandle) as? ValueBox<CGFloat>
            return valueBox?.value
        }

        set {
            let newValueBox = newValue.flatMap { ValueBox<CGFloat>($0) }
            objc_setAssociatedObject(self,
                                     &parallaxXOffsetHandle,
                                     newValueBox,
                                     .OBJC_ASSOCIATION_RETAIN)
            newValue.flatMap {
                self.updateHorizontalParallaxOffset(with: $0)
            }
        }
    }

    var parallaxYOffset: CGFloat?  {
        get {
            let valueBox = objc_getAssociatedObject(self, &parallaxYOffsetHandle) as? ValueBox<CGFloat>
            return valueBox?.value
        }

        set {
            let newValueBox = newValue.flatMap { ValueBox<CGFloat>($0) }
            objc_setAssociatedObject(self,
                                     &parallaxYOffsetHandle,
                                     newValueBox,
                                     .OBJC_ASSOCIATION_RETAIN)
            newValue.flatMap {
                self.updateVerticalParallaxOffset(with: $0)
            }
        }
    }
}
