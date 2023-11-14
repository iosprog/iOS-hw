//
//  ViewController.swift
//  firstApp
//
//  Created by РАХАТ  on 14.11.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touched(_ sender: Any) {
        //label.text = textField.text
        
        let a = textField.text!
        
        let b = secondTextField.text!
        
        let sum = Int(a)! + Int(b)!
        
        label.text = "sum = \(textField.text!) + \(secondTextField.text!) = \(sum)"
    }
    
    
}

