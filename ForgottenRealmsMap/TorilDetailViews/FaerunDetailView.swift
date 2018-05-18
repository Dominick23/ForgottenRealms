//
//  DetailView.swift
//  ForgottenRealmsMap
//
//  Created by Joey Marino on 4/10/18.
//  Copyright © 2018 L&L Programming. All rights reserved.
//

import UIKit

class FaerunDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addDetailView()
    }
    
    required init(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    func addDetailView() {
        
        let scrollView: UIScrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 50, width: frame.maxX, height: frame.maxY)
        scrollView.contentSize = CGSize(width: frame.maxX, height: 0)
        scrollView.backgroundColor = UIColor.white
        self.addSubview(scrollView)
        
        let titleLabel: UILabel = UILabel()
        titleLabel.frame = CGRect(x: 5, y: 0, width: frame.maxX, height: 23)
        titleLabel.backgroundColor=UIColor.white
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = TorilViewController().name()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        scrollView.addSubview(titleLabel)
        
        let imageName = TorilViewController().imageName()
        let image = UIImage(named: "\(imageName)")
        if imageName != "" {
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 5, y: 30, width: frame.maxX, height: 100)
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
        }
        
        let closeButton: UIButton = UIButton()
        closeButton.frame=CGRect(x: 5, y: 135, width: 75, height: 23)
        closeButton.backgroundColor=UIColor.gray
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeDetailView), for: .touchUpInside)
        closeButton.layer.cornerRadius = 5
        closeButton.layer.borderWidth = 1
        closeButton.layer.borderColor = UIColor.black.cgColor
        scrollView.addSubview(closeButton)
        
        let visitWikiButton: UIButton = UIButton()
        visitWikiButton.frame=CGRect(x: 85, y: 135, width: 80, height: 23)
        visitWikiButton.backgroundColor=UIColor.gray
        visitWikiButton.setTitle("Visit Wiki", for: .normal)
        visitWikiButton.addTarget(TorilViewController(), action: #selector(TorilViewController.visitWiki), for: .touchUpInside)
        visitWikiButton.layer.cornerRadius = 5
        visitWikiButton.layer.borderWidth = 1
        visitWikiButton.layer.borderColor = UIColor.black.cgColor
        scrollView.addSubview(visitWikiButton)
        
        // add if button,segue exists code to detail view initialization
        // if button.segue != "" {
        let zoomButton: UIButton = UIButton()
        zoomButton.frame=CGRect(x: 175, y: 135, width: 65, height: 23)
        zoomButton.backgroundColor=UIColor.gray
        zoomButton.setTitle("Zoom", for: .normal)
        zoomButton.addTarget(TorilViewController(), action: #selector(TorilViewController.zoom), for: .touchUpInside)
        zoomButton.addTarget(self, action: #selector(closeDetailView), for: .touchUpInside)
        zoomButton.layer.cornerRadius = 5
        zoomButton.layer.borderWidth = 1
        zoomButton.layer.borderColor = UIColor.black.cgColor
        scrollView.addSubview(zoomButton)
        
        
        let descriptionLabel: UILabel = UILabel()
        descriptionLabel.frame = CGRect(x: 5, y: 158, width: frame.maxX-7, height: 100)
        descriptionLabel.backgroundColor=UIColor.white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = TorilViewController().message()
        descriptionLabel.sizeToFit()
        scrollView.addSubview(descriptionLabel)
        
        scrollView.contentSize = CGSize(width: frame.maxX, height: descriptionLabel.bounds.size.height + 215)
        
        /*let txtField : UITextField = UITextField()
         txtField.frame = CGRect(x: 50, y: 250, width: 100, height: 50)
         txtField.backgroundColor = UIColor.gray
         scrollView.addSubview(txtField)
         
         let image2 = UIImage(named: "Kara tur")
         let imageView2 = UIImageView(image: image2!)
         imageView2.frame = CGRect(x: 5, y: 430, width: frame.maxX, height: 100)
         imageView2.contentMode = .scaleAspectFit
         scrollView.addSubview(imageView2)*/
    }
    
    @objc func closeDetailView() {self.removeFromSuperview()}
    
    
}



