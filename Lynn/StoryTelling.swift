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
    
    var airgif = [UIImage.gif(name: "Hero Lynn"),UIImage.gif(name: "Superman Not Me"),UIImage.gif(name: "Benefit"),UIImage.gif(name: "Secret"),UIImage.gif(name: "contain New"),UIImage.gif(name: "cry New"),UIImage.gif(name: "weak"),UIImage.gif(name: "Sweat"),UIImage.gif(name:"Presence"),UIImage.gif(name: "Child"),UIImage.gif(name: "more water")]
    
    var gambars = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"),UIImage(named: "10"),UIImage(named: "11")]
    
    var voice = ["stortel1", "stortel2", "stortel3", "stortel4", "stortel5", "stortel6", "stortel7", "stortel8", "stortel9", "stortel10", "stortel11"]
    
    var coba = UIImage.gif(name: "Organ")
    var coba2 = UIImage.gif(name: "Toksin")
    
//    var caption = ["ADAAAAAA","Apppaaaaaaa?","hahaaa","empaaat","limaaaa","enaaaam","tujuh","lapan","sembilaaan"]
    
    private let pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.numberOfPages = 11
        pageControl.backgroundColor = .clear
        return pageControl
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pagecontrolDidChange(_:)), for: .valueChanged)
     //   scrollView.backgroundColor = .clear
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        runTimer()
        
        //air.loadGif(name: "page")
        
//        playSound()
        
    }
    
    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
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
    
    private func runTimer(){
        //second 1 = stortel1 is played, its duration is 5 seconds
        self.playSound(number: 0)
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            runCount += 1
        
            switch runCount{
            case 7:
                //second 7 = stortel2 is played, its duration is 10 seconds
                self.playSound(number: 1)
                break;
            case 18:
                //second 18 = stortel3 is played, its duration is 14 seconds
                //Disini audio belum sesuai dengan teks di background
                self.playSound(number: 2)
                break;
            case 33:
                //second 33 = stortel4 is played, its duration is 5 seconds
                //Disini audio belum sesuai dengan teks di background
                self.playSound(number: 3)
                break;
            case 39:
                //second 39 = stortel5 is played, its duration is 4 seconds
                self.playSound(number: 4)
                break;
            case 44:
                //second 44 = stortel6 is played, its duration is 8 seconds
                self.playSound(number: 5)
                break;
            case 53:
                //second 53 = stortel7 is played, its duration is 3 seconds
                self.playSound(number: 6)
                break;
            case 57:
                //second 57 = stortel8 is played, its duration is 9 seconds
                self.playSound(number: 7)
                break;
            case 67:
                //second 67 = stortel9 is played, its duration is 5 seconds
                self.playSound(number: 8)
                break;
            case 73:
                //second 73 = stortel10 is played, its duration is 10 seconds
                self.playSound(number: 9)
                break;
            case 84:
                //second 84 = stortel11 is played, its duration is 9 seconds
                self.playSound(number: 10)
                timer.invalidate()
                break;
            default:
//                second 1 = stortel1 is played, its duration is 5 seconds
//                self.playSound(number: 0)
                print("Sekarang detik \(runCount)")
            }
        }
    }
    
    private func playSound(number: Int) {
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: voice[number], ofType: "mp3")!)
        do{
            guard let uri = bgSoundURI else {return}
            backgroundSound = try AVAudioPlayer(contentsOf: uri)
            backgroundSound.play()
        }catch{
            print(error)
        }
        
    }
    
    private func configureScrollView (){
        scrollView.contentSize = CGSize(width: view.frame.size.width*11, height: view.frame.size.height)
        scrollView.isPagingEnabled = true
        
        for x in 0 ..< 11 {
            
            let button = UIButton.init(type: .roundedRect)
                        button.setTitle("<Home", for: .normal)
                        button.frame = CGRect(x: CGFloat(x) * view.frame.size.width + 20, y: 25, width: 50, height: 25)
                        button.addTarget(self, action: #selector(dismissSelf), for: .touchDown)
            button.backgroundColor = .clear

            let page = UIImageView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: -0.5, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            var lynn = UIImageView()
            
            if x == 0 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width + 260, y: 13, width: 265, height: 265))

            }else if x == 1 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  197, y: 14, width: 484, height: 232))
            }else if x == 2 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width + 78, y: 59, width: 681, height: 175))
            }
            else if x == 3 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  264, y: 13, width: 278, height: 278))
            }
            else if x == 4 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  194, y: 78, width: 438, height: 210))
            }
            else if x == 5 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  137, y: 18, width: 548, height: 263))
            }
            else if x == 6 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  270, y: 116, width: 273, height: 164))
            }
            else if x == 7 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  187, y: 19, width: 483, height: 251))
            }
            else if x == 8 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  270, y: -2, width: 287, height: 287))
            }
            else if x == 9 {
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  250, y: 65, width: 345, height: 207))
            }
            else if x == 10{
                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  246, y: 11, width: 350, height: 262))
            }
            else {

            }
            
//            switch x {
//            case 0:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width + 260, y: 13, width: 265, height: 265))
//                playSound(number: 0)
//                break;
//            case 1:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  197, y: 14, width: 484, height: 232))
//                playSound(number: 1)
//                break;
//            case 2:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width + 78, y: 59, width: 681, height: 175))
//                playSound(number: 2)
//                break;
//            case 3:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  264, y: 13, width: 278, height: 278))
//                playSound(number: 3)
//                break;
//            case 4:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  194, y: 78, width: 438, height: 210))
//                playSound(number: 4)
//                break;
//            case 5:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  137, y: 18, width: 548, height: 263))
//                playSound(number: 5)
//                break;
//            case 6:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  270, y: 116, width: 273, height: 164))
//                playSound(number: 6)
//                break;
//            case 7:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  187, y: 19, width: 483, height: 251))
//                playSound(number: 7)
//                break;
//            case 8:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  270, y: -2, width: 287, height: 287))
//                playSound(number: 8)
//                break;
//            case 9:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  250, y: 65, width: 345, height: 207))
//                playSound(number: 9)
//                break;
//            case 10:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width +  246, y: 11, width: 350, height: 262))
//                playSound(number: 10)
//                break;
//            default:
//                lynn = UIImageView(frame: CGRect(x: CGFloat(x)*view.frame.size.width + 260, y: 13, width: 265, height: 265))
//                playSound(number: 0)
//                break;
//            }
            
            
     
            page.image = gambars[x]
            lynn.image = airgif[x]
           
            scrollView.addSubview(page)
            scrollView.addSubview(lynn)
            scrollView.addSubview(button)

            
 //           scrollView.addSubview(deskripsi)
//         scrollView.layer.addSublayer(playSound(number: x))
            
//            self.[your scrollview].layer.addSublayer(the name of the video layer !)

        }
        
    }
    
}
        

extension ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        pageControl.currentPage = Int(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width))
    }
}


