//
//  Reactive.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation

class Reactive<T> {
    typealias Listner = (T) -> Void
    var listner: [Listner?] = [Listner?]()

    var value: T {
        didSet {
            for l in listner {
                l?(value)
            }
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listner: Listner?) {
        self.listner.append(listner)
        listner?(value)
    }
}
