[![Version](https://img.shields.io/cocoapods/v/Parallaxable.svg?style=flat-square)](http://cocoapods.org/pods/Parallaxable)
[![License](https://img.shields.io/cocoapods/l/Parallaxable.svg?style=flat-square)](http://cocoapods.org/pods/Parallaxable)
[![Platform](https://img.shields.io/cocoapods/p/Parallaxable.svg?style=flat-square)](http://cocoapods.org/pods/Parallaxable)

# Parallaxable
Beautiful parallax effect for your Table/Collection cells. (Or something else)

## Installation
Add

`pod 'Parallaxable'`

to your podfile, and run
`pod install`

## Usage
Out of the box, Parallaxable calculates parallax offset for any collection/table cell.

For enable calculation you need to set:

```swift
tableView.isParallaxEnabled = true
```

Also you need to conform protocol `Parallaxable` with your cell like: 

```swift

let parallaxOffsetMultiplier: CGFloat = 20

extension TableCell: Parallaxable {
    func updateVerticalParallaxOffset(with offset: CGFloat) {
        var targetCenter = contentView.center
        targetCenter.x = imageView.center.x
        targetCenter.y += offset * parallaxOffsetMultiplier
        imageView.center = targetCenter
    }

    func updateHorizontalParallaxOffset(with offset: CGFloat) {
        var targetCenter = contentView.center
        targetCenter.x += offset * parallaxOffsetMultiplier
        targetCenter.y = imageView.center.y
        imageView.center = targetCenter
    }
}
```
Code above will offset `TableCell`'s imageView from center by `offset`.
