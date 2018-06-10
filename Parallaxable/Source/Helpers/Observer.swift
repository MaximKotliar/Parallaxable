//
//  ContentOffsetObserver.swift
//  Parallaxable
//
//  Created by Maxim Kotliar on 6/10/18.
//  Copyright © 2018 Maxim Kotliar. All rights reserved.
//

import Foundation

class Observer: NSObject {

    weak var object: AnyObject?

    let keyPath: String
    let callback: () -> Void

    init(object: NSObject,
         keyPath: String,
         callback: @escaping () -> Void) {
        self.object = object
        self.keyPath = keyPath
        self.callback = callback
        super.init()
        setupObserver()
    }

    private func setupObserver() {
        object?.addObserver(self,
                            forKeyPath: keyPath,
                            options: .new,
                            context: nil)
    }


    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        callback()
    }

    deinit {
        object?.removeObserver(self,
                                 forKeyPath: keyPath)
    }
}
