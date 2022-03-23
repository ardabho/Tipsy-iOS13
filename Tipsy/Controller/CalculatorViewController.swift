import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Float = 0.0
    var split: Float = 2
    var totalBill: Float?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //tip change buttons pressed
        
        sender.isSelected = true
        billTextField.endEditing(true)
        
        switch sender.currentTitle {
        case "0%":
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0
        case "10%":
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0.1
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            tip = 0.2
        default:
            print("error")
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Float(sender.value)
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let amount = Float(billTextField.text ?? "0.0")
        if amount != nil {
            totalBill = (amount! + (amount! * tip)) / split
            
        } else {
            totalBill = 0.0
        }
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults"{
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.totalBillPerPerson = totalBill
            destinationVC.split = split
            destinationVC.tip = tip
        }
    }
}

