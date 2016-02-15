//
//  TwitterClient.swift
//  Twitter
//
//  Created by Jacob Hughes on 2/14/16.
//  Copyright © 2016 Jacob Hughes. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "1Quwc879n0bkIui6WpLX3dDR6"
let twitterConsumerSecret = "nmrzK1kcA3MWfkL39Za107bJZ6ukyMJGPTk1KUafZreWeCJoAB"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")


    

class TwitterClient: BDBOAuth1Credential {
    
    class var sharedInstance: TwitterClient {
        struct Static{
            static let instance =  TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance
    }

}
