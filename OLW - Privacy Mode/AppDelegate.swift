//
//  AppDelegate.swift
//  OLW - Privacy Mode
//
//  Created by Tiny Apps on 1/9/20.
//

import Cocoa
import SwiftUI

//@main
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            NSApp.terminate(self)
        }
    }

    func application(_ application: NSApplication, open urls: [URL]) {
        self.requestToOpen(urls)
    }
    
    func requestToOpen(_ urls:[URL]){
        let url:URL? = urls.first
        if url == nil {return}
        
        let bundleIdentifier = Incognito.receivedURLBundleIdentifier(url!)
        let urltoopen = Incognito.receivedURLRequestedURL(url!)
        
        if bundleIdentifier != nil && urltoopen != nil{
            Incognito.openPrivatetoURL(urltoopen!, bundleIdentifier!)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

