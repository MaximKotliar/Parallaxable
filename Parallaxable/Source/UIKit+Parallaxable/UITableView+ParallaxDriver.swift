//
//  UITableView+ParallaxDriver.swift
//  Parallaxable
//
//  Created by Maxim Kotliar on 6/10/18.
//  Copyright © 2018 Maxim Kotliar. All rights reserved.
//

import UIKit.UITableView

extension UITableView: ParallaxDriver {

    public func updateParallaxOnVisibleItems() {
        print(contentOffset.y)
    }
}
