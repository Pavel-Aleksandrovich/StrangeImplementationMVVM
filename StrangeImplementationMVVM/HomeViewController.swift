//
//  HomeViewController.swift
//  StrangeImplementationMVVM
//
//  Created by pavel mishanin on 24.11.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        textLabel.textAlignment = .center
        textLabel.text = "textLabel"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 100))
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textLabel)
        view.addSubview(button)
        textLabel.center = view.center
        button.center = view.center
        view.backgroundColor = .gray
    }
    
    var homeViewModel: HomeViewModelDelegate? {
        didSet {
            homeViewModel?.textDidChangedHandler = { [ weak self ] text in
                self?.textLabel.text = text
            }
        }
    }
    
    @objc func didTappedButton() {
        homeViewModel?.obtainNumbers()
        print("tapped")
    }
}

protocol DataManagerHomeProtocol {
    func obtainNumbers() -> [Int]
}

class DataManagerHome: DataManagerHomeProtocol {
    
    func obtainNumbers() -> [Int] {
        return [1,2,3,4,5,6]
    }
}

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























