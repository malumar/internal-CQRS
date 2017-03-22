//
//  CommandBus.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import Foundation

class CommandBus: NSObject {
    
    open static let sharedInstance = CommandBus()
    
    private var queue: [Command] = []
    private var isDispatching = false
    private var handlers: [CommandHandler] = []
    
    private override init() {}
    
    func subscribe(handler: CommandHandler) {
        self.handlers.append(handler)
    }
    
    func dispatch(command: Command) {
        self.queue.append(command)
        
        // ensure that every command a called once
        if isDispatching == false {
            self.isDispatching = true
            
            while let command = self.queue.first {
                command.visit(handlers: handlers)
                self.queue.removeFirst()
            }
            
            self.isDispatching = false
        }
    }
}
