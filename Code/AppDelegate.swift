//
//  AppDelegate.swift
//  Markdown
//
//  Created by Boris Bügling on 01/12/15.
//  Copyright © 2015 Contentful GmbH. All rights reserved.
//

import Contentful
import UIKit

let client = Contentful.Client(spaceIdentifier: "z57xujtsbou0", accessToken: "d81a8212a5a4f65bd27c5032d90b3670d2a80192e4918b2a911e0c4d0c763bbf")

func showError(_ error: Error, _ vc: UIViewController) {
    let alertController = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
    vc.present(alertController, animated: true, completion: nil)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = UITabBarController()
        tabBarController.title = "Contentful Markdown Example"
        tabBarController.viewControllers = [MDWebViewController(), MDTextViewController(), MDEmbedlyViewController()]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UINavigationController(rootViewController: tabBarController)
        window?.makeKeyAndVisible()
        return true
    }
}
