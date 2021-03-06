//
//  Array+QMUI.swift
//  QMUI.swift
//
//  Created by 伯驹 黄 on 2017/6/2.
//  Copyright © 2017年 伯驹 黄. All rights reserved.
//

extension Array {
    // Code taken from http://stackoverflow.com/a/26174259/1975001
    // Further adapted to work with Swift 3
    /// Removes objects at indexes that are in the specified `NSIndexSet`.
    /// - parameter indexes: the index set containing the indexes of objects that will be removed
    public mutating func remove(at indexes: IndexSet) {
        for i in indexes.reversed() {
            remove(at: i)
        }
    }

    public subscript(safe index: Int) -> Element {
        get {
            return self[index]
        }
        set(newElm) {
            insert(newElm, at: index)
        }
    }
}
