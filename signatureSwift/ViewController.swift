//
//  ViewController.swift
//  signatureSwift
//
//  Created by 温国力 on 16/9/19.
//  Copyright © 2016年 wenguoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var signatureImage: UIImageView?
    
    //回调回来的图片
    var showImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let signatureImage = UIImageView.init(frame: CGRect.init(x: 20, y: 200, width: UIScreen.main.bounds.size.width - 40, height: 250))
        signatureImage.backgroundColor = UIColor.lightGray
        self.view.addSubview(signatureImage)
        self.signatureImage = signatureImage
        
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.frame = CGRect.init(x: 50, y: 470, width: 275, height: 50)
        btn.backgroundColor = UIColor.orange
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.setTitle("Click into signature", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.init(name: "Zapfino", size: 16)
        btn.addTarget(self, action: #selector(clickBtn), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.signatureImage?.image = self.showImage
    }
    
    
    func clickBtn(){
        
        let signatureVC = signatureController()
        signatureVC.getImageBlcok = {(obtainSignatureImage) in
            
            self.showImage = obtainSignatureImage
            
        }
        self.navigationController?.pushViewController(signatureVC, animated: true)
        
    }
    
    
}

