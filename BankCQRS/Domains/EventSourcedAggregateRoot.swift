//
//  EventSourcedAggregateRoot.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import Foundation

class EventSourcedAggregateRoot : NSObject {
    
    var uncomittedEvents: [Event] = []
    var playhead = -1
    open internal(set) var rootUUID = ""
    
    func apply(event: Event) {
        self.handleRecursively(event: event)
        
        self.playhead += 1
        event.rootUUID = self.rootUUID
        event.playhead = NSNumber(value: self.playhead)
        self.uncomittedEvents.append(event)
    }
    
    func applyWithoutAddingEvents(event: Event) {
        self.playhead += 1
        self.handleRecursively(event: event)
    }
    
    func getUncommittedEvents() -> [Event] {
        let stream = self.uncomittedEvents
        
        self.uncomittedEvents = []
        
        return stream
    }
    
    func handleRecursively(event: Event) {
        self.handleEvent(event: event)
        
        for childEntity in self.getChildEntities() {
            childEntity.aggregateRoot = self
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
    
    func getChildEntities() -> [EventSourcedEntity] {
        return [];
    }
}

