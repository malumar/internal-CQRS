//
//  EventBus.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import Foundation

class EventBus: NSObject {
    open static let sharedInstance = EventBus()
    
    private var queue: [Event] = []
    private var isDispatching = false
    private var handlers: [EventHandler] = []
    
    private override init() {}
    
    func subscribe(_ handler: EventHandler) {
        self.handlers.append(handler)
    }
    
    func dispatch(events: [Event]) {
        self.queue.append(contentsOf: events)
        
        // ensure that every command a called once
        if isDispatching == false {
            isDispatching = true
            
            while let event = self.queue.first {
                event.visit(handlers: handlers)
                self.queue.removeFirst()
            }
            
            self.isDispatching = false
        }
    }
}
