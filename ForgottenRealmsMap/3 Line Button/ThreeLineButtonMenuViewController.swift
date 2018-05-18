//
//  ThreeLineButtonMenuViewController.swift
//  ForgottenRealmsMap
//
//  Created by Joey Marino on 4/25/18.
//  Copyright © 2018 Joey Marino. All rights reserved.
//

import UIKit

class ThreeLineButtonMenuViewController: UIViewController, UIDocumentInteractionControllerDelegate {
 
    let rulesPath = Bundle.main.path(forResource: "DnD Cheat Sheet", ofType: "pdf")
    
    //MARK: UIDocumentInteractionController delegates
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
    @IBOutlet weak var howToUseThisMapButton: UIButton!
    @IBOutlet weak var callToArmsButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    @IBOutlet weak var quickReferenceRulesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonArray = [howToUseThisMapButton, callToArmsButton, contactUsButton, quickReferenceRulesButton]
        
        
        for button in buttonArray {
            button?.layer.cornerRadius = 5
            button?.layer.borderWidth = 1
            button?.layer.shadowColor = UIColor.lightGray.cgColor
            button?.layer.shadowOffset = CGSize(width: 0, height: 8)
            button?.layer.shadowOpacity = 0.9
            button?.layer.borderColor = UIColor.black.cgColor
        }

    }

    @IBAction func quickreferenceRulesPDF(_ sender: Any) {
        let documentInteractionController = UIDocumentInteractionController(url: URL(fileURLWithPath: rulesPath!))
        documentInteractionController.delegate = self
        documentInteractionController.presentPreview(animated: true)
    }
    

}
