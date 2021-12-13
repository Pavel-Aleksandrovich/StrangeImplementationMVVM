//
//  HomeViewModel.swift
//  StrangeImplementationMVVM
//
//  Created by pavel mishanin on 13.12.2021.
//

import Foundation

protocol HomeViewModelDelegate {
    
    var text: String { get set }
    var textDidChangedHandler: ((String) -> ())? { get set }
    func obtainNumbers()
}

class HomeViewModel: HomeViewModelDelegate {
    
    var dataManagerHome: DataManagerHomeProtocol!
    
    var text: String = "" {
        didSet {
            textDidChangedHandler?(text)
        }
    }
    
    var textDidChangedHandler: ((String) -> ())?
    
    func obtainNumbers() {
        let numbers = dataManagerHome.obtainNumbers()
        text = numbers.map({"\($0)"}).joined(separator: ",")
        print("obtain")
    }
}
