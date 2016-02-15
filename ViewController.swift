//
//  ViewController.swift
//  Twitter
//
//  Created by Jacob Hughes on 2/14/16.
//  Copyright © 2016 Jacob Hughes. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithBlock() {
            
        }
        
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemo://oauth"),scope: nil, success: {(requestToken: BDBOAuthToken!) -> Void in
            print("Got the request token")
            var authURL = "https://api.twitter.com/oauth/authorize?oauth_token=\(request.token)"
            
            
            UIApplication.sharedApplication().openURL(authURL)
        
            }) { (error: NSError!) -> Void in
                print("Failed to get the request token")
    
    }
    
}

