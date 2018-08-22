//
//  HowToVC.swift
//  MultiVerseMaps
//
//  Created by Joey Marino on 8/21/18.
//  Copyright © 2018 Joey Marino. All rights reserved.
//

import UIKit

class HowToVC: UIViewController {

    @IBOutlet weak var watchVideoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonArray = [watchVideoButton]
        
        
        for button in buttonArray {
            button?.layer.cornerRadius = 5
            button?.layer.borderWidth = 1
            button?.layer.shadowColor = UIColor.lightGray.cgColor
            button?.layer.shadowOffset = CGSize(width: 0, height: 8)
            button?.layer.shadowOpacity = 0.9
            button?.layer.borderColor = UIColor.black.cgColor
        }
    }

    @IBAction func watchVideo(_ sender: Any) {
        let webV:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        webV.loadRequest(URLRequest(url: URL(string: "https://m.youtube.com/watch?v=FtXedGdP-Bo&feature=youtu.be")!))
        webV.delegate = self as? UIWebViewDelegate;
        self.view.addSubview(webV)
    }
    

}
