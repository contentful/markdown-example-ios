//
//  MDWebViewController.swift
//  Markdown
//
//  Created by Boris Bügling on 01/12/15.
//  Copyright © 2015 Contentful GmbH. All rights reserved.
//

import MMMarkdown
import WebKit

class MDWebViewController: UIViewController {
    convenience init() {
        self.init(nibName: nil, bundle: nil)

        self.tabBarItem = UITabBarItem(title: "WebView", image: UIImage(named: "webView"), tag: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)

        client.fetchEntry("4bJdF7zhwkwcWq202gmkuM").1.next { (entry) in
            if let markdown = entry.fields["body"] as? String {
                do {
                    let html = try MMMarkdown.HTMLStringWithMarkdown(markdown)
                    webView.loadHTMLString(html, baseURL: nil)
                } catch let error {
                    showError(error, self)
                }
            }
        }.error { (error) in
            showError(error, self)
        }
    }
}
