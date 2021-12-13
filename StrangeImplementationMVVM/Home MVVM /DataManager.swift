//
//  DataManager.swift
//  StrangeImplementationMVVM
//
//  Created by pavel mishanin on 13.12.2021.
//

import Foundation

protocol DataManagerHomeProtocol {
    func obtainNumbers() -> [Int]
}

class DataManagerHome: DataManagerHomeProtocol {
    
    func obtainNumbers() -> [Int] {
        return [1,2,3,4,5,6]
    }
}
