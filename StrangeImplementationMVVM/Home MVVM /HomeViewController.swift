//
//  HomeViewController.swift
//  StrangeImplementationMVVM
//
//  Created by pavel mishanin on 24.11.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var stackView = UIStackView()
    
    var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.text = "textLabel"
        textLabel.font = .systemFont(ofSize: 22, weight: .heavy)
        return textLabel
    }()
    
     var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(button)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        view.backgroundColor = .gray
        
        [stackView, textLabel, button].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 500),
            
            button.widthAnchor.constraint(equalToConstant: 240),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])
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






















