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
        load()
        // load, edit, save read model
    }
    
    func load() {
        
    }
}
