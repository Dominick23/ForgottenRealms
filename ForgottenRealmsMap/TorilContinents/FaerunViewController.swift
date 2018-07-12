//
//  ViewController.swift
//  ForgottenRealmsMap
//
//  Created by L&L Programming on 2/21/18.
//  Copyright © 2018 L&L Programming. All rights reserved.
//

import UIKit

class FaerunViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var xyCoordinateLabel: UILabel!
    
    
    //make sure you have the correct size of original image.
    let originalImageSize: CGSize = CGSize(width: 1000, height: 500)
    //Lets create a struct to have the basic information we need
    struct Item {
        var id: Int
        var name: String
        var imageName: String
        var message: String
        var wikiLink: String
        var segue: String
        var x: Double
        var y: Double
        var width: Double
        var height: Double
        var rotation: CGFloat
        
    }
    //Creating some sample button on the map 
    //x and y are based on the original Image size
    let buttonsInfo : [Item] = [
        Item(id: 1, name: "Sea of Moving Ice", imageName: "", message: "", wikiLink: "https://forgottenrealms.wikia.com/wiki/Sea_of_Moving_Ice", segue: "", x: 75, y: 6, width: 12, height: 14, rotation: 2*CGFloat.pi),
        Item(id: 2, name: "The Icepeak", imageName: "", message: "", wikiLink: "https://forgottenrealms.wikia.com/wiki/", segue: "", x: 76, y: 32, width: 10, height: 7, rotation: 2*CGFloat.pi),
        Item(id: 3, name: "Reghed Glacier", imageName: "", message: "", wikiLink: "https://forgottenrealms.wikia.com/wiki/", segue: "", x: 109, y: 2, width: 28, height: 4, rotation: 2*CGFloat.pi),
        Item(id: 4, name: "Mirabar", imageName: "andrew-woodyard-mirabar-web", message: "", wikiLink: "https://forgottenrealms.wikia.com/wiki/Mirabar", segue: "mirabar", x: 130, y: 17, width: 7, height: 2, rotation: 2*CGFloat.pi),
        Item(id: 5, name: "Icewind Dale", imageName: "", message: "", wikiLink: "https://forgottenrealms.wikia.com/wiki/", segue: "", x: 85, y: 11, width: 28, height: 7.5, rotation: 1.8*CGFloat.pi)
    ]
    
    let yourUIImageView = UIImageView(image: UIImage())
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if showHideXYCoordinates == false {xyCoordinateLabel.isHidden = true
        } else {xyCoordinateLabel.isHidden = false}
        
        //let torilDetailView = TorilDetailView(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX/3, height: self.view.frame.maxY))
        //self.view.addSubview(torilDetailView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //after the image is rendered on UI get the real dimensions
        //Size of the Image that is rendered on UI in proper aspect ratio
        //let renderedImageSize: CGSize = CGSize(width: 500, height: 250)
        
        for item in buttonsInfo {
            let buttons = UIButton()
            buttons.tag = item.id
            /*buttons.frame = CGRect(x: Double(renderedImageSize.width/originalImageSize.width)*item.x,
                                  y: Double(renderedImageSize.height/originalImageSize.height)*item.y,
                                  width: item.width, height: item.height)*/
            buttons.frame = CGRect(x: item.x, y: item.y, width: item.width, height: item.height)
            //buttons.borderColor = UIColor.black
            //buttons.borderWidth = 1.0
            buttons.titleLabel?.font = UIFont(name: "Helvetica", size: 8)
            buttons.backgroundColor = UIColor.clear
            //buttons.setTitle(item.name, for: .normal)
            buttons.setTitle("", for: .normal)
            buttons.transform = CGAffineTransform(rotationAngle: item.rotation)
            buttons.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            image.addSubview(buttons)
        }
        
    }
    
    

    override func touchesBegan(_ touches: Set<UITouch>, with withEvent: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: image)
            print(position)
            let xPosition = round(position.x)
            let yPosition = round(position.y)
            xyCoordinateLabel.text = "\(xPosition), \(yPosition)"
        }
    }
    
    
    
    @objc func buttonAction(sender: UIButton!) {
        let item: [Item] = buttonsInfo.filter{$0.id == sender.tag}
        print(item)
        buttonTag = sender.tag
        
        let detailsOfFaerunView = DetailsOfFaerun(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX/3, height: self.view.frame.maxY))
        
        self.view.addSubview(detailsOfFaerunView)
    }
    
    func zoomable() -> Bool {
        let item: [Item] = buttonsInfo.filter{$0.id == buttonTag}
        let button = item[0]
        if button.segue == "" {return false} else {return true}
    }
    
    @objc func zoom() {
        let item: [Item] = buttonsInfo.filter{$0.id == buttonTag}
        print(item)
        let button = item[0]
        
        self.performSegue(withIdentifier: button.segue, sender: nil)
    }
    
    func name() -> String {
        let item: [Item] = buttonsInfo.filter{$0.id == buttonTag}
        let button = item[0]
        return button.name
    }
    
    func imageName() -> String {
        let item: [Item] = buttonsInfo.filter{$0.id == buttonTag}
        let button = item[0]
        return button.imageName
    }
    
    func message() -> String {
        let item: [Item] = buttonsInfo.filter{$0.id == buttonTag}
        let button = item[0]
        return button.message
    }
    
    @objc func visitWiki() {
        
        let item: [Item] = buttonsInfo.filter{$0.id == buttonTag}
        print(item)
        let button = item[0]
        
        let webV:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        webV.loadRequest(URLRequest(url: URL(string: button.wikiLink)!))
        webV.delegate = self as? UIWebViewDelegate;
        self.view.addSubview(webV)
        
        let closeButton = UIButton(type: .system)
        closeButton.frame = CGRect(x: 0, y: 50, width: 100, height: 100)
        closeButton.backgroundColor = UIColor.red
        closeButton.setTitle("CANCEL", for: [])
        closeButton.addTarget(webV, action: #selector(webV.removeFromSuperview), for: UIControlEvents.touchUpInside)
        self.view.addSubview(closeButton)
    }
    
    @IBAction func scalePinchGesture(_ sender: UIPinchGestureRecognizer) {
        
        pinchHandler(gesture: sender)
        //instructionsImage.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
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
                /*case .ended:
                 // Nice animation to scale down when releasing the pinch.
                 // OPTIONAL
                 UIView.animate(withDuration: 0.2, animations: {
                 view.transform = CGAffineTransform.identity
                 })*/
            default:
                return
            }
            
            
        }
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        //print("Pan")
        
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
}

