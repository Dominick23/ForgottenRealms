//
//  CallToArmsViewController.swift
//  ForgottenRealmsMap
//
//  Created by Joey Marino on 4/25/18.
//  Copyright © 2018 Joey Marino. All rights reserved.
//

import UIKit

class CallToArmsViewController: UIViewController {

    @IBOutlet weak var linkToCodingButton: UIButton!
    @IBOutlet weak var artEmailButton: UIButton!
    @IBOutlet weak var showHideXYCoordinatesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonArray = [linkToCodingButton, showHideXYCoordinatesButton, artEmailButton]
        
        
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
    

}
