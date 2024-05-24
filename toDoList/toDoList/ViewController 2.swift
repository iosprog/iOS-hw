//
//  ViewController.swift
//  toDoList
//
//  Created by РАХАТ  on 27.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "Что вы хотите добавить в напоминания?"
        
        textField.placeholder = "например, купить молоко"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTask(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let taskName = textField.text!
        
        var newTask = TaskItem()
        
        newTask.name = taskName
        
        for _ in 0..<1 {
            if taskName.isEmpty {
                showMessage("Введите текст")
                return
            }
            textField.placeholder = "например, купить молоко"
        }
        
        do{
            if let data = defaults.data(forKey: "taskItemArray"){
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodeData = try JSONEncoder().encode(array)
                
                defaults.set(encodeData, forKey: "taskItemArray")
            }
            else{
                
                let encodeData = try JSONEncoder().encode([newTask])
                
                defaults.set(encodeData, forKey: "taskItemArray")
            }
            showMessage("Задача \"\(taskName)\" успешно добавлена в список!")
        }
        catch{
            print("unable to encode \(error)")
        }
        textField.text = ""
        
    }
        
        
        func showMessage(_ message: String) {
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            
            present(alertController, animated: true, completion: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    alertController.dismiss(animated: true, completion: nil)
                })
            })
        }
    }
