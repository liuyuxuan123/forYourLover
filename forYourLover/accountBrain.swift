//
//  accountBrain.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/14.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import Foundation

class userAccount:NSObject,NSCoding{
    // MARK: properties
    
    var userName:String
    var userEmail:String
    var userCode:String
    var userAge:Int
    var userGender:Int // 1 -> boy 2 -> girl
    var userInterestField:[String]?
    //var userIsVIP:Bool
    
    //property key
    struct propertyKey {
        static let userNameKey = "userName"
        static let userEmailKey = "userEmail"
        static let userCodeKey = "userCode"
        static let userAgeKey = "userAge"
        static let userGenderKey = "userGender"
        static let userInterestFieldKey = "userInterestField"
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(userName, forKey: propertyKey.userNameKey)
        aCoder.encodeObject(userEmail, forKey: propertyKey.userEmailKey)
        aCoder.encodeObject(userCode, forKey: propertyKey.userCodeKey)
        aCoder.encodeObject(userAge, forKey: propertyKey.userAgeKey)
        aCoder.encodeObject(userGender, forKey: propertyKey.userGenderKey)
        aCoder.encodeObject(userInterestField, forKey: propertyKey.userInterestFieldKey)
    }
    
    
    // MARK: init
    init?(userName name:String,userEmail email:String,userCode code:String,userAge age:Int,userGender gender:Int,userInterestField interestField:[String]?){
        self.userName = name
        self.userEmail = email
        self.userCode = code
        self.userAge = age
        self.userGender = gender
        self.userInterestField = interestField
        
        //After that you will write a algorithm that this name is an availiable name
        //After that you will write a algorithm to check whether this email is useable
        super.init()
        
        if((code as NSString).length <= 8 || userAge <= 0 || userGender <= 0 || userGender >= 3){
            return nil
        }
 
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(propertyKey.userNameKey) as! String
        let email = aDecoder.decodeObjectForKey(propertyKey.userEmailKey) as! String
        let code = aDecoder.decodeObjectForKey(propertyKey.userCodeKey) as! String
        let age = aDecoder.decodeObjectForKey(propertyKey.userAgeKey) as! Int
        let gender = aDecoder.decodeObjectForKey(propertyKey.userGenderKey) as! Int
        let interestField = aDecoder.decodeObjectForKey(propertyKey.userInterestFieldKey) as! [String]?
        //let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        //let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        // Must call designated initializer.
        //self.init(name: name, photo: photo, rating: rating)
        self.init(userName:name,userEmail:email,userCode:code,userAge:age,userGender:gender,userInterestField:interestField)
        
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("userAccount")

    
    
}