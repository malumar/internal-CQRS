//
//  EventRepository.swift
//  BankCQRS
//
//  Created by Vincent Oliveira on 17/03/2017.
//  Copyright © 2017 Vincent Oliveira. All rights reserved.
//

import Foundation

/// All repository must inherit from Repository
protocol EventRepository {
    
    /// Load model
    ///
    /// - Parameter rootUUID: UUID of the model we want to load
    /// - Returns: return a model
    func load(rootUUID: String) -> EventSourcedAggregateRoot

    /// Save an EventSourcedAggregateRoot
    ///
    /// - Parameter eventSourcedAggregateRoot: EventSourcedAggregateRoot to save
    func save(eventSourcedAggregateRoot: EventSourcedAggregateRoot)
}

extension EventRepository {
    func save(eventSourcedAggregateRoot: EventSourcedAggregateRoot) {
        let events = eventSourcedAggregateRoot.getUncommittedEvents()
        
        //RealmManager.sharedInstance.persistEvents(events: events)
        EventBus.sharedInstance.dispatch(events: events)
    }
}
