//
//  ViewController.swift
//  TheScroll
//
//  Created by Spencer Forrest on 06/12/2016.
//  Copyright © 2016 Spencer Forrest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [UIImageView]()
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        let counter = 2
        
        let imageDimension: CGFloat = 100
        
        let scrollWidth = scrollview.frame.width
        scrollview.frame = CGRect(x: (view.frame.width / 2) - 100, y: (scrollview.frame.size.height/2) - imageDimension / 2, width: 200, height: imageDimension)
        
        print("ScrollView width: \(scrollview.frame.width)")
        
        for x in 0...counter {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            if x != counter {
                contentWidth += newX
            }else{
                contentWidth += scrollWidth
            }
            
            scrollview.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - imageDimension / 2, y: (scrollview.frame.size.height/2) - imageDimension / 2, width: imageDimension, height: imageDimension)
        }
        
        print("Count: \(images.count)")
        scrollview.clipsToBounds = false
        
        scrollview.contentSize = CGSize(width: contentWidth, height: imageDimension)
        
//        scrollview.backgroundColor = UIColor.purple
    }
}

