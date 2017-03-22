//
//  BankAccountEventHandler.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class BankAccountEventHandler: EventHandler {
    func handle(event: MoneyWasWithdrawn) {
        let bankAccount = load(uuid: event.rootUUID)
        bankAccount.withdraw(amount: event.getAmount())
        ReadModelStore.sharedInstance.bankAccounts = [bankAccount]
    }
    
    func handle(event: MoneyWasDeposited) {
        let bankAccount = load(uuid: event.rootUUID)
        bankAccount.deposit(amount: event.getAmount())
        ReadModelStore.sharedInstance.bankAccounts = [bankAccount]
    }
    
    func load(uuid: String) -> BankAccount {
        guard let firstBankAccount = ReadModelStore.sharedInstance.bankAccounts.first else {
            return BankAccount(uuid: uuid)
        }
        
        return firstBankAccount
    }
}
