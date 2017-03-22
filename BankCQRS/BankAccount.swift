//
//  BankAccount.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class BankAccount {
    private(set) var uuid = ""
    private(set) var balance = 0.0
    
    init(uuid: String) {
        self.uuid = uuid
    }
    
    func withdraw(amount: Double) {
        balance -= amount
    }
    
    func deposit(amount: Double) {
        balance += amount
    }
}
