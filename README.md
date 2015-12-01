# Markdown Example

This is an iOS application example displaying Markdown context stored on [Contentful][1]. It demonstrates both converting Markdown to HTML using [MMMarkdown][3] which will be displayed in a `WKWebView` as well as converting Markdown to `NSAttributedString` using [CocoaMarkdown][4] to display them in a `UITextView`.

[Contentful][1] is a content management platform for web applications, mobile apps and connected devices. It allows you to create, edit & manage content in the cloud and publish it anywhere via powerful API. Contentful offers tools for managing editorial teams and enabling cooperation between organizations.

## Usage

Install dependencies using [CocoaPods][2]:

```bash
$ pod install
```

then open `Markdown.xcworkspace` to build and run the app.

## License

Copyright (c) 2015 Contentful GmbH. See LICENSE for further details.


[1]: https://www.contentful.com
[2]: http://cocoapods.org
[3]: https://github.com/mdiep/MMMarkdown
[4]: https://github.com/indragiek/CocoaMarkdown
