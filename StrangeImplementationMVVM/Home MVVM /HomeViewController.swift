//
//  HomeViewController.swift
//  StrangeImplementationMVVM
//
//  Created by pavel mishanin on 24.11.2021.
//

import UIKit

class HomeViewController: UIViewController, HomeViewDelegate {
    
    var homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.delegate = self
    }
    
    var homeViewModel: HomeViewModelDelegate? {
        didSet {
            homeViewModel?.textDidChangedHandler = { [ weak self ] text in
                self?.homeView.textLabel.text = text
            }
        }
    }
    
    func didTappedButton() {
        homeViewModel?.obtainNumbers()
    }
}


















