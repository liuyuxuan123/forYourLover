//
//  todoListBrain.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/15.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import Foundation

class missionList{
    
    // MARK: properties
    enum missionType{
        case lifeStyle
        case foreignLanguageLearning
        case schoolGrade
        case testGrade
        case workPromotion
    }
    
    enum punishmentType{
        case givMoneyToYourFriend(Double)
        case donateMoneyToCharityOrganization(Double)
        case giveAnUglySelfiesToYourFriend(String)
    }
    
    
    var missionDescription = [missionType]()
    var missionName:String
    var missionRemainTime:Int
    var missionPunishment = [punishmentType]()
    
    
    // MARK: init
    init?(missionType type:[missionList.missionType],missionName name:String,missionRemainTime time:Int,missionPunishment punishment:[missionList.punishmentType]){
        self.missionDescription = type
        self.missionName = name
        self.missionRemainTime = time
        self.missionPunishment = punishment
        
        if(time <= 0){
            return nil
        }
    }
    
}