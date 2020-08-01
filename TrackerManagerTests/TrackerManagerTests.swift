//
//  TrackerManagerTests.swift
//  TrackerManagerTests
//
//  Created by hanyu on 2020/7/29.
//  Copyright © 2020 hanyu. All rights reserved.
//

import XCTest
@testable import TrackerManager

class TrackerManagerTests: XCTestCase {

    func test_tracker_addSuccess() {
        let store = EventStoreSpy()
        
        let tracker = TrackerManager(store: store)
        
        let event = ProductEvents.browse
        
        tracker.add(event: event)
        
        XCTAssertEqual(tracker.store.events.count, 1)
        
        guard let eventInStore = tracker.store.events.first else {
            XCTFail("should have first event.")
            return
        }
        
        XCTAssertEqual(eventInStore.name, "recommend_products")
        XCTAssertEqual(eventInStore.type, "browse")
    }
    
    func test_tracker_deleteSuccess() {
        let store = EventStoreSpy()
        
        let tracker = TrackerManager(store: store)
        
        let event = ProductEvents.browse
        
        tracker.add(event: event)
        
        XCTAssertEqual(tracker.store.events.count, 1)
        
        guard let _ = tracker.store.events.first else {
            XCTFail("should have first event.")
            return
        }
        
        tracker.removeAllEvents()
        
        XCTAssertEqual(tracker.store.events.count, 0)
    }

}

final class EventStoreSpy: EventStore {
    
    private var array: [Event] = []
    
    var events: [Event] {
        return array
    }
    
    func add(event: Event) {
        array.append(event)
    }
    
    func removeEvent(at index: Int) {
        array.remove(at: index)
    }
}
