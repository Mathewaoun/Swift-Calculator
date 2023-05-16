//
//  ViewController.swift
//  Calc
//
//  Created by Mathew on 2023-05-16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var CalcWork: UILabel!
    
    @IBOutlet weak var CalcResult: UILabel!
    
    var working:String=" "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll(){
        working=" "
        CalcWork.text = " "
        CalcResult.text = " "
    }
    
    @IBAction func Equal(_ sender: Any) {
        if (ValidInput()){
            let percent = working.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression (format: percent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatresult(result: result)
            CalcResult.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Invalid Input", message: "The calculator is not able to do this expression", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func ValidInput () -> Bool
        {
            var count = 0
            var index = [Int]()
            
            for char in working
            {
                if(specialChar(char: char))
                {
                    index.append(count)
                }
                count += 1
            }
            
            for i in index {
                if(i == 0)
                {
                    return false
                }
                
                if(i == working.count - 1)
                {
                    return false
                }
            }
            return true
        }
    
    func specialChar (char: Character) -> Bool
    {
        if (char == "*")
        {
            return true
            
        }
        if (char == "/")
        {
            return true
            
        }
        if (char == "+")
        {
            return true
            
        }
        if (char == "-"
        )
        {
            return true
            
        }
        return false
    }
    
    func formatresult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0 )
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }


    @IBAction func Clear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func Delete(_ sender: Any) {
        if(!working.isEmpty){
            working.removeLast()
            CalcWork.text = working
        }
    }
    
    func addtoWork(value : String){
        working = working + value
        CalcWork.text = working
    }
    
    @IBAction func Percentage(_ sender: Any) {
        addtoWork(value: "%")
    }
    
    
    @IBAction func Division(_ sender: Any) {
        addtoWork(value: "/")
    }
    
    @IBAction func Multiplaction(_ sender: Any) {
        addtoWork(value: "*")
    }
    
    
    @IBAction func Substraction(_ sender: Any) {
        addtoWork(value: "-")
    }
    
    @IBAction func Addition(_ sender: Any) {
        addtoWork(value: "+")
    }
    
    
    @IBAction func decimal(_ sender: Any) {
        addtoWork(value: ".")
    }
    
    @IBAction func zero(_ sender: Any) {
        addtoWork(value: "0")
    }
    
    
    @IBAction func one(_ sender: Any) {
        addtoWork(value: "1")
    }
    
    
    @IBAction func two(_ sender: Any) {
        addtoWork(value: "2")
    }
    
    
    @IBAction func three(_ sender: Any) {
        addtoWork(value: "3")
    }
    
    @IBAction func four(_ sender: Any) {
        addtoWork(value: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        addtoWork(value: "5")
    }
    
    
    @IBAction func six(_ sender: Any) {
        addtoWork(value: "6")
    }
    
    
    @IBAction func seven(_ sender: Any) {
        addtoWork(value: "7")
    }
    
    
    @IBAction func eight(_ sender: Any) {
        addtoWork(value: "8")
    }
    
    
    @IBAction func nine(_ sender: Any) {
        addtoWork(value: "9")
    }
    
    
    
    
    
    
}


