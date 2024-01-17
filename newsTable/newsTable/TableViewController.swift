import UIKit

class TableViewController: UITableViewController {
	
	var sourceArray = [
		Info(imageName: "1", textField: "Аким не предупредил поликлинику о визите и наткнулся на \"беспорядок\": видео"),
		Info(imageName: "2", textField: "Марат Елибаев стал главой правления Банка развития Казахстана"),
		Info(imageName: "3", textField: "\"Люди иногда просто не замечают нас\". Как живут и сколько зарабатывают курьеры в Алматы"),
		Info(imageName: "4", textField: "Токаев дал поручения министру обороны"),
		Info(imageName: "5", textField: "В Казахстане есть местность, где живут 3 человека"),
		Info(imageName: "6", textField: "\"Слово пацана\". Казахстанский полицейский жестко раскритиковал \"хайповый\" российский сериал")
	]
	var array: [Info] = []
	var i = 1
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateNews()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return array.count
	}
	
	func updateNews() {
		Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
			if self.i > self.sourceArray.count {
				timer.invalidate()
				return
			}
			
			self.array.insert(self.sourceArray[self.sourceArray.count - self.i], at: 0)
			self.array[0].date = Date()
			
			self.i += 1
			self.tableView.reloadData()
		}
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		let imageView = cell.viewWithTag(1000) as! UIImageView
		imageView.image = UIImage(named: array[indexPath.row].imageName)
		
		let labelNews = cell.viewWithTag(1001) as! UILabel
		labelNews.text = array[indexPath.row].textField
		
		let interval = "\(Int(Date().timeIntervalSince(array[indexPath.row].date))) секунды назад"
		let labelTimer = cell.viewWithTag(1002) as! UILabel
		labelTimer.text = interval
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
		
		detailVc.fullInfo = array[indexPath.row]
		
		navigationController?.show(detailVc, sender: self)
	}
}
