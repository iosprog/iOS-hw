import UIKit

class TableViewController: UITableViewController {

    var array: [info] = []
    var time = 0
    var timer = Timer()
    var startedTime = 0
    var isTimerRunning = false
    var arrayNews = [
        info(imageName: "1", textField: "Аким не предупредил поликлинику о визите и наткнулся на \"беспорядок\": видео", timer: ""),
        info(imageName: "2", textField: "Марат Елибаев стал главой правления Банка развития Казахстана", timer: ""),
        info(imageName: "3", textField: "\"Люди иногда просто не замечают нас\". Как живут и сколько зарабатывают курьеры в Алматы", timer: ""),
        info(imageName: "4", textField: "Токаев дал поручения министру обороны", timer: ""),
        info(imageName: "5", textField: "В Казахстане есть местность, где живут 3 человека", timer: ""),
        info(imageName: "6", textField: "\"Слово пацана\". Казахстанский полицейский жестко раскритиковал \"хайповый\" российский сериал", timer: "")
    ]
    var timerInfo = info()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateNews()
        timerInfo.timer = timeToString(intTime: time)
        startedTime = time

        if self.isTimerRunning {
            return
        }

        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
        self.isTimerRunning = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func updateTimerInfo() {
        for index in arrayNews.indices {
            var mutableInfo = arrayNews[index]
            mutableInfo.timer = timeToString(intTime: time)
            arrayNews[index] = mutableInfo
        }
    }

    func updateNews() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            
            self.array.insert(self.arrayNews[5], at: 0)
            
            if self.array.count > self.arrayNews.count {
                    self.array.removeLast()
                    }
                        
            self.tableView.reloadData()
                    }
            }


    func timeToString(intTime: Int) -> String {
        let seconds = abs(intTime % 60)
        return String(format: "Было добавлено %2d секунд назад", seconds)
    }

    @objc func countTime() {
        time -= 1
        updateTimerInfo()

        if timerInfo.timer == String(0) {
            timer.invalidate()
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let imageView = cell.viewWithTag(1000) as! UIImageView
        imageView.image = UIImage(named: arrayNews[indexPath.row].imageName)

        let labelNews = cell.viewWithTag(1001) as! UILabel
        labelNews.text = arrayNews[indexPath.row].textField

        let labelTimer = cell.viewWithTag(1002) as! UILabel
        labelTimer.text = arrayNews[indexPath.row].timer

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
}
