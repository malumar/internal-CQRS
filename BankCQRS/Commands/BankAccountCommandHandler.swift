//
//  BankAccountCommandHandler.swift
//  BankCQRS
//
//  Created by Felix Carrard on 3/22/17.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import UIKit

class BankAccountCommandHandler: CommandHandler {
    func handle(command: WithdrawCommand) {
        print("handle cmd")
        let domain = load(uuid: command.getRootUUID())
        
        domain.withdrawMoney(amount: command.getAmount())
        save(domain: domain)
    }
    
    func handle(command: DepositCommand) {
        print("handle cmd")
        let domain = load(uuid: command.getRootUUID())
        domain.depositMoney(amount: command.getAmount())
        save(domain: domain)
    }
    
    func load(uuid: String) -> BankAccountDomain {
        let bankAccountDomain = BankAccountDomain()
        let events = EventStore.sharedInstance.getEvents()
        for event in events {
            bankAccountDomain.applyWithoutAddingEvents(event:event)
        }
        
        return bankAccountDomain
    }
    
    func save(domain: BankAccountDomain) {
        let uncommittedEvents = domain.getUncommittedEvents()
        
        EventStore.sharedInstance.save(uncommittedEvents: uncommittedEvents)
        EventBus.sharedInstance.dispatch(events: uncommittedEvents)
    }
}
