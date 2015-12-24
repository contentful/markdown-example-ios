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

        webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.frame.size.height ?? 0, right: 0)
        webView.scrollView.scrollIndicatorInsets = webView.scrollView.contentInset

        client.fetchEntry("4bJdF7zhwkwcWq202gmkuM").1.next { (entry) in
            if let markdown = entry.fields["body"] as? String {
                do {
                    let html = try MMMarkdown.HTMLStringWithMarkdown(markdown, extensions: MMMarkdownExtensions.GitHubFlavored)
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
