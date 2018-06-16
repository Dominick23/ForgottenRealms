//
//  TorilViewController.swift
//  ForgottenRealmsMap
//
//  Created by Joey Marino on 4/9/18.
//  Copyright © 2018 Joey Marino. All rights reserved.
//

import UIKit

//need to add code to change this so I can use it instead of sender.tag, especially once more buttons are added...
var buttonTag = 1
var showHideXYCoordinates = true
var showHexes = false
//var detailViewTitle = ""

class TorilViewController: UIViewController {

    @IBOutlet weak var torilMapImageView: UIImageView!
    @IBOutlet weak var xyCoordinateLabel: UILabel!
    @IBOutlet weak var hexImage: UIImageView!
    
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
        
        Item(id: 1, name: "Faerun", imageName: "faerunlarge", message: "\nFaerûn: The westernmost portion of Toril's central supercontinent, a diverse landscape inhabited by numerous races and cultures, including humans, dwarves, elves, halflings, and gnomes.[3]", wikiLink: "https://forgottenrealms.wikia.com/wiki/Faerun", segue: "faerun", x: 223, y: 60, width: 110, height: 110, rotation: 2*CGFloat.pi),
        
        Item(id: 2, name: "Kara Tur", imageName: "Kara tur", message: "\nKara Tur: The exotic east, steeped in ancient history like a fine tea. A land of Kenshi and Samurai with a twinge of eastern culture and good rice", wikiLink: "http://forgottenrealms.wikia.com/wiki/Kara-Tur", segue: "karaTur", x: 335, y: 67, width: 125, height: 105, rotation: 2*CGFloat.pi),
        
        Item(id: 3, name: "Zakhara", imageName: "", message: "A mostly hot, arid realm dominated by elemental forces and a philosophy of http://forgottenrealms.wikia.com/wiki/Fate and Honor. And Genies, did we mention Genies!!!", wikiLink: "http://forgottenrealms.wikia.com/wiki/Zakhara", segue: "Zakhara", x: 263, y: 206, width: 105, height: 71, rotation: 2*CGFloat.pi),
        
        Item(id: 4, name: "Osse", imageName: "", message: "Populated by spiritualists and druids <http://forgottenrealms.wikia.com/wiki/Druid>, the spirit world and nature dominated the lives of its inhabitants. Unexplored.Hop on down to Osse ;)", wikiLink: "http://forgottenrealms.wikia.com/wiki/Osse", segue: "Osse", x: 523, y: 169, width: 140, height: 105, rotation: 2*CGFloat.pi),
        
        Item(id: 5, name: "Maztica", imageName: "Maztica", message: "Primitive cultures bound by duty to their gods gave blood sacrifices in return for power while those who disagreed with the practice struggled to survive. Cool Cat people love it here", wikiLink: "http://forgottenrealms.wikia.com/wiki/Maztica", segue: "Maztica", x: 100, y: 130, width: 72, height: 73, rotation: 2*CGFloat.pi),
        
        Item(id: 6, name: "Anchorome", imageName: "", message: "Hardly explored, seemingly populated with savage wild elves attacking anyone on sight, violent elves and more of the humans found in Maztica.", wikiLink: "http://forgottenrealms.wikia.com/wiki/Anchorome", segue: "Anteroom", x: 70, y: 74, width: 100, height: 63, rotation: 2*CGFloat.pi),
        
        Item(id: 7, name: "Katashaka", imageName: "", message: "South of Maztica. Unexplored, beings named Nyama-Nummo were worshiped by the Tabaxi tribes before they converted to the worship of http://forgottenrealms.wikia.com/wiki/Ubtao and their subsequent migration to the Jungles of Chult <http://forgottenrealms.wikia.com/wiki/Chult>.", wikiLink: "http://forgottenrealms.wikia.com/wiki/Katashaka", segue: "Katashaka", x: 100, y: 212, width: 85, height: 88, rotation: 2*CGFloat.pi),
    ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        torilMapImageView.addSubview(hexImage)
        
        if showHideXYCoordinates == false {xyCoordinateLabel.isHidden = true
        } else {xyCoordinateLabel.isHidden = false}
        
        if showHexes == true {hexImage.isHidden = false} else {hexImage.isHidden = true}
        
        let torilDetailView = TorilDetailView(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX/3, height: self.view.frame.maxY))
        self.view.addSubview(torilDetailView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        torilMapImageView.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action:#selector(scalePinchGesture(_:)))
        torilMapImageView.addGestureRecognizer(pinchGesture)
        
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
            
    buttons.borderColor = UIColor.black
    buttons.borderWidth = 1.0
            buttons.titleLabel?.font = UIFont(name: "Helvetica", size: 8)
            buttons.backgroundColor = UIColor.clear
            //buttons.setTitle(item.name, for: .normal)
            buttons.setTitle("", for: .normal)
            buttons.transform = CGAffineTransform(rotationAngle: item.rotation)
            buttons.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            torilMapImageView.addSubview(buttons)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with withEvent: UIEvent?) {
        
        if let touch = touches.first {
            let position = touch.location(in: torilMapImageView)
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
        
        let faerunDetailView = FaerunDetailView(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX/3, height: self.view.frame.maxY))
        //let karaTurDetailView = KaraTurDetailView(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX/3, height: self.view.frame.maxY))
        
       self.view.addSubview(faerunDetailView)
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
    
    /*func detailViewData() -> (String, String, Int) {
        let item: [Item] = buttonsInfo.filter{$0.id == buttonTag}
        let button = item[0]
        return (button.name, button.imageName, button.id)
        //detailViewTitle = button.name
    }*/
    
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
        closeButton.setTitle("BACK", for: .normal)
        closeButton.setBackgroundImage(UIImage(named:"swords"), for: .normal)
        closeButton.imageView?.contentMode = .scaleAspectFit
        //closeButton.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: -50,right: 0)
        closeButton.titleEdgeInsets = UIEdgeInsets(top: 90,left: 0,bottom: 0,right: 0)
        //closeButton.translatesAutoresizingMaskIntoConstraints = false
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

