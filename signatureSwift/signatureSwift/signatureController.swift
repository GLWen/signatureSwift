//
//  signatureController.swift
//  signatureSwift
//
//  Created by 温国力 on 16/9/20.
//  Copyright © 2016年 wenguoli. All rights reserved.
//

import UIKit
typealias signatureControllerBlock = (_ getImage: UIImage) -> Void
class signatureController: UIViewController {

    //保存图片回调出去
    var getImageBlcok: signatureControllerBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let brushBoard = AFBrushBoard.init(frame: CGRect.init(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: 300))
        
        brushBoard.saveImageBlcok = {(saveImage) in
            
            saveImageAlertView(title: "温馨提示", message: "是否确定保存签名", viewController: self, finished: {
                //保存到相册
//                UIImageWriteToSavedPhotosAlbum(saveImage, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
                
                //测试！回调到首页控制器
                if self.getImageBlcok != nil{
                    self.getImageBlcok!(saveImage)
                }
                
                self.navigationController!.popViewController(animated: true)
            })
        }
        self.view.addSubview(brushBoard)
        
    }

    //  - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
    //MARK: - 保存图片是否成功
    @objc func image(image: UIImage, didFinishSavingWithError: NSError?,contextInfo: AnyObject)
    {
        
        if didFinishSavingWithError != nil
        {
            showAlertView(title: "温馨提示", message: "保存图片失败", viewController: self);
            return
        }
        
        showAlertView(title: "温馨提示", message: "保存图片成功", viewController: self);
    }

}
//MARK: - 提醒是否确定保存图片
func saveImageAlertView(title:String,message:String,viewController: UIViewController,finished:@escaping () -> ())
{
    let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    let cancelAction: UIAlertAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
    let okAction: UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default){ (_) in
        finished()
    }
    alert.addAction(cancelAction)
    alert.addAction(okAction)
    viewController.present(alert, animated: true, completion: nil)
    
}
//MARK: - 提醒是否保存图片成功
func showAlertView(title:String,message:String,viewController: UIViewController)
{
    let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    let OKAction: UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default, handler: nil)
    alert.addAction(OKAction)
    viewController.present(alert, animated: true, completion: nil)
    
}
