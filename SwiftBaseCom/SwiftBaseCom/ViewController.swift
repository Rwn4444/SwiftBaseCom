//
//  ViewController.swift
//  SwiftBaseCom
//
//  Created by RWN on 2019/8/23.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let aStr : NSString = "123456"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "RWN"
        
        let date = String.RWNStringToTimeStamp(stringTime: "2019年02月01日")
        let dateStr = date.RWNTimeExchangeWithDateFormat(dateFormat: "yyyy-MM-dd HH:mm:ss")
        print(dateStr)
        
        let nowTime = String.RWNTimeNowWithDateFormat(dateFormat: "yyyy-MM-dd")
        
        print(nowTime)
        
        let emptyStr :String? = ""
        print(String.RWNCheckForNull(checkString: emptyStr))
        ///18位已校验
        print( "身份证" + "\(String.RWNValidateIDCardNumber("1110126166202156532"))")
        
        let md5Str = "123456".RWNMd5()
        print("\(md5Str)")
        
        let have = String.RWNHasChinese(string: "123456中国的文字")
        let noHave = String.RWNHasChinese(string: "123456")
        print("\(have)")
        print("\(noHave)")
        
        
        //        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 200, height: 300))
        //        self.view.addSubview(imageView)
        //
        //        let yelloImage = UIImage.RWNImageWithColor(color: .yellow)
        //        imageView.image = yelloImage
        //
        //        let redImage = UIImage(named: "Home")?.RWNChangeImageWithColor(color: .red)
        //        imageView.image = redImage
        //
        //        let stretImage = UIImage(named: "Home")?.RWNStretchableImage()
        //        imageView.image = stretImage
        //
        //        let sizeImage = UIImage(named: "Home")?.RWNScaleToSize(newSize: CGSize(width: 200, height: 300))
        //        imageView.image = sizeImage
        //        imageView.image = yelloImage
        
        let btn = UIButton(frame: CGRect(x: 0, y: 500, width: 60, height: 40));
        btn.setTitle("首页", for: .normal)
        btn.setImage(UIImage(named: "Home"), for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.titleLabel?.font = UIFont.RWNFontOfSize(fontSize: 15)
        //        self.view.addSubview(btn)
        
        btn.RWNLayoutButton(style: .Left, imageTitleSpace: 5)
        btn.RWNLayoutButton(style: .Right, imageTitleSpace: 5)
        btn.RWNLayoutButton(style: .Top, imageTitleSpace: 5)
        btn.RWNLayoutButton(style: .Bottom, imageTitleSpace: 5)
        
        
        let leftBar = UIBarButtonItem.RWN_BarButnWith(frame: CGRect(x: 0, y: 0, width: 60, height: 44), title: nil, titleColor: nil, image: UIImage(named: "黑返回"), font: nil, Target: self, action: #selector(leftBtnClick), direction: .Left)
        self.navigationItem.leftBarButtonItem = leftBar
        
        let leftBar1 = UIBarButtonItem.RWN_BarButnWithImage(frame: nil, image: UIImage(named: "黑返回"), Target: self, action: #selector(leftBtnClick), direction: .Left)
        self.navigationItem.leftBarButtonItem = leftBar1
        
        let leftBar2 = UIBarButtonItem.RWN_BarButnWithImage( image: UIImage(named: "黑返回"), Target: self, action: #selector(leftBtnClick), direction: .Left)
        self.navigationItem.leftBarButtonItem = leftBar2
        
        //        let leftBar3 = UIBarButtonItem.RWN_BarButnWith(frame: CGRect(x: 0, y: 0, width: 60, height: 44), title: "保存", titleColor: UIColor.black, image: UIImage(named: "黑返回"), font: UIFont.RWNFontOfSize(fontSize: 15), Target: self, action: #selector(leftBtnClick), direction: nil)
        //        self.navigationItem.rightBarButtonItem = leftBar3
        
        //        self.view.backgroundColor = UIColor.RWNHexStringToColor(hex: "666666")
        //        self.view.backgroundColor = UIColor.RWNHexStringToColor(hex: "666666", alph: 0.5)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @objc func leftBtnClick(){
        print("点我干嘛")
    }

}

