//
//  StoryTelling.swift
//  Lynn
//
//  Created by Sri Endah Ramurti on 17/07/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var air: UIImageView!
    
    @IBOutlet weak var capt: UILabel!
    
    var bgSoundURI: URL?
    var backgroundSound = AVAudioPlayer()
    
    private let scrollView = UIScrollView()
    
    var airgif = [UIImage.gif(name: "page"),UIImage.gif(name: "page"),UIImage.gif(name: "Toksin"),UIImage.gif(name: "page"),UIImage.gif(name: "page"),UIImage.gif(name: "weak"),UIImage.gif(name: "lembab"),UIImage.gif(name: "cry"),UIImage.gif(name: "Drink more")]
    var gambars = [UIImage(named: "stortel1"),UIImage(named: "stortel2"),UIImage(named: "stortel3"),UIImage(named: "stortel4"),UIImage(named: "stortel5"),UIImage(named: "stortel6"),UIImage(named: "stortel7"),UIImage(named: "stortel8"),UIImage(named: "stortel9")]
    
    var voice = ["home page", "stortel1", "stortel2", "stortel3", "stortel4", "stortel5", "stortel6", "stortel7", "stortel8", "stortel9", "stortel10", "stortel11"]
    
    private let pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.numberOfPages = 9
        pageControl.backgroundColor = .clear
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pagecontrolDidChange(_:)), for: .valueChanged)
        scrollView.backgroundColor = .clear
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        //air.loadGif(name: "page")
        
//        playSound()
       
    }
    
    @objc private func pagecontrolDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 0, y: view.frame.size.height-70, width: view.frame.size.width-20, height:70)
        
        scrollView.frame = CGRect(x: 0.5, y: -0.5, width: view.frame.size.width, height: view.frame.size.height)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
//    private func playSound() {
//        let sound = Bundle.main.path(forResource: "sound1", ofType: "mp3")
//
//        do{
//            backgroundSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//        }catch{
//            print(error)
//        }
//
//        backgroundSound.play()
//    }
    
    private func playSound(number: Int) {
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: voice[number], ofType: "mp3")!)
        do{
            guard let uri = bgSoundURI else {return}
            backgroundSound = try AVAudioPlayer(contentsOf: uri)
            backgroundSound.numberOfLoops = -1
            backgroundSound.play()
        }catch{
            print(error)
        }
    }
    
    private func configureScrollView (){
        scrollView.contentSize = CGSize(width: view.frame.size.width*9, height: view.frame.size.height)
        scrollView.isPagingEnabled = true
        
        for x in 0 ..< 9 {
            playSound(number: x)
            let page = UIImageView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: -0.5, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            let lynn = UIImageView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: -0.5, width: view.frame.size.width-200, height: view.frame.size.height-100))
            
            
           
            
            //deskripsi.text = desc[x]
            page.image = gambars[x]
            lynn.image = airgif[x]
            scrollView.addSubview(page)
            scrollView.addSubview(lynn)
//            scrollView.layer.addSublayer(playSound(number: x))
            
//            self.[your scrollview].layer.addSublayer(the name of the video layer !)
            
           
            
//            var sound = Bundle.main.path(forResource: "stortel1", ofType: "mp3")
//
//                    do{
//                        backgroundSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//                    }catch{
//                        print(error)
//                    }
//
//                    backgroundSound.play()
            

            
//            bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: voice[x], ofType: "mp3")!)
//            do{
//                guard let uri = bgSoundURI else {return}
//                backgroundSound = try AVAudioPlayer(contentsOf: uri)
//                backgroundSound.numberOfLoops = -1
//                backgroundSound.play()
//            }catch{
//                print(error)
//            }
            
            
        }
        
    }
    
}
        

extension ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        pageControl.currentPage = Int(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width))
    }
}


