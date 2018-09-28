//
//  UICollectionView+ParallaxDriver.swift
//  Parallaxable
//
//  Created by Maxim Kotliar on 6/10/18.
//  Copyright © 2018 Maxim Kotliar. All rights reserved.
//

import UIKit.UICollectionView

extension UICollectionView: ParallaxDriver {
    public func updateParallaxOnVisibleItems() {
        visibleCells.forEach { cell in
            guard let cell = cell as? (Parallaxable & UICollectionViewCell) else { return }
            let xOffset = (contentOffset.x - cell.frame.midX) / bounds.width + 0.5
            let yOffset = (contentOffset.y - cell.frame.midY) / bounds.height + 0.5
            cell.updateHorizontalParallaxOffset(with: xOffset)
            cell.updateVerticalParallaxOffset(with: yOffset)
        }
    }
}
