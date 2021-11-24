//
//  ViewController.swift
//  StrangeImplementationMVVM
//
//  Created by pavel mishanin on 24.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var viewModel: ViewModelDelegate? {
        didSet {
            viewModel?.textDidChangedHandler = { [ weak self ] text in
                self?.textLabel.text = text
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func didTappedButton(_ sender: UIButton) {
        viewModel?.obtainNumbers()
    }
}

protocol DataManagerProtocol {
    func obtainNumbers() -> [Int]
}

class DataManager: DataManagerProtocol {
    
    func obtainNumbers() -> [Int] {
        return [1,2,3,4,5,6]
    }
}

protocol ViewModelDelegate {
    
    var text: String { get set }
    var textDidChangedHandler: ((String) -> ())? { get set }
    func obtainNumbers()
}

class ViewModel: ViewModelDelegate {
    
    var dataManager: DataManagerProtocol!
    
    var text: String = "" {
        didSet {
            textDidChangedHandler?(text)
        }
    }
    
    var textDidChangedHandler: ((String) -> ())?
    
    func obtainNumbers() {
        let numbers = dataManager.obtainNumbers()
        text = numbers.map({"\($0)"}).joined(separator: ",")
    }
}

class MVVMAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? ViewController else { return }
        
        let viewModel = ViewModel()
        let dataManager = DataManager()
        
        view.viewModel = viewModel
        viewModel.dataManager = dataManager
    }
    
    
}























