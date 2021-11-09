//
//  RootViewController.swift
//  Friendr
//
//  Created by Hassan Asim on 08/11/2021.
//

import UIKit

class RootViewController: UIViewController {
    
    var rootViewModel: RootViewModelProtocol?
    
    lazy var findButton: BindableButton = {
        let button = BindableButton(type: .custom)
        button.setTitle("Find", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapSearch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var searchTextField: BindableTextField = {
        let field = BindableTextField()
        field.placeholder = "Search"
        field.autocapitalizationType = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var occurrencesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootViewModel = RootViewModel(service: RootService.create())
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
        searchTextField.bind { [unowned self] str in
            rootViewModel?.newSearchQuery(str)
        }
        findButton.bind { [unowned self] in
            rootViewModel?.didTapFindButton()
        }
    }
    
    private func bindOutput() {
        rootViewModel?.count.bind(listner: { [unowned self] text in
            DispatchQueue.main.async {
                occurrencesLabel.text = text
            }
        })
    }
    
    private func setupLayoutConstraints() {
        setupLayoutConstraintsForTextField()
        setupLayoutConstraintsForLabelOccurrences()
    }
    
    private func setupLayoutConstraintsForTextField() {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.addArrangedSubview(searchTextField)
        stackView.addArrangedSubview(findButton)
        view.addSubview(occurrencesLabel)
        
        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50.0),
            findButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupLayoutConstraintsForLabelOccurrences() {
        view.addSubview(occurrencesLabel)
        let constraints = [
            occurrencesLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            occurrencesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func didTapSearch() {
        
    }
    
}
