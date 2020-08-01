//
//  MyViewController.swift
//  TrackerManager
//
//  Created by hanyu on 2020/8/1.
//  Copyright © 2020 hanyu. All rights reserved.
//

import UIKit

enum ProductEvents: Event {
    case action(Int) //index
    case browse
    
    var name: String {
        return "recommend_products"
    }
    
    var type: String {
        switch self {
        case .action:
            return "action"
        case .browse:
            return "browse"
        }
    }
    
    var properties: [String : Any]? {
        switch self {
        case .action(let index):
            return ["selectedItemIndex": index]
        case .browse:
            return nil
        }
    }
}

class MyViewController: UIViewController {
    
    private let tracker: Tracker
    
    init(tracker: Tracker) {
        self.tracker = tracker
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(buttonDidPress(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let event = OtherEvents(name: "", type: "", properties: nil)
        tracker.add(event: event)
    }
    
    @objc
    func buttonDidPress(_ sender: Any) {
        let event = ProductEvents.action(0)
        tracker.add(event: event)
    }
}
