//
//  accountBrain.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/14.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import Foundation

class userAccount{
    // MARK: properties
    
    var userName:String
    var userEmail:String
    var userCode:String
    var userAge:Int
    var userGender:Int // 1 -> boy 2 -> girl
    var userInterestField:[String]?
    //var userIsVIP:Bool
    
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
        if((code as NSString).length <= 8 || userAge <= 0 || userGender <= 0 || userGender >= 3){
            return nil
        }
 
    }
    
    
}