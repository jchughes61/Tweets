//
//  TweetDetailViewController.swift
//  Twitter2
//
//  Created by Jacob Hughes on 2/22/16.
//  Copyright © 2016 Jacob Hughes. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    
    @IBOutlet weak var bannerLabel: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var picLabel: UIImageView!
    
    @IBOutlet weak var heartLabel: UIButton!
    @IBOutlet weak var likeNumLabel: UILabel!
    @IBOutlet weak var favLabel: UIButton!
    
    @IBOutlet weak var favNumLabel: UILabel!
    
    var tweet: Tweet?
    
    /*
    var indexPath: NSIndexPath!
    
    var delegate: TweetDelegate?
    var dataSource: TweetDataSource?
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1.jpg")!)
        
        
        let imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("userscreen", withExtension: "gif")!)
        let imageGif = UIImage.gifWithData(imageData!)
        let imageView = UIImageView(image: imageGif)
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: 375,height: 700)
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        
        //print(tweet)
        nameLabel.text = tweet?.userName
        dateLabel.text = String(tweet!.timeStamp!)
        handleLabel.text = "@" + (tweet?.userHandle)!
        textLabel.text = String(tweet!.text!)
        
        bannerLabel.setImageWithURL((tweet?.user.bannerImageURL)!)
        
        nameLabel.backgroundColor = UIColor.blackColor()
        nameLabel.layer.cornerRadius = 10.0
        nameLabel.clipsToBounds = true
        
        textLabel.backgroundColor = UIColor.blackColor()
        textLabel.layer.cornerRadius = 10.0
        textLabel.clipsToBounds = true
        
        picLabel.setImageWithURL((tweet?.user.profileURL)!)
        picLabel.layer.cornerRadius = 45
        picLabel.clipsToBounds = true
        
        favNumLabel.text = String(tweet!.retweetCount)
        likeNumLabel.text = String(tweet!.favoritesCount)
        
        favNumLabel.backgroundColor = UIColor.blackColor()
        likeNumLabel.backgroundColor = UIColor.blackColor()
        
        favNumLabel.layer.cornerRadius = 10.0
        favNumLabel.clipsToBounds = true
        likeNumLabel.layer.cornerRadius = 10.0
        likeNumLabel.clipsToBounds = true
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func favoriteAction(sender: AnyObject) {
        if(tweet?.favorited == 0){
            heartLabel.setImage(UIImage(named: "like-action-pink"), forState: .Normal)
            likeNumLabel.textColor = UIColor.redColor()
            tweet?.favorited = 1
            
            var pastFavorite = Int(self.likeNumLabel.text!)
            pastFavorite = pastFavorite! + 1
            self.likeNumLabel.text = String(pastFavorite!)
            
            
        }
        else{
            heartLabel.setImage(UIImage(named: "like-action-grey"), forState: .Normal)
            likeNumLabel.textColor = UIColor.grayColor()
            tweet?.favorited = 0
            
            var pastFavorite = Int(self.likeNumLabel.text!)
            pastFavorite = pastFavorite! - 1
            self.likeNumLabel.text = String(pastFavorite!)
        }
        
        
    }
    @IBAction func retweetAction(sender: AnyObject) {
        if(tweet?.retweeted == 0){
            favLabel.setImage(UIImage(named: "retweet-action-green"), forState: .Normal)
            favNumLabel.textColor = UIColor(red: 0, green: 0.8, blue: 0, alpha: 1)
            tweet?.retweeted = 1
            
            var pastRetweet = Int(self.favNumLabel.text!)
            pastRetweet = pastRetweet! + 1
            self.favNumLabel.text = String(pastRetweet!)
            
        }
        else{
            favLabel.setImage(UIImage(named: "retweet-action-grey"), forState: .Normal)
            favNumLabel.textColor = UIColor.grayColor()
            tweet?.retweeted = 0
            
            
            var pastRetweet = Int(self.favNumLabel.text!)
            pastRetweet = pastRetweet! - 1
            self.favNumLabel.text = String(pastRetweet!)
            
        }
        
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Reply" {
            let username = tweet?.userHandle
            
            let destinationViewController = segue.destinationViewController as! ComposeViewController
            destinationViewController.userName = username
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
