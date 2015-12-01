//
//  AppDelegate.swift
//  Markdown
//
//  Created by Boris Bügling on 01/12/15.
//  Copyright © 2015 Contentful GmbH. All rights reserved.
//

import Contentful
import UIKit

let client = ContentfulClient(spaceIdentifier: "z57xujtsbou0", accessToken: "d81a8212a5a4f65bd27c5032d90b3670d2a80192e4918b2a911e0c4d0c763bbf")

func showError(error: ErrorType, _ vc: UIViewController) {
    let alertController = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
    vc.presentViewController(alertController, animated: true, completion: nil)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let tabBarController = UITabBarController()
        tabBarController.title = "Contentful Markdown Example"
        tabBarController.viewControllers = [MDWebViewController(), MDTextViewController()]

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        window?.rootViewController = UINavigationController(rootViewController: tabBarController)
        window?.makeKeyAndVisible()
        return true
    }
}
