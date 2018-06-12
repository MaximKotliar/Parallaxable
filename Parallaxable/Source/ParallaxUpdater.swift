//
//  ParallaxUpdater.swift
//  Parallaxable
//
//  Created by Maxim Kotliar on 6/10/18.
//  Copyright © 2018 Maxim Kotliar. All rights reserved.
//

import Foundation

public protocol ParallaxUpdater {

    func startUpdatingParallax()
    func stopUpdatingParallax()
}

private var isParallaxEnabledHandle = "isParallaxEnabledHandle"
extension ParallaxUpdater {
    public var isParallaxEnabled: Bool  {
        get {
            let valueBox = objc_getAssociatedObject(self, &isParallaxEnabledHandle) as? ValueBox<Bool>
            return valueBox?.value ?? false
        }

        set {
            let newValueBox = ValueBox<Bool>(newValue)
            objc_setAssociatedObject(self,
                                     &isParallaxEnabledHandle,
                                     newValueBox,
                                     .OBJC_ASSOCIATION_RETAIN)
            switch newValue {
            case true:
                startUpdatingParallax()
            case false:
                stopUpdatingParallax()
            }
        }
    }
}
