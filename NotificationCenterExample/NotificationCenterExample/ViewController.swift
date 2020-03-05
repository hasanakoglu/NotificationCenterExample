//
//  ViewController.swift
//  NotificationCenterExample
//
//  Created by Hasan on 05/03/2020.
//  Copyright © 2020 Hasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    let name = Notification.Name("didReceiveData") you can use this or the extension below, every notification has a name

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        NotificationCenter.default.addObserver(self, selector: #selector(resetDetails(_:)), name: .resetDetails, object: nil)
        /*
         This adds an entry with those parameters to the Notification Center, essentially telling it that self wants to observe for notifications with name .didReceiveData, and when that notification occurs, the function onDidReceiveData(_:) should be called.

         The addObserver(_:selector:name:object:) function has 4 parameters:

         The first parameter observer is unnamed, and you provide it with a reference to the object that is the observer for this notification, which often is self
         The second parameter selector is the function you want to call when the notification occurs, which works like the target-action pattern
         The third parameter name is the name of the notification you want to listen for, which is of type Notification.Name
         The fourth parameter object is an optional object whose notifications you want to receive, so if you set it, you’ll only receive notifications from that “sender”
         It’s smart to think of the observer and the selector as the target and the action. What function, a so-called selector, do you want to call on what object, a so-called observer, when the notification occurs?
         */
    }


    @objc func resetDetails(_ notification:Notification) {
        // Do something for example, reset details on log out
    }

    func logOutButtonPressed() {
        NotificationCenter.default.post(name: .resetDetails, object: nil)
        /*
         The function post(name:object:userInfo:) has 3 parameters:

         The first parameter is name, the notification name, of type Notification.Name. It’s exactly the same as the notification you’re observing, and it’s smart to use that extension here too.
         The second parameter is object, the sender of the notification. You can leave it empty with nil or use any object. It’s purpose is the same as the object parameter of addObserver(...), so you can use it to filter the sender of a notification.
         The third parameter is userInfo, and you can use it to send extra data with the notification. The parameter is not required, so you can leave it out if you don’t need it.
         */
    }

}

extension Notification.Name {
    static let resetDetails = Notification.Name("resetDetails")
    static let didCompleteTask = Notification.Name("didCompleteTask")
    static let completedLengthyDownload = Notification.Name("completedLengthyDownload")
}
