//
//  ViewController.swift
//  Gamezop Developer
//
//  Created by Gamezop Developer on 24/05/16.
//  Copyright © 2016 Balram Pandey. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
class ViewController: UIViewController,FBSDKLoginButtonDelegate
{
//    @IBOutlet var gamezopTitle: UILabel!

    @IBOutlet weak var facebookLoginButtom: FBSDKLoginButton!
    @IBOutlet weak var label: UILabel!
       override func viewDidLoad() {
        super.viewDidLoad()
        label.font = label.font.fontWithSize(40)
         self.facebookLoginButtom.delegate = self
        if(FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("Not Loging....?")
        }
        else
        {
            print("LogedIn....!")
             facebookLoginButtom.readPermissions = ["public_profile","email","user_friends"]
        }
        //var loginButton = FBSDKLoginButton()
        //loginButton.readPermissions = ["public_profile","email","user_friends"]
        
        //loginButton.center=self.view.center
        //loginButton.delegate=self
        //self.view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error==nil
            
        {
            print("Login Complete..")
            FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).startWithCompletionHandler { (connection, result, error) -> Void in
                let strFirstName: String = (result.objectForKey("first_name") as? String)!
                let strLastName: String = (result.objectForKey("last_name") as? String)!
                let strPictureURL: String = (result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as? String)!
                print("Name="+strFirstName)
                print("Last Name="+strLastName)
                print("strPictureURL="+strPictureURL)
                
                // self.lblName.text = "Welcome, \(strFirstName) \(strLastName)"
                // self.ivUserProfileImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: strPictureURL)!)!)
            }
            
            
           // self.performSegueWithIdentifier("newFile", sender: self)
        }
        else
        {
            
            print(error.localizedDescription)
        }
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("Logout....?")
    }

}

