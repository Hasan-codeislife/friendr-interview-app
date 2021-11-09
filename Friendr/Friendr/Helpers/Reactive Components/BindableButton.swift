//
//  BindableButton.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation
import UIKit

class BindableButton: UIButton {
    
    var buttonTapped: [(() -> Void)?] = [(() -> Void)]()
    func bind(completion: @escaping (() -> Void)) {
        buttonTapped.append( completion )
        addTarget(self, action: #selector(buttonPressedByUser), for: .touchUpInside)
    }
    
    @objc func buttonPressedByUser(_ button: UIButton) {
        for tap in buttonTapped {
            tap?()
        }
    }
}
