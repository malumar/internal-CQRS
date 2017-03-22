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
    }

    @IBAction func withdrawAction() {
        self.amount = self.getAmount()
        let withdrawCommand = WithdrawCommand(amount: amount)
        CommandBus.sharedInstance.dispatch(command: withdrawCommand)
        
        guard let balance = ReadModelStore.sharedInstance.bankAccounts.first?.balance else {
            balanceLabel.text = ""
            return
        }
        
        balanceLabel.text = "\(balance)€"
    }
    
    @IBAction func depositAction() {
        self.amount = self.getAmount()
        let depositCommand = DepositCommand(amount: amount)
        CommandBus.sharedInstance.dispatch(command: depositCommand)
        
        guard let balance = ReadModelStore.sharedInstance.bankAccounts.first?.balance else {
            balanceLabel.text = ""
            return
        }
        
        balanceLabel.text = "\(balance)€"
    }
    
    
    func getAmount() -> Double {
        guard let amount = self.amountTextField.text, let finalAmount = Double(amount) else {
            return 0
        }
        
        return finalAmount
    }
}
