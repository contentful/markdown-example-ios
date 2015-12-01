//
//  MDTextViewController.swift
//  Markdown
//
//  Created by Boris Bügling on 01/12/15.
//  Copyright © 2015 Contentful GmbH. All rights reserved.
//

import CocoaMarkdown
import UIKit

class MDTextViewController: UIViewController {
    convenience init() {
        self.init(nibName: nil, bundle: nil)

        self.tabBarItem = UITabBarItem(title: "TextView", image: UIImage(named: "lightning"), tag: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
