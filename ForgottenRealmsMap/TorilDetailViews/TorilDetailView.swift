//
//  DetailView.swift
//  ForgottenRealmsMap
//
//  Created by Joey Marino on 4/10/18.
//  Copyright © 2018 L&L Programming. All rights reserved.
//

import UIKit

    class TorilDetailView: UIView {

        override init(frame: CGRect) {
            super.init(frame: frame)
            self.addDetailView()
        }
        
        required init(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
        
        func addDetailView() {
            
            let scrollView: UIScrollView = UIScrollView()
            scrollView.frame = CGRect(x: 0, y: 50, width: frame.maxX, height: frame.maxY)
            scrollView.contentSize = CGSize(width: frame.maxX, height: 4000)
            scrollView.backgroundColor = UIColor.white
            self.addSubview(scrollView)
            
            let titleLabel: UILabel = UILabel()
            titleLabel.frame = CGRect(x: 5, y: 0, width: frame.maxX, height: 23)
            titleLabel.backgroundColor=UIColor.white
            titleLabel.textAlignment = NSTextAlignment.center
            titleLabel.text = "Toril, 3rd planet from the sun"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            scrollView.addSubview(titleLabel)
            
            let image = UIImage(named: "Toril_World_Map")
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 5, y: 30, width: frame.maxX, height: 100)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            
            
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
                /*let zoomButton: UIButton = UIButton()
                zoomButton.frame=CGRect(x: 175, y: 135, width: 65, height: 23)
                zoomButton.backgroundColor=UIColor.gray
                zoomButton.setTitle("Zoom", for: .normal)
                zoomButton.addTarget(TorilViewController(), action: #selector(TorilViewController.zoom), for: .touchUpInside)
                zoomButton.layer.cornerRadius = 5
                zoomButton.layer.borderWidth = 1
                zoomButton.layer.borderColor = UIColor.black.cgColor
                scrollView.addSubview(zoomButton)*/
            
            
            let descriptionLabel: UILabel = UILabel()
            descriptionLabel.frame = CGRect(x: 5, y: 158, width: frame.maxX-7, height: 200)
            descriptionLabel.backgroundColor=UIColor.white
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = true
            descriptionLabel.numberOfLines = 0
            descriptionLabel.text = "\nFaerûn: The westernmost portion of Toril's central supercontinent, a diverse landscape inhabited by numerous races and cultures, including humans, dwarves, elves, halflings, and gnomes.[3]\n\nZakhara: A mostly hot, arid realm dominated by elemental forces and a philosophy of Fate and Honor.[7]\n\nKara-Tur: The exotic east, steeped in ancient history like a fine tea.[7]\n\nMaztica: Primitive cultures bound by duty to their gods gave blood sacrifices in return for power while those who disagreed with the practice struggled to survive.[7]\n\nAnchorome: Hardly explored, seemingly populated with violent elves and more of the humans found in Maztica.[6]\n\nKatashaka: South of Maztica. Unexplored.[8]\n\nLaerakond: A continent formerly located in the world of Abeir, a land of dragon empires and new cultures.[10]\n\nOsse: Populated by spiritualists and druids, the spirit world and nature dominated the lives of its inhabitants. Unexplored.[9]"
            descriptionLabel.sizeToFit()
            
            //descriptionLabel.text = "Toril (pronounced Tor-RILL) was the third planet from the Sun in Realmspace. It was orbited by one moon named Selûne, and by a cluster of asteroids, known as the Tears of Selûne.\n\nThroughout most of its history, Toril was known less commonly as Abeir-Toril.[3] The name Abeir-Toril was archaic, meaning cradle of life in an extinct and forgotten language. Since the Spellplague and the revelation of the existence of a planetary sibling known as Abeir, and the fact that both Abeir and Toril were once united, the latter name came to informally mean the formerly united worlds of Abeir and Toril.\n\nGeography\n\nToril was an Earth-sized planet that consisted of various continents and islands, including Faerûn, Kara-Tur, and Zakhara in the central super-continent[3] and, throughout most of its history Anchorome,[6] Maztica,[7] and Katashaka in the western region of the world.[8] There was also one large and very mysterious continent east of Kara-Tur called Osse whose nature and inhabitants were all but unknown.\n\nFollowing the Spellplague, however, Maztica was sent to Abeir, the sibling world of Toril, and a new continent, Laerakond, appeared in the west.[10] Maztica returned to Toril during the Second Sundering.\n\nContinents\n\nFaerûn: The westernmost portion of Toril's central supercontinent, a diverse landscape inhabited by numerous races and cultures, including humans, dwarves, elves, halflings, and gnomes.\n\nZakhara: A mostly hot, arid realm dominated by elemental forces and a philosophy of Fate and Honor.\n\nKara-Tur: The exotic east, steeped in ancient history like a fine tea.\n\nMaztica: Primitive cultures bound by duty to their gods gave blood sacrifices in return for power while those who disagreed with the practice struggled to survive.\n\nAnchorome: Hardly explored, seemingly populated with violent elves and more of the humans found in Maztica.\n\nKatashaka: South of Maztica. Unexplored.\n\nLaerakond: A continent formerly located in the world of Abeir, a land of dragon empires and new cultures.\n\nOsse: Populated by spiritualists and druids, the spirit world and nature dominated the lives of its inhabitants. Unexplored.\n\nHistory\n\nThe known history of Toril spans for thousands of years, extending back into the misty epochs after Ao sundered the world of Abeir-Toril after the Tearfall, splitting it into the two twin planets, Abeir and Toril.\n\nThe Dawn Ages\n\nMain article: Dawn Age\n\nThe Dawn Age was a period lasting from −30,000 DR to −24,000 DR, after the powerful empires of the Creator races disappeared from the face of the earth and their land was occupied by dragons and giants. Constant war for land in Faerûn led to the creation of great kingdoms and empires.\n\nThe First Flowering\n\nThe First Flowering was a period in Faerûn's history between −24,000 DR and −12,000 DR[13]. At the start of this period, the elves had split into five major realms: Aryvandaar, Illefarn, Keltormir, Miyeritar and Shantel Othreier, as well as several smaller ones such as Eiellûr, Ilythiir, Orishaar, Syòrpiir and Thearnytaar.\n\nIt was during this time when the elves cast a ritual known as the Sundering to create the Isle of Evermeet, that also resulted in widespread disaster which destroyed or altered much of the world.\n\nThe Founding Time\n\nThe Founding Time was the period when the humanoid civilizations began to rise, in a time when the many dragons and giants were long overthrown and the elf wars no longer loomed over everyone as a threat.\n\nThe Age of Humanity\n\nThe Age of Humanity was the period from about -3000 to 1358 DR. This period began with the decline of the elven and dwarven empires and the flourishing and expansion of the human empires around the world.\n\nThe Present Age\n\nThe Present Age was the time period that started in the year 1000 DR and continues to the present. It was considered one of the most tumultuous ages in the history of Toril. It was a time of constant struggle but also a time of discovery and exploration.\n\nIt included such calamitous events like the Time of Troubles of 1358 DR, the Spellplague of 1385 DR, and the Second Sundering of the decade of the 1480s DR."
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


