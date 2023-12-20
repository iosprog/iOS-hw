//
//  ViewController.swift
//  tableView
//
//  Created by РАХАТ  on 21.11.2023.
//

import UIKit

struct info
{
    var imageName = ""
    
    var textField = ""
}


class ViewController: UIViewController {
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imageViewNews: UIImageView!
    
    var fullInfo = info()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelText.text = fullInfo.textField
        imageViewNews.image = UIImage(named: fullInfo.imageName)
    }


}

