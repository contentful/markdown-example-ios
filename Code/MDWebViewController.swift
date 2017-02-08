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
    var entryId = "4bJdF7zhwkwcWq202gmkuM"

    convenience init() {
        self.init(nibName: nil, bundle: nil)

        self.tabBarItem = UITabBarItem(title: "WebView", image: UIImage(named: "webView"), tag: 0)
    }

    func convertMarkdownToHTML(_ markdown: String) throws -> String {
        return try MMMarkdown.htmlString(withMarkdown: markdown, extensions: MMMarkdownExtensions.gitHubFlavored)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)

        webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.frame.size.height ?? 0, right: 0)
        webView.scrollView.scrollIndicatorInsets = webView.scrollView.contentInset

        client.fetchEntry(identifier: entryId).1.next { (entry) in
            if let markdown = entry.fields["body"] as? String {
                do {
                    let html = try self.convertMarkdownToHTML(markdown)
                    webView.loadHTMLString(html, baseURL: URL(string: "https://www.contentful.com"))
                } catch let error {
                    showError(error, self)
                }
            }
        }.error { (error) in
            showError(error, self)
        }
    }
}
