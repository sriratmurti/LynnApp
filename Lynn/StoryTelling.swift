//
//  StoryTelling.swift
//  Lynn
//
//  Created by Sri Endah Ramurti on 17/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var air: UIImageView!
    
    @IBOutlet weak var capt: UILabel!
    
    
    
    private let scrollView = UIScrollView()
    
    var airgif = [UIImage.gif(name: "page"),UIImage.gif(name: "page"),UIImage.gif(name: "Toksin"),UIImage.gif(name: "page"),UIImage.gif(name: "page"),UIImage.gif(name: "weak"),UIImage.gif(name: "lembab"),UIImage.gif(name: "cry"),UIImage.gif(name: "Drink more")]
    var gambars = [UIImage(named: "stortel1"),UIImage(named: "stortel2"),UIImage(named: "stortel3"),UIImage(named: "stortel4"),UIImage(named: "stortel5"),UIImage(named: "stortel6"),UIImage(named: "stortel7"),UIImage(named: "stortel8"),UIImage(named: "stortel9")]
    
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
    
    private func configureScrollView (){
        scrollView.contentSize = CGSize(width: view.frame.size.width*9, height: view.frame.size.height)
        scrollView.isPagingEnabled = true
        
       
        for x in 0 ..< 9 {
            
            let page = UIImageView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: -0.5, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            let lynn = UIImageView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: -0.5, width: view.frame.size.width-200, height: view.frame.size.height-100))
            
            
           
            
            //deskripsi.text = desc[x]
            page.image = gambars[x]
            lynn.image = airgif[x]
            scrollView.addSubview(page)
            scrollView.addSubview(lynn)
        }
    }
    

}

extension ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        pageControl.currentPage = Int(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width))
    }
}
