//
//  Inconigto.swift
//  OLW - Privacy Mode
//
//  Created by Tiny Apps on 1/9/20.
//

import Cocoa

class Incognito{
    static var schemepreprefix = "x-olw-privatemode-"
    
    static var bundleIdentifiersArgument:[String:String]{
        ["org.mozilla.firefox":"-private-window",
         "com.google.Chrome":"-incognito",
         "com.operasoftware.Opera":"-private",
         "com.google.Chrome.canary":"-incognito",
        ]
    }
    
    static var privacySupportedBrowsers:[String]{
        return Array(self.bundleIdentifiersArgument.keys) as [String]
    }
    
    static func receivedURLBundleIdentifier(_ url:URL) -> String?{
        let path = url.absoluteString
        return privacySupportedBrowsers.filter({path.contains(schemepreprefix + $0)}).first
    }
    
    static func receivedURLRequestedURL(_ url:URL) -> URL?{
        let path = url.absoluteString
        let bundleIdentifier = receivedURLBundleIdentifier(url)
        if bundleIdentifier == nil {return nil}        
        let newurl = URL(string: path.deletingPrefix(schemepreprefix + bundleIdentifier! + "://"))
        return newurl
    }
        
    static func openPrivatetoURL(_ url:URL?, _ bundleIdentifier:String){
        if url == nil {NSApp.terminate(self) ; return}
        if privacySupportedBrowsers.contains(bundleIdentifier) == false {NSApp.terminate(self); return}
        let arguments:[String] = ["-b" , bundleIdentifier, "--args", (bundleIdentifiersArgument[bundleIdentifier] ?? ""),  url!.absoluteString]
        Process.launchedProcess(launchPath: "/usr/bin/open", arguments: arguments)
        NSApp.terminate(self)
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
