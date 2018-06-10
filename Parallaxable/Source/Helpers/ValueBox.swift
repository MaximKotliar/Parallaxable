//
//  ValueBox.swift
//  Parallaxable
//
//  Created by Maxim Kotliar on 6/10/18.
//  Copyright © 2018 Maxim Kotliar. All rights reserved.
//

import Foundation

final class ValueBox<ValueType> {
    var value: ValueType

    init(_ value: ValueType) {
        self.value = value
    }
}
