//
//  RootViewModel.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation

protocol RootViewModelProtocol: AnyObject {
    // MARK:- Output
    
    // MARK:- Input
    func newSearchQuery(_ string: String)
    func didTapFindButton()
}

class RootViewModel: RootViewModelProtocol {
    
    private var rootService: RootServiceProtocol?
    private var searchQuery = String()
    private var htmlConvertedText = String()
    
    init(service: RootServiceProtocol) {
        rootService = service
    }
    
    func didTapFindButton() {
        checkForData()
    }
    
    private func checkForData() {
        guard htmlConvertedText.isEmpty,
              !searchQuery.isEmpty
        else {
            findOccurrences()
            return
        }
        
        rootService?.fetchFromWikipedia(completion: { [weak self] result in
            switch result {
            case .success(let response):
                if let string = String(data: response, encoding: .utf8) {
                    self?.htmlConvertedText = string.htmlToString
                    print(self?.htmlConvertedText ?? "")
                    self?.findOccurrences()
                }
            case .failure(let error):
                // add toast functioanlity here
                print(error.localizedDescription)
            }
        })
    }
    
    func newSearchQuery(_ string: String) {
        searchQuery = string
    }
    
    private func findOccurrences() {
        guard !searchQuery.isEmpty else {
            setNewCount(with: 0)
            return
        }
        
        let tokens =  htmlConvertedText.components(separatedBy: searchQuery)
        setNewCount(with: tokens.count - 1)
    }
    
    private func setNewCount(with value: Int) {
        print(value)
    }
}
