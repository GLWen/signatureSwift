//
//  UIImage + Extension.swift
//  signatureSwift
//
//  Created by 温国力 on 16/9/20.
//  Copyright © 2016年 wenguoli. All rights reserved.
//

import UIKit


extension UIImage {
    
    static func imageWithCaputureView(view: UIView) -> UIImage
    {
        // 开启位图上下文
        UIGraphicsBeginImageContext(CGSize.init(width: view.bounds.size.width, height: view.bounds.size.height - 50))
        
        // 获取上下文
        let ctx = UIGraphicsGetCurrentContext()
        
        // 把控件上的图层渲染到上下文,layer只能渲染
        view.layer.render(in: ctx!)
        
        // 生成一张图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        //关闭上下文
        UIGraphicsEndImageContext()
        
        return image!
        
    }

}


