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
        visibleCells.forEach { cell in
            guard var cell = cell as? (Parallaxable & UITableViewCell) else { return }
            let yOffset = (contentOffset.y - cell.frame.midY) / bounds.height + 0.5
            cell.parallaxYOffset = yOffset
        }
    }
}
