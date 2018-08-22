//
//  CallToArmsViewController.swift
//  ForgottenRealmsMap
//
//  Created by Joey Marino on 4/25/18.
//  Copyright © 2018 Joey Marino. All rights reserved.
//

import UIKit
import MessageUI

class CallToArmsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var linkToCodingButton: UIButton!
    @IBOutlet weak var artEmailButton: UIButton!
    @IBOutlet weak var showHideXYCoordinatesButton: UIButton!
    @IBOutlet weak var showHideHexesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonArray = [linkToCodingButton, showHideXYCoordinatesButton, artEmailButton, showHideHexesButton]
        
        
        for button in buttonArray {
            button?.layer.cornerRadius = 5
            button?.layer.borderWidth = 1
            button?.layer.shadowColor = UIColor.lightGray.cgColor
            button?.layer.shadowOffset = CGSize(width: 0, height: 8)
            button?.layer.shadowOpacity = 0.9
            button?.layer.borderColor = UIColor.black.cgColor
        }
    }

    @IBAction func showHideXYCoordinatesLabel(_ sender: UIButton) {

        if showHideXYCoordinates == true {
            showHideXYCoordinates = false
            showHideXYCoordinatesButton.setTitle("Show XY Coordinates", for: .normal)
        } else {
            showHideXYCoordinates = true
            showHideXYCoordinatesButton.setTitle("Hide XY Coordinates", for: .normal)
        }

    }
    
    @IBAction func showHideHexes(_ sender: Any) {
     
        if showHexes == true {
            showHexes = false
            showHideHexesButton.setTitle("Show Hexes", for: .normal)
        } else {
            showHexes = true
            showHideHexesButton.setTitle("Hide Hexes", for: .normal)
        }
        
    }
    
    @IBAction func linkToCodingWebsite(_ sender: Any) {
        let webV:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        webV.loadRequest(URLRequest(url: URL(string: "https://github.com/Dominick23/ForgottenRealms")!))
        webV.delegate = self as? UIWebViewDelegate;
        self.view.addSubview(webV)
    }
    
    @IBAction func appImprovementEmail(_ sender: Any) {
        
        print("Tried")
        if MFMailComposeViewController.canSendMail() {
            let emailController = MFMailComposeViewController()
            emailController.mailComposeDelegate = self
            emailController.setToRecipients(["MultiVerseMapsSuggestions@gmail.com"])
            emailController.setSubject("I would like to offer assistance to help improve MultiverseMaps")
            emailController.setMessageBody("Please describe your idea here", isHTML: false)
            present(emailController, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}
