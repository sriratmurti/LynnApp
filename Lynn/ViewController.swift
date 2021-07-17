//
//  ViewController.swift
//  Lynn
//
//  Created by Sri Endah Ramurti on 17/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    private let scrollView = UIScrollView()
    
    var gambars = [UIImage(named: "satu"),UIImage(named: "tiga"),UIImage(named: "empat"),UIImage(named: "lima"),UIImage(named: "enam"),UIImage(named: "tujuh"),UIImage(named: "satu"),UIImage(named: "tiga")]
    
    private let pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.numberOfPages = 8
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
    }
    
    @objc private func pagecontrolDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 20, y: view.frame.size.height-70, width: view.frame.size.width-20, height:80)
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    private func configureScrollView (){
        scrollView.contentSize = CGSize(width: view.frame.size.width*5, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        
       
        for x in 0 ..< 8 {
            let page = UIImageView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
          
            
            page.image = gambars[x]
            scrollView.addSubview(page)
        }
    }
    

}

extension ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        pageControl.currentPage = Int(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width))
    }
}
