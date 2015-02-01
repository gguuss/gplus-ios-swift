//
//  ViewController.swift
//  swiftsignin
//
//  Created by Gus Class on 12/12/14.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import UIKit


class ViewController: UIViewController, GPPSignInDelegate {
    @IBOutlet weak var toggleFetchEmail: UISwitch!
    @IBOutlet weak var toggleFetchUserID: UISwitch!
    
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var disconnectButton: UIButton!
    
    @IBOutlet weak var emailDataField: UITextView!
    @IBOutlet weak var userData: UITextView!

    override func viewDidLoad() {
      super.viewDidLoad();

      // Configure the sign in object.
      var signIn = GPPSignIn.sharedInstance();
      signIn.shouldFetchGooglePlusUser = true;
      signIn.clientID = "REPLACE_CLIENT_ID"; // Get this from https://console.developers.google.com
      signIn.shouldFetchGoogleUserEmail = toggleFetchEmail.on;
      signIn.shouldFetchGoogleUserID = toggleFetchUserID.on;
      signIn.scopes = [kGTLAuthScopePlusLogin];
      signIn.trySilentAuthentication();
      signIn.delegate = self;

      // Update the buttons and text.
      updateUI();
    }

    
    @IBAction func signInClicked(sender: AnyObject) {
      var signIn = GPPSignIn.sharedInstance();
      signIn.authenticate();
    }

    
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
      updateUI();
    }

    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

    
    @IBAction func toggleFetchEmailClick(sender: AnyObject) {
      GPPSignIn.sharedInstance().shouldFetchGoogleUserEmail = toggleFetchEmail.on;
    }

    
    @IBAction func toggleUserId(sender: AnyObject) {
      GPPSignIn.sharedInstance().shouldFetchGoogleUserID = toggleFetchUserID.on;
    }
    

    @IBAction func disconnect(sender: AnyObject) {
      GPPSignIn.sharedInstance().disconnect();
      updateUI();
    }
    
    
    @IBAction func signOut(sender: AnyObject) {
        GPPSignIn.sharedInstance().signOut();
        updateUI();
    }
    
    func updateUI() {
      // TODO: Toggle buttons here.
      if (GPPSignIn.sharedInstance().userID != nil){
        // Signed in?
        var user = GPPSignIn.sharedInstance().googlePlusUser;
        userData.text = user.name.JSONString();
        if (user.emails != nil){
          emailDataField.text = user.emails.first?.JSONString() ?? "no email";
        } else {
          emailDataField.text = "no email";
        }
        
        signOutButton.enabled = true;
        disconnectButton.enabled = true;
        signinButton.enabled = true;
      } else {
          userData.text = "Signed out.";
          emailDataField.text = "Signed out.";
          signOutButton.enabled = false;
          disconnectButton.enabled = false;
          signinButton.enabled = true;
      }
    }
}

