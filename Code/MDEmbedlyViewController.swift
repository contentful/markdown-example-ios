//
//  MDEmbedlyViewController.swift
//  Markdown
//
//  Created by Boris Bügling on 24/12/15.
//  Copyright © 2015 Contentful GmbH. All rights reserved.
//

import UIKit

class MDEmbedlyViewController: MDWebViewController {
    let embedlyCode = "<script>(function(w, d){var id='embedly-platform', n = 'script';if (!d.getElementById(id)){ w.embedly = w.embedly || function() {(w.embedly.q = w.embedly.q || []).push(arguments);}; var e = d.createElement(n); e.id = id; e.async=1; e.src = ('https:' === document.location.protocol ? 'https' : 'http') + '://cdn.embedly.com/widgets/platform.js'; var s = d.getElementsByTagName(n)[0]; s.parentNode.insertBefore(e, s); } })(window, document); </script>"

    convenience init() {
        self.init(nibName: nil, bundle: nil)

        self.entryId = "3qhObH1ZPyG6uCkqwyiiCG"
        self.tabBarItem = UITabBarItem(title: "Embedly", image: UIImage(named: "webView"), tag: 0)
    }

    override func convertMarkdownToHTML(markdown: String) throws -> String {
        let html = try super.convertMarkdownToHTML(markdown)
        return "<html><head>\(embedlyCode)</head><body>\(html)</body></html>"
    }
}
