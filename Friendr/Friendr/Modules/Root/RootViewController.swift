//
//  RootViewController.swift
//  Friendr
//
//  Created by Hassan Asim on 08/11/2021.
//

import UIKit

class RootViewController: UIViewController {
    
    var rootViewModel: RootViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindings()
        setupUI()
    }
    
    private func bindings() {
        bindInput()
        bindOutput()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.white
        setupLayoutConstraints()

    }
    
    private func bindInput() {
       
    }
    
    private func bindOutput() {

    }
    
    private func setupLayoutConstraints() {
        
    }
}
