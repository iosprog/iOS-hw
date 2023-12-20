import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelMistakes: UILabel!
    @IBOutlet weak var labelMoves: UILabel!
    @IBOutlet weak var labelWin: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var images = ["1", "2", "3", "4", "5", "6", "7", "8",
                  "1", "2", "3", "4", "5", "6", "7", "8"]
    var click1 = 0
    var click2 = 0
    var mistakes = 0
    var moves = 0
    var addToWin = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        images.shuffle()
        buttons.forEach { $0.setBackgroundImage(nil, for: .normal) }
        labelMistakes.text = "Mistakes: \(mistakes)"
        labelMoves.text = "Moves: \(moves)"
        labelWin.text = "Matches: \(addToWin)/8"
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        
        
        guard let index = buttons.firstIndex(of: sender)
        
        else {
            return
        }

        if click1 == 0 {
            click1 = index + 1
            sender.setBackgroundImage(UIImage(named: images[index]), for: .normal)
        } else if click2 == 0 && click1 != index + 1 {
            click2 = index + 1
            sender.setBackgroundImage(UIImage(named: images[index]), for: .normal)
            compare()
        }
    }

    func compare() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if self.images[self.click1 - 1] != self.images[self.click2 - 1] {
                self.buttons[self.click1 - 1].setBackgroundImage(nil, for: .normal)
                self.buttons[self.click2 - 1].setBackgroundImage(nil, for: .normal)
                self.labelMistakes.text = "Mistakes: \(self.mistakes + 1)"
            } else {
                self.labelWin.text = "Matches: \(self.addToWin + 1)/8"
                self.alert()
            }
            self.labelMoves.text = "Moves: \(self.moves + 1)"
            self.mistakes += 1
            self.moves += 1

            self.click1 = 0
            self.click2 = 0
        }
    }

    func alert() {
        print("Совпадение!")
        
        self.labelMoves.text = "Moves: \(self.moves+1)"
        self.mistakes -= 1
        self.addToWin += 1
        
        if addToWin == 8
        {
            let alert = UIAlertController(title: "Победа!", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: {UIAlertAction in self.clear()
            }))
            
            present(alert, animated: true, completion: nil)
            return
        }
        let alert = UIAlertController(title: "Совпадение!", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: {UIAlertAction in
        }))
        
        present(alert, animated: true, completion: nil)
        }
    
    func clear(){
        click1 = 0
        click2 = 0
        mistakes = 0
        moves = 0
        addToWin = 0
        buttons.forEach { $0.setBackgroundImage(nil, for: .normal) }
        labelMistakes.text = "Mistakes: \(mistakes)"
        labelMoves.text = "Moves: \(moves)"
        labelWin.text = "Matches: \(addToWin)/8"
    }
}
