//
//  BindableTextField.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation
import UIKit

class BindableTextField: UITextField {
    
    var textEdited: ((String) -> Void)?
    
    func bind(completion: @escaping ((String) -> Void)) {
        textEdited = completion
        addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
    }
    
    @objc func textChanged(_ textFeild: UITextField) {
        guard let text = textFeild.text else { return }
        textEdited?(text)
    }
    
}
