//
//  BankAccountDomain.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class BankAccountDomain: EventSourcedAggregateRoot {
    private var balance = 0.0

    func getBalance() -> Double {
        return balance
    }
    
    func withdrawMoney(command: WithdrawCommand) {
        guard let data = command.getData(),
              let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: data) as? [String : Any] else {
            return
        }
        
        if let amount = unarchivedData["amount"] as? Double {
            let event = MoneyWasWithdrawn.create(rootUUID: self.rootUUID, amount: amount)
            self.apply(event: event)
        }
    }
    
    func depositMoney(command: DepositCommand) {
        guard let data = command.getData(),
              let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: data) as? [String : Any] else {
            return
        }
        
        if let amount = unarchivedData["amount"] as? Double {
            let event = MoneyWasDeposited.create(rootUUID: self.rootUUID, amount: amount)
            self.apply(event: event)
        }
    }

    func applyMoneyWasWithdrawn(_ event: MoneyWasWithdrawn) {
        balance -= event.getAmount()
    }
    
    func applyMoneyWasDeposited(_ event: MoneyWasDeposited) {
        balance += event.getAmount()
    }
}
