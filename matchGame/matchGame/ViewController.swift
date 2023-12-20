//
//  ViewController.swift
//  matchGame
//
//  Created by РАХАТ  on 06.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var image = 1
    
    var state = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winState = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [0, 8], [0, 9], [0, 10], [0, 11], [0, 12], [0, 13], [0, 14], [0, 15]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func matchGame(_ sender: UIButton) {
        
        print(sender.tag)
        
        for i in 1...8 {
            if image == i {
                let imageName = "\(i)"
                sender.setBackgroundImage(UIImage(named: imageName), for: .normal)
                image = (i % 8) + 1
                state[sender.tag - 1] = i
                break
            }
        }
        
        for winArray in winState {
            if state[winArray[0]] == 1 && state[winArray[1]] == 1 {
                print("Similarity!")
                
                let alert = UIAlertController(title: "Similarity!", message: "", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: {UIAlertAction in
                    self.clear()
                }))
                
                present(alert, animated: true, completion: nil)
                
                return
            }
        }
    }
        
        func clear(){
            image = 1
            
            for i in 0...15{
                state[i] = 0
            }
        }
    }

