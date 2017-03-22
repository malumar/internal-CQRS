//
//  ViewController.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    var amount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func withdrawAction() {
        // TODO
        let amount = self.amount
        let withdrawCommand = WithdrawCommand(amount: amount)
        CommandBus.sharedInstance.dispatch(withdrawCommand)
        print("Widthdraw: \(amount)")
    }
    
    @IBAction func depositAction() {
        // TODO
        let amount = self.amount
        print("Widthdraw: \(amount)")
    }
    
    
    func getAmount() -> Float {
        guard let amount = self.amountTextField.text else {
            return 0
        }
        
        return Float(amount)!
    }
}
