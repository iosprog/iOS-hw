//
//  TableViewController.swift
//  newsTable
//
//  Created by РАХАТ  on 04.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayNews = [
        info(imageName: "1", textField: "Аким не предупредил поликлинику о визите и наткнулся на \"беспорядок\": видео"),
        info(imageName: "2", textField: "Марат Елибаев стал главой правления Банка развития Казахстана"),
        info(imageName: "3", textField: "\"Люди иногда просто не замечают нас\". Как живут и сколько зарабатывают курьеры в Алматы"),
        info(imageName: "4", textField: "Токаев дал поручения министру обороны"),
        info(imageName: "5", textField: "В Казахстане есть местность, где живут 3 человека"),
        info(imageName: "6", textField: "\"Слово пацана\". Казахстанский полицейский жестко раскритиковал \"хайповый\" российский сериал")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            // Add a new info object to the data source
                self.arrayNews.insert(self.arrayNews[5], at: 0)
            
            // Reload the table view to reflect the changes
            self.tableView.reloadData()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNews.count
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        

        let imageView = cell.viewWithTag(1000) as! UIImageView
            imageView.image = UIImage(named: arrayNews[indexPath.row].imageName)
                
        let labelNews = cell.viewWithTag(1001) as! UILabel
            labelNews.text = arrayNews[indexPath.row].textField

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
        detailVc.fullInfo = arrayNews[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayNews.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

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
