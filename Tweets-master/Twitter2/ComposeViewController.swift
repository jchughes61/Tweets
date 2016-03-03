//
//  ComposeViewController.swift
//  Twitter2
//
//  Created by Jacob Hughes on 2/29/16.
//  Copyright © 2016 Jacob Hughes. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var composeLabel: UITextView!
    var userName: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg3.jpg")!)
        
        composeLabel.layer.cornerRadius = 15
        composeLabel.clipsToBounds = true        // Do any additional setup after loading the view.
    
        if let userName = userName{
            composeLabel.text = "@" + userName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
