//
//  TableViewController.swift
//  tableView
//
//  Created by РАХАТ  on 22.11.2023.
//

import UIKit


var a = "\nАмериканский актер и продюсер, родился 18 декабря 1963 года. \n\nИзвестен своим многогранным актерским талантом и участием в фильмах различных жанров, включая \"Бойцовский клуб\", \"Завтрак у Тиффани\", \"Мировая война Z\"."
var b = "\nКанадский актер и музыкант, родился 12 ноября 1980 года. \n\nПолучил признание за свои роли в фильмах \"Поднимаясь\", \"Блэйд Раннер 2049\", \"Ла-Ла Ленд\", за которую был номинирован на премию \"Оскар\"."
var c = "\nАмериканский актер и продюсер, родился 3 июля 1962 года. \n\nИзвестен своими ролями в боевиках и приключенческих фильмах, таких как \"Верхом на метле\", \"Миссия невыполнима\", \"Топ Ган\"."
var d = "\nАнгло-валлийский актер, родился 30 января 1974 года. \n\nИзвестен своими трансформационными актерскими подходами, особенно в фильмах \"Американское психо\", \"Темный рыцарь\", \"Большой куш\"."
var e = "\nАвстралийская актриса и фильмовед, родилась 2 июля 1990 года. \n\nСтала широко известной благодаря своей роли Харли Квинн в \"Отряд самоубийц\", также сыграла в \"Волк с Уолл-стрит\", \"Три билборда на границе Эббинга, Миссури\"."


class TableViewController: UITableViewController {
    
    var arrayUsers = [Person(fullName: "Брэд Питт", age: 59, placeOfBirth: "США", description: a,  imageName: "brad"),
                      Person(fullName: "Райан Гослинг", age: 43, placeOfBirth: "Канада", description: b, imageName: "ryan"),
                      Person(fullName: "Том Круз", age: 61, placeOfBirth: "США", description: c, imageName: "tom"),
                      Person(fullName: "Кристиан Бэйл", age: 49, placeOfBirth: "Великобритания", description: d, imageName: "christian"),
                      Person(fullName: "Марго Робби", age: 33, placeOfBirth: "Австралия", description: e, imageName: "margot")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addPerson(_ sender: Any) {
        arrayUsers.append(Person(fullName: "Новый пользователь", imageName: "avatar"))
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayUsers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let labelFullName = cell.viewWithTag(1000) as! UILabel
        labelFullName.text = arrayUsers[indexPath.row].fullName
        
        let labelAge = cell.viewWithTag(1001) as! UILabel
        labelAge.text = "Возраст: \(String(arrayUsers[indexPath.row].age))"
        
        let labelPlaceOfBirth = cell.viewWithTag(1002) as! UILabel
        labelPlaceOfBirth.text = "Место рождения: \(String(arrayUsers[indexPath.row].placeOfBirth))"
    
        let imageView = cell.viewWithTag(1003) as! UIImageView
        imageView.image = UIImage(named: arrayUsers[indexPath.row].imageName)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
        detailVc.person = arrayUsers[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayUsers.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
