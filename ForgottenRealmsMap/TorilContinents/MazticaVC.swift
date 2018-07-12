//
//  MazticaVC.swift
//  MultiVerseMaps
//
//  Created by Joey Marino on 7/11/18.
//  Copyright © 2018 Joey Marino. All rights reserved.
//

import Foundation
import UIKit

class MazticaVC: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {super.viewDidLoad()}
    
    @IBAction func scalePinchGesture(_ sender: UIPinchGestureRecognizer) {pinchHandler(gesture: sender)}
    
    @objc func pinchHandler(gesture: UIPinchGestureRecognizer) {
        
        if let view = gesture.view {
            
            switch gesture.state {
            case .changed:
                let pinchCenter = CGPoint(x: gesture.location(in: view).x - view.bounds.midX,
                                          y: gesture.location(in: view).y - view.bounds.midY)
                let transform = view.transform.translatedBy(x: pinchCenter.x, y: pinchCenter.y)
                    .scaledBy(x: gesture.scale, y: gesture.scale)
                    .translatedBy(x: -pinchCenter.x, y: -pinchCenter.y)
                view.transform = transform
                gesture.scale = 1
                
            default:
                return
            }
        }
    }
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
}
