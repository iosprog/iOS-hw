//
//  ViewController.swift
//  tableView
//
//  Created by РАХАТ  on 21.11.2023.
//

import UIKit

struct Info {
    var imageName = ""
    var textField = ""
	var date = Date()
}

class ViewController: UIViewController {
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imageViewNews: UIImageView!
    
    var fullInfo = Info()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelText.text = fullInfo.textField
        imageViewNews.image = UIImage(named: fullInfo.imageName)
    }


}

