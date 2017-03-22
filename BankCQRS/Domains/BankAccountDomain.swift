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
        guard let data = command.getData() else {
            return
        }

        guard let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: data) as? [String : Any] else {
            return
        }
        
        if let amount = unarchivedData["amount"] as? Double {
            if balance - amount < 0 {
                print("You are broke, you cannot withdraw money")
            } else {
                let event = MoneyWasWithdrawn.create(rootUUID: self.rootUUID, amount: amount)
                self.apply(event: event)
            }
        }
    }
}
