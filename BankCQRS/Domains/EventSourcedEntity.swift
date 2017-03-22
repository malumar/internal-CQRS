//
//  EventSourcedEntity.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import Foundation

class EventSourcedEntity : NSObject{
    
    open var aggregateRoot: EventSourcedAggregateRoot?
    
    func getAmount() -> Int {
        return 0
    }
    
    public func handleRecusively(event: Event) {
        self.handleEvent(event: event)
        
        for childEntity in self.getChildEntities() {
            childEntity.aggregateRoot = self.aggregateRoot
            childEntity.handleRecusively(event: event)
        }
    }
    
    func handleEvent(event: Event) {
        let selectorName = "apply\(event.type):"
        let selector = NSSelectorFromString(selectorName)
        
        if (self.responds(to: selector)) {
            self.perform(selector, with: event)
        }
    }
    
    func apply(event: Event) {
        self.aggregateRoot?.apply(event: event)
    }
    
    func getChildEntities() -> [EventSourcedEntity] {
        return []
    }
}
