//
//  ReadModelStore.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import Foundation

class ReadModelStore {
    static let sharedInstance = ReadModelStore()
    var bankAccounts: [BankAccount] = []
    
    private init() {}
}
