//
//  MainAssembly.swift
//  StrangeImplementationMVVM
//
//  Created by pavel mishanin on 13.12.2021.
//

import UIKit

class MainAssembly {
    
    class func configuredModul() -> UIViewController {
        
        let view = HomeViewController()
        
        let homeViewModel = HomeViewModel()
        let dataManagerHome = DataManagerHome()
        
        view.homeViewModel = homeViewModel
        homeViewModel.dataManagerHome = dataManagerHome
        
        return view
    }
}
