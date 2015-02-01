//
//  ViewController.swift
//  swiftsignin
//
//  Created by Gus Class on 12/12/14.
//  Copyright (c) 2014 gclassy. All rights reserved.
//

import UIKit


class ViewController: UIViewController, GPPSignInDelegate {
    @IBOutlet weak var toggleFetchEmail: UISwitch!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var toggleFetchUserID: UISwitch!
    @IBOutlet weak var userData: UITextView!
    @IBOutlet weak var emailDataField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view, typically from a nib.
        var signIn = GPPSignIn.sharedInstance();
        signIn.shouldFetchGooglePlusUser = true;
        signIn.clientID = "YOUR_CLIENT_ID"; // Get this from https://console.developers.google.com
        signIn.shouldFetchGoogleUserEmail = toggleFetchEmail.enabled;
        signIn.shouldFetchGoogleUserID = toggleFetchUserID.enabled;
        signIn.scopes = [kGTLAuthScopePlusLogin];
        signIn.trySilentAuthentication();
        signIn.delegate = self;
    }

    @IBAction func signInClicked(sender: AnyObject) {
        var signIn = GPPSignIn.sharedInstance();
        signIn.authenticate();
    }

    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        var signIn = GPPSignIn.sharedInstance();
        var user = signIn.googlePlusUser;
        var str = "User ID: " + user.JSONString();
        //NSLog(str);
        NSLog(user.name.JSONString());
        NSLog(user.emails.first?.JSONString() ?? "no email");
        emailDataField.text = user.emails.first?.JSONString() ?? "no email";
        userData.text = user.name.JSONString();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

