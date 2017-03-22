//
//  BankAccountDomain.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class BankAccountDomain: EventSourcedAggregateRoot {
    var balance = 0.0

    func getBalance() -> Double {
        return balance
    }
}

extension BankAccountDomain {
    func withdrawMoney(amount: Double) {
        if amount <= balance  {
            let event = MoneyWasWithdrawn.create(rootUUID: self.rootUUID, amount: amount)
            self.apply(event: event)
        }
    }
    
    func applyMoneyWasWithdrawn(_ event: MoneyWasWithdrawn) {
        balance -= event.getAmount()
    }
    
}

extension BankAccountDomain {
    func depositMoney(amount: Double) {
        let event = MoneyWasDeposited.create(rootUUID: self.rootUUID, amount: amount)
        self.apply(event: event)
    }
    
    func applyMoneyWasDeposited(_ event: MoneyWasDeposited) {
        balance += event.getAmount()
    }
}
