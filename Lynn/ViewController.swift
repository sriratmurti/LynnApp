//
//  ViewController.swift
//  Lynn
//
//  Created by Sri Endah Ramurti on 18/07/21.
//

import UIKit

class homeScreen : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var air: UIImageView!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        imageView.image = UIImage(named: "home")

        air.loadGif(name: "Profil New")
    }
    
}

