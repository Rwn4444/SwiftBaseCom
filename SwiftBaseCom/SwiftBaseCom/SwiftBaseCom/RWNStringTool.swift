//
//  RWNStringTool.swift
//  SwiftBaseCom
//
//  Created by RWN on 2019/8/22.
//  Copyright © 2019年 RWN. All rights reserved.
//

import UIKit
import CommonCrypto

extension String {
    
    ///时间戳转成时间
    func RWNTimeExchangeWithDateFormat(dateFormat : String) -> String {
        
        ///yyyy-MM-dd HH:mm:ss
        let time = NSString.init(string: self).longLongValue / 1000
        let interval:TimeInterval = TimeInterval.init(time)
        let sendData = Date.init(timeIntervalSince1970:interval)
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let timeStr = formatter.string(from: sendData)
        return timeStr;
        
    }
    
    ///md5加密
    func RWNMd5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize(count:digestLen)
        return String(format: hash as String)
    }
    
    ///时间字符串转时间戳
    static func RWNStringToTimeStamp(stringTime:String)->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        let date = dfmatter.date(from: stringTime)
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)*1000
        return String(dateSt)
        
    }
    
    
    ///获取当前时间
    static func RWNTimeNowWithDateFormat(dateFormat:String) -> String {
        
        let date  = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let timeStr = formatter.string(from: date)
        return timeStr
        
    }
    
    ///字符串是否为空
    static func RWNCheckForNull(checkString:String?) -> Bool {
        
        if checkString?.isEmpty ?? false || checkString == "null" || checkString == "(null)" || checkString == "<null>" || checkString == nil  {
            return true
        }else{
            return false
        }
       
        
    }
    
    ///校验身份证
    static func RWNValidateIDCardNumber(_ identity: String) -> Bool {
        
        let identityCard = identity.trimmingCharacters(in: CharacterSet())
        //判断是否为空
        if String.RWNCheckForNull(checkString: identityCard){
            return false
        }else{
            if identityCard.count != 15 && identityCard.count != 18  {
                return false
            }
        }
        
        ///身份代码
        let areasArray = ["11","12", "13","14", "15","21", "22","23", "31","32", "33","34", "35","36", "37","41", "42","43", "44","45", "46","50", "51","52", "53","54", "61","62", "63","64", "65","71", "81","82", "91"]
        
        let startIndex = identityCard.startIndex
        let endIndex = identityCard.index(identityCard.startIndex, offsetBy: 1)
        
        let valueStart2 = identityCard[startIndex...endIndex ]
        var areaFlag = false
        for areaIndex in areasArray {
            if areaIndex == valueStart2{
                areaFlag = true
                break
            }
        }
        
        if (!areaFlag) {
            return false;
        }
        
        var regularExpression = NSRegularExpression()
        let  numberofMatch : NSInteger
        var year : Int = 0
        switch identityCard.count {
        case 15:
            let strarIndex = Index(encodedOffset: 6)
            let endIndex = Index(encodedOffset: 8)
            year = Int((identityCard[strarIndex...endIndex] as NSString).intValue + 1900)
            if (year % 4 == 0 || (year % 100 == 0 && year % 4 == 0)) {
                do{
                    regularExpression = try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$", options: .caseInsensitive)
                }catch{
                    
                }
            }else{
                do{
                    regularExpression = try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$", options: .caseInsensitive)
                }catch{
                    
                }
            }
            numberofMatch = regularExpression.numberOfMatches(in: identityCard, options: .reportProgress, range: NSMakeRange(0, identityCard.count))
            if numberofMatch > 0{
                
                return true
            }else{
                return false
            }
        case 18:
            let strarIndex = Index(encodedOffset: 6)
            let endIndex = Index(encodedOffset: 9)
            year = Int((identityCard[strarIndex...endIndex] as NSString).intValue)
            if (year % 4 == 0 || (year % 100 == 0 && year % 4 == 0)) {
                do{
                    regularExpression = try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[1-2][0-9][0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$", options: .caseInsensitive)
                }catch{
                    
                }
            }else{
                do{
                    regularExpression = try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[1-2][0-9][0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$", options: .caseInsensitive)
                }catch{
                    
                }
            }
            numberofMatch = regularExpression.numberOfMatches(in: identityCard, options: .reportProgress, range: NSMakeRange(0, identityCard.count))
            if numberofMatch > 0{
                let Index0 = Index(encodedOffset: 0)
                let Index1 = Index(encodedOffset: 1)
                let Index2 = Index(encodedOffset: 2)
                let Index3 = Index(encodedOffset: 3)
                let Index4 = Index(encodedOffset: 4)
                let Index5 = Index(encodedOffset: 5)
                let Index6 = Index(encodedOffset: 6)
                let Index7 = Index(encodedOffset: 7)
                let Index8 = Index(encodedOffset: 8)
                let Index9 = Index(encodedOffset: 9)
                let Index10 = Index(encodedOffset: 10)
                let Index11 = Index(encodedOffset: 11)
                let Index12 = Index(encodedOffset: 12)
                let Index13 = Index(encodedOffset: 13)
                let Index14 = Index(encodedOffset: 14)
                let Index15 = Index(encodedOffset: 15)
                let Index16 = Index(encodedOffset: 16)
                let Index17 = Index(encodedOffset: 17)
                
                let str = identityCard[Index0...Index0]
                let str1 = identityCard[Index1...Index1]
                let str2 = identityCard[Index2...Index2]
                let str3 = identityCard[Index3...Index3]
                let str4 = identityCard[Index4...Index4]
                let str5 = identityCard[Index5...Index5]
                let str6 = identityCard[Index6...Index6]
                let str7 = identityCard[Index7...Index7]
                let str8 = identityCard[Index8...Index8]
                let str9 = identityCard[Index9...Index9]
                let str10 = identityCard[Index10...Index10]
                let str11 = identityCard[Index11...Index11]
                let str12 = identityCard[Index12...Index12]
                let str13 = identityCard[Index13...Index13]
                let str14 = identityCard[Index14...Index14]
                let str15 = identityCard[Index15...Index15]
                let str16 = identityCard[Index16...Index16]
                let str17 = identityCard[Index17...Index17]

                let s = ((str as NSString).intValue + (str10 as NSString).intValue)*7
                    + ((str1 as NSString).intValue + (str11 as NSString).intValue)*9
                    + ((str2 as NSString).intValue + (str12 as NSString).intValue)*10
                    + ((str3 as NSString).intValue + (str13 as NSString).intValue)*5
                    + ((str4 as NSString).intValue + (str14 as NSString).intValue)*8
                    + ((str5 as NSString).intValue + (str15 as NSString).intValue)*4
                    + ((str6 as NSString).intValue + (str16 as NSString).intValue)*2
                    + (str7 as NSString).intValue*1
                    + (str8 as NSString).intValue*6
                    + (str9 as NSString).intValue*3
                let y = s % 11
                var  M  = "F"
                let JYM = "10X98765432"
                let index = Index(encodedOffset: Int(y))
                M = String(JYM[index...index])
                if M == str17 {
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        default:
            return false
        }
        
    }
    
    //是否包含中文
    static func RWNHasChinese(string : String) -> Bool {
        
        for (_, value) in string.enumerated() {
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
    
    
}
