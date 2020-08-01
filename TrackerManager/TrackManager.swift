//
//  TrackManager.swift
//  TrackerManager
//
//  Created by hanyu on 2020/8/1.
//  Copyright © 2020 hanyu. All rights reserved.
//

import Foundation

final class TrackerManager: Tracker {
    
    private(set) var store: EventStore

    private let queue = DispatchQueue(label: "tracker manager", qos: .default, attributes: .concurrent, autoreleaseFrequency: .never, target: nil)
    
    init(store: EventStore) {
        self.store = store
    }
    
    func add(event: Event) {
        queue.async(group: nil, qos: .default, flags: .barrier) {
            self.store.add(event: event)
        }
    }
    
    func removeAllEvents() {
        queue.async(group: nil, qos: .default, flags: .barrier) {
            for i in 1...self.store.events.count {
                let index = self.store.events.count - i
                self.store.removeEvent(at: index)
            }
        }
    }
}
