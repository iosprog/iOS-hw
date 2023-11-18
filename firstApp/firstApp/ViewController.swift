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

    var operation = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchedPlus(_ sender: Any) {
        
        operation = "+"
    }
    
    @IBAction func touchedMinus(_ sender: Any) {
        
        operation = "-"
    }
    
    @IBAction func touchedMultiply(_ sender: Any) {
        
        operation = "*"
    }
    
    @IBAction func touchedDivide(_ sender: Any) {
        
        operation = "/"
    }
    
    @IBAction func touchedEqual(_ sender: Any) {
        
        let a = textField.text!
        
        let b = secondTextField.text!
        
        if a.isEmpty && b.isEmpty
        {
            textField.placeholder = "Put number"
            secondTextField.placeholder = "Put number"
        }
            
        if operation == "+"
        {
            let sum = Int(a)! + Int(b)!
            label.text = "result = \(sum)"
        }
        else if operation == "-"
        {
            let minus = Int(a)! - Int(b)!
            label.text = "result = \(minus)"
        }
        else if operation == "*"
        {
            let multiply = Int(a)! * Int(b)!
            label.text = "result = \(multiply)"
        }
        else if operation == "/"
        {
            let divide = Int(a)! / Int(b)!
            label.text = "result = \(divide)"
        }
    }
}

