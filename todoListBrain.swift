//
//  todoListBrain.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/15.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import Foundation

class missionList:NSObject,NSCoding{
    
    // MARK: properties
    enum missionType:String{
        case lifeStyle = "lifeStyle"
        case foreignLanguageLearning = "foreignLanguageLearning"
        case schoolGrade = "schoolGrade"
        case testGrade = "testGrade"
        case workPromotion = "workPromotion"
        
        static func fromRaw(raw:String) -> missionType?{
            switch raw{
                case "lifeStyle":return missionType.lifeStyle
                case "foreignLanguageLearning": return missionType.foreignLanguageLearning
                case "schoolGrade":return missionType.schoolGrade
                case "testGrade":return missionType.testGrade
                case "workPromotion":return missionType.workPromotion
                default:return nil
            }
        }
    }
    
    enum punishmentType:String{
        case giveMoneyToYourFriend = "giveMoneyToYourFriend"
        case donateMoneyToCharityOrganization = "donateMoneyToCharityOrganization"
        case giveAnUglySelfiesToYourFriend = "giveAnUglySelfiesToYourFriend"
        
        static func fromRaw(raw:String) -> punishmentType?{
            switch raw{
                case "giveMoneyToYourFriend" : return punishmentType.giveMoneyToYourFriend
                case "donateMoneyToCharityOrganization" : return punishmentType.donateMoneyToCharityOrganization
                case "giveAnUglySelfiesToYourFriend" : return punishmentType.giveAnUglySelfiesToYourFriend
                default: return nil
            }
        }
    }
    
    
    var missionDescription:[missionType]
    var missionName:String
    var missionRemainTime:Int
    var missionPunishment:[punishmentType]
    
    struct toDoListPropertyKey{
        static let missionDescriptionKey = "missionDescription"
        static let missionNameKey = "missionName"
        static let missionRemainTimeKey = "missionRemainTime"
        static let missionPunishmentKey = "missionPunishment"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
       // aCoder.encodeObject(missionDescription, forKey:toDoListPropertyKey.missionDescriptionKey)
        let missionCovertedDescription = missionDescription.map{$0.rawValue}
        aCoder.encodeObject(missionCovertedDescription, forKey:toDoListPropertyKey.missionDescriptionKey)
        aCoder.encodeObject(missionName, forKey: toDoListPropertyKey.missionNameKey)
        aCoder.encodeObject(missionRemainTime, forKey: toDoListPropertyKey.missionRemainTimeKey)
        let missionCovertedPunishment = missionPunishment.map{$0.rawValue}
        //aCoder.encodeObject(missionPunishment, forKey: toDoListPropertyKey.missionPunishmentKey)
        aCoder.encodeObject(missionCovertedPunishment, forKey: toDoListPropertyKey.missionPunishmentKey)
    }
    
    
    // MARK: init
    init?(missionType type:[missionList.missionType],missionName name:String,missionRemainTime time:Int,missionPunishment punishment:[missionList.punishmentType]){
        self.missionDescription = type
        self.missionName = name
        self.missionRemainTime = time
        self.missionPunishment = punishment
        super.init()
        if(time <= 0){
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        var missionDescriptionString:[String] = [String()]
        missionDescriptionString = aDecoder.decodeObjectForKey(toDoListPropertyKey.missionDescriptionKey) as! [String]
        let missionUnarchivingDescription = missionDescriptionString.map{missionType.fromRaw($0)!}
        
        let missionUnarchivingName = aDecoder.decodeObjectForKey(toDoListPropertyKey.missionNameKey) as! String
        let missionUnarchivingRemainTime = aDecoder.decodeObjectForKey(toDoListPropertyKey.missionRemainTimeKey) as! Int
        
        var missionPunishmentString:[String] = [String()]
        missionPunishmentString = aDecoder.decodeObjectForKey(toDoListPropertyKey.missionPunishmentKey) as! [String]
        let missionUnarchivingPunishment = missionPunishmentString.map{punishmentType.fromRaw($0)!}
        
        self.init(missionType:missionUnarchivingDescription,missionName:missionUnarchivingName,missionRemainTime:missionUnarchivingRemainTime,missionPunishment:missionUnarchivingPunishment)
        
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("toDoList")
    
    
    
}