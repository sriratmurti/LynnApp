//
//  ViewController.swift
//  Lynn
//
//  Created by Sri Endah Ramurti on 18/07/21.
//

import UIKit

class homeScreen : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var air: UIImageView!
    
  //  @objc let button = UIButton.init(type: .roundedRect)

//
    override func viewDidLoad() {
        super .viewDidLoad()

//        button.setTitle(" Mulai ", for: .normal)
//        button.frame = CGRect(x: 446, y: 341, width: 50, height: 25)
//
//        button.addTarget(self, action: #selector(getter: button), for: .touchDown)
        imageView.image = UIImage(named: "home")
//        button.backgroundColor = UIColor(red: 181, green: 227, blue: 223, alpha: 100)
//        button.tintColor = UIColor(red: 0, green: 79, blue: 70, alpha: 100)

        
        air.loadGif(name: "Profil New")
        air.frame = CGRect (x: 89, y: 53, width: 224, height: 224)
        label.text = "Jaga tubuh dengan minum air putih"
        
    }
    
}

