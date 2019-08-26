//
//  RWNUIBarButtonItemTool.swift
//  SwiftBaseCom
//
//  Created by RWN on 2019/8/22.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

public enum RWNBar {
    case Middle
    case Left
    case Right
}


public extension UIBarButtonItem {
    
    ///获取barBtn
    static func RWN_BarButnWith(frame:CGRect?,title:String?,titleColor:UIColor?,image:UIImage?,font:UIFont?,Target:AnyObject,action:Selector,direction: RWNBar ) -> UIBarButtonItem {
        
        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: frame, title: title, titleColor: titleColor, image: image, font: font, Target: Target, action: action, direction: direction)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem
        
    }
    
    ///获取只有文字的barBtn
    static func RWN_BarButnWithTitle(frame:CGRect?,title:String?,titleColor:UIColor?,font:UIFont?,Target:AnyObject,action:Selector,direction:RWNBar) -> UIBarButtonItem {
        
        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: frame, title: title, titleColor: titleColor, image: nil, font: font, Target: Target, action: action, direction: direction)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem
        
    }
    
    ///获取只有文字的barBtn，不用写frame
    static func RWN_BarButnWithTitle(title:String?,titleColor:UIColor?,font:UIFont?,Target:AnyObject,action:Selector,direction:RWNBar) -> UIBarButtonItem {
        
        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: nil, title: title, titleColor: titleColor, image: nil, font: font, Target: Target, action: action, direction: direction)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem
        
    }
    
    ///获取只有文字的barBtn，不用写frame,没有点击事件
    static func RWN_BarButnWithTitle(title:String?,titleColor:UIColor?,font:UIFont?,direction:RWNBar) -> UIBarButtonItem {
        
        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: nil, title: title, titleColor: titleColor, image: nil, font: font, Target: nil, action: nil, direction: direction)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem
        
    }
    
    ///获取只有文字的barBtn，不用写frame,没有点击事件,默认居中
    static func RWN_BarButnWithTitle(title:String?,titleColor:UIColor?,font:UIFont?) -> UIBarButtonItem {
        
        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: nil, title: title, titleColor: titleColor, image: nil, font: font, Target: nil, action: nil, direction: .Middle)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem
        
    }
    
    ///获取只有图片的barBtn
    static func RWN_BarButnWithImage(frame:CGRect?,image:UIImage?,Target:AnyObject,action:Selector,direction:RWNBar) -> UIBarButtonItem {
        
        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: frame, title: nil, titleColor: nil, image: image, font: nil, Target: Target, action: action, direction: direction)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem
        
    }
    
    ///获取只有图片的barBtn，不用写frame
    static func RWN_BarButnWithImage(image:UIImage?,Target:AnyObject,action:Selector,direction:RWNBar) -> UIBarButtonItem {
        
        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: nil, title: nil, titleColor: nil, image: image, font: nil, Target: Target, action: action, direction: direction)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem
        
    }
    
    ///获取只有图片的barBtn，不用写frame,没有点击事件
    static func RWN_BarButnWithImage(image:UIImage?,direction:RWNBar) -> UIBarButtonItem {

        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: nil, title: nil, titleColor: nil, image: image, font: nil, Target: nil, action: nil, direction: direction)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem

    }
    
    ///获取只有图片的barBtn，不用写frame,没有点击事件,默认居中
    static func RWN_BarButnWithImage(image:UIImage?) -> UIBarButtonItem {
        
        let barButton = UIBarButtonItem.RWNGetCustomeBtnWith(frame: nil, title: nil, titleColor: nil, image: image, font: nil, Target: nil, action: nil, direction: .Middle)
        let barButtonItem = UIBarButtonItem(customView: barButton)
        return barButtonItem
        
    }
    
    
    ///通用方法获取btn
    private static func RWNGetCustomeBtnWith(frame:CGRect?,title:String?,titleColor:UIColor?,image:UIImage?,font:UIFont?,Target:AnyObject?,action:Selector?,direction:RWNBar) -> UIButton{
        
        let barButton = UIButton(frame: frame ?? CGRect(x: 0, y: 0, width: 60, height: 44))
        
        if !String.RWNCheckForNull(checkString: title) {
            barButton.setTitle(title, for: .normal)
        }
        
        if titleColor != nil {
            barButton.setTitleColor(titleColor, for: .normal)
        }
        
        if image != nil {
            barButton.setImage(image, for: .normal)
        }
        
        if font != nil {
            barButton.titleLabel?.font = font
        }else{
            barButton.titleLabel?.font = UIFont.RWNFontOfSize(fontSize: 15)
        }
        
        switch direction {
        case .Left:
            barButton.contentHorizontalAlignment = .left
        case .Right:
            barButton.contentHorizontalAlignment = .right
        case .Middle:
            barButton.contentHorizontalAlignment = .center
        }
        
        if  let newAction = action {
            barButton.addTarget(Target, action: newAction, for:.touchUpInside)
        }
        barButton.RWNLayoutButton(style: .Left, imageTitleSpace: 5)
//        barButton.backgroundColor = UIColor.red
        return barButton
        
    }
    
    
}
