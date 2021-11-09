//
//  RootViewModel.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation

protocol RootViewModelProtocol: AnyObject {
    // MARK:- Output
    var count: Reactive<String?> { get set }
    
    // MARK:- Input
    func newSearchQuery(_ string: String)
    func didTapFindButton()
}

class RootViewModel: RootViewModelProtocol {
    
    var count: Reactive<String?> = Reactive(nil)
    
    private var rootService: RootServiceProtocol?
    private var searchQuery = String()
    private var htmlConvertedWords = [String]()
    
    init(service: RootServiceProtocol) {
        rootService = service
    }
    
    func newSearchQuery(_ string: String) {
        searchQuery = string
    }
    
    func didTapFindButton() {
        checkForData()
    }
    
    private func checkForData() {
        guard htmlConvertedWords.isEmpty,
              !searchQuery.isEmpty
        else {
            findOccurrences()
            return
        }
        
        rootService?.fetchFromWikipedia(completion: { [weak self] result in
            switch result {
            case .success(let response):
                if let string = String(data: response, encoding: .utf8) {
                    let str = string.htmlToString
                    self?.splitAndCleanString(str: str)
                }
            case .failure(let error):
                // add toast functioanlity here
                print(error.localizedDescription)
            }
        })
    }
    
    private func splitAndCleanString(str: String) {
        htmlConvertedWords = str.components(separatedBy: CharacterSet(charactersIn: "\n "))
        findOccurrences()
    }
    
    private func findOccurrences() {
        guard !searchQuery.isEmpty else {
            setNewCount(with: 0)
            return
        }
        
        let count =  htmlConvertedWords.filter({ $0 == searchQuery}).count
        setNewCount(with: count)
    }
    
    private func setNewCount(with value: Int) {
        print(value)
        count.value = "\(value)"
    }
}
