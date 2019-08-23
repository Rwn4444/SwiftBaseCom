//
//  RWNUIFontTool.swift
//  SwiftBaseCom
//
//  Created by RWN on 2019/8/22.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

extension UIFont{
    
    static func RWNFontOfSize(fontSize:CGFloat) ->   UIFont {
        
        let font = UIFont.init(name: "PingFangSC-Regular", size: fontSize)
        guard let newFont = font else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return  newFont
        
    }
    
    
    static func RWNBoldFontOfSize(fontSize:CGFloat) -> UIFont {
        
        let font = UIFont.init(name: "PingFangSC-Medium", size: fontSize)
        guard let newFont = font else {
            return UIFont.boldSystemFont(ofSize:fontSize)
        }
        return  newFont
        
    }
    
    
}
