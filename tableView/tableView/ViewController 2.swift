//
//  ViewController.swift
//  tableView
//
//  Created by РАХАТ  on 21.11.2023.
//

import UIKit

struct Person{
    var fullName = ""
    var age = 0
    var placeOfBirth = "Неизвестно"
    var description = ""
    var imageName = ""
}

class ViewController: UIViewController {
    
    @IBOutlet weak var labelFullName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelPlaceOfB: UILabel!
    @IBOutlet weak var labelDescription: UITextView!
    @IBOutlet weak var imageview: UIImageView!
    
    var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelFullName.text = person.fullName
        labelAge.text = "Возраст: \(String(person.age))"
        labelPlaceOfB.text = "Место рождения: \(person.placeOfBirth)"
        labelDescription.text = "Описание: \n\(person.description)"
        imageview.image = UIImage(named: person.imageName)
    }


}

