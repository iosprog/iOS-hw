//
//  ViewController.swift
//  timerApp
//
//  Created by РАХАТ  on 01.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC"{
            if let secondVC = segue.destination as? SecondViewController{
                secondVC.time = Int(textField.text!) ?? 0
            }
        }
    }

}

 
