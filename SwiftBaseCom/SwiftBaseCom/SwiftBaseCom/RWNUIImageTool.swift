//
//  RWNUIImageTool.swift
//  SwiftBaseCom
//
//  Created by RWN on 2019/8/22.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    ///修改图片的颜色
    func RWNChangeImageWithColor(color: UIColor) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
        
        let context = UIGraphicsGetCurrentContext();
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(.normal)
        
        let rect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.clip(to: rect, mask: self.cgImage!)
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage
        
    }
    
    
    ///对指定图片进行拉伸
    func RWNStretchableImage() -> UIImage {
        
        var normal = self
        let imageWidth = normal.size.width * 0.5
        let imageHeight = normal.size.height * 0.5
        normal = resizableImage(withCapInsets: UIEdgeInsets(top: imageHeight, left: imageWidth, bottom: imageHeight, right: imageWidth))
        return normal
    }
    
    ///把图片弄到指定大小
    func RWNScaleToSize(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }

    ///通过颜色返回一个图片
    static func RWNImageWithColor(color:UIColor) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
    
    
}


