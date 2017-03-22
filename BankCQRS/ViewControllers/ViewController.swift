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
        CommandBus.sharedInstance.subscribe(handler: BankAccountCommandHandler())
    }

    @IBAction func withdrawAction() {
        // TODO
        self.amount = self.getAmount()
        let withdrawCommand = WithdrawCommand(amount: amount)
        CommandBus.sharedInstance.dispatch(command: withdrawCommand)
        print("Widthdraw: \(amount)")
    }
    
    @IBAction func depositAction() {
        // TODO
        let amount = self.amount
        print("Widthdraw: \(amount)")
    }
    
    
    func getAmount() -> Double {
        guard let amount = self.amountTextField.text else {
            return 0
        }
        
        return Double(amount)!
    }
}
