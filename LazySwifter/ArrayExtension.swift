//
//  ArrayExtension.swift
//  LazySwifter
//
//  Created by Quoc Nguyen on 2018/06/04.
//

import UIKit

extension Array {
    public func safe(_ index: Int) -> Element? {
        guard index >= 0, index < self.count else {
            return nil
        }
        return self[index]
    }
}
