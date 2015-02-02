//
//  ViewController.swift
//  swift-play-games
//
//  Created by Gus Class on 2/1/15.
//  Copyright (c) 2015 gclassy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GPGStatusDelegate {

  var kClientID = "YOUR_CLIENT_ID";
  @IBOutlet weak var signInButton: UIButton!;
  @IBOutlet weak var statusText: UITextView!;
  @IBOutlet weak var signOutButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    GPGManager.sharedInstance().statusDelegate = self;
    statusText.text = "Initialized...";
    updateUI();
  }
  
  @IBAction func signInClicked(sender: AnyObject) {
    GPGManager.sharedInstance().signInWithClientID(kClientID, silently: false);
  }
  @IBAction func signOutClicked(sender: AnyObject) {
    GPGManager.sharedInstance().signOut();
    updateUI();
  }

  func didFinishGamesSignInWithError(error: NSError!) {
    updateUI();
    if (error != nil) {
      statusText.text = "ERROR:" + error.description;
    } else {
      statusText.text = "Signed in: " + GPGManager.sharedInstance().description;
    }
  }
  
  func didFinishGamesSignOutWithError(error: NSError!) {
    updateUI();
  }
  
  func didFinishGoogleAuthWithError(error: NSError!) {
    updateUI();
  }
  
  func updateUI() {
    var isSignedIn = GPGManager.sharedInstance().signedIn;
    signInButton.enabled = !isSignedIn;
    signOutButton.enabled = isSignedIn;
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

