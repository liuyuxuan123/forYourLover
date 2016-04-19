//
//  ViewController.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/14.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myMission = missionList(missionType: [], missionName: "", missionRemainTime: 10, missionPunishment: [])!
    
    var keepGoing:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createListStep1.enabled = true
        createListStep2.enabled = false
        createListStep3.enabled = false
        createListStep4.enabled = false

    }
    
   


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var createListStep1: UIButton!
    @IBOutlet weak var createListStep2: UIButton!
    @IBOutlet weak var createListStep3: UIButton!
    @IBOutlet weak var createListStep4: UIButton!

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        
        
        if let navController = destination as? UINavigationController{
            destination = navController.visibleViewController
            
            if let destinationViewController = destination as? stepOneViewController{
                destinationViewController.myMission = myMission
                print("I create a segue to stepOneViewController")
            }else if let destinationViewController = destination as? stepTwoViewController{
                destinationViewController.myMission = myMission
                print("I create a segue to stepTwoViewController")
            }else if let destinationViewController = destination as? stepThreeViewController{
                destinationViewController.myMission = myMission
                print("I create a segue to stepThreeViewController")
            }else if let destinationViewController = destination as? stepFourViewController{
                destinationViewController.myMission = myMission
                print("I create a segue to stepFourViewController")
            }else{
                print("fail")
            }
        
        }
        
   
    }
    
    
    
    @IBAction func unwindToMainController(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.sourceViewController as? stepOneViewController{
            if keepGoing == true{
                createListStep1.enabled = false
                createListStep2.enabled = true
            }else{
                print("false")
                setAgain()
            }
        }
    
        if let sourceViewController = sender.sourceViewController as? stepTwoViewController{
            
            if keepGoing == true{
                createListStep2.enabled = false
                createListStep3.enabled = true
            }else{
                print("false")
                setAgain()
            }
        }
        
        if let sourceViewController = sender.sourceViewController as? stepThreeViewController{
            
            if keepGoing == true{
                createListStep3.enabled = false
                createListStep4.enabled = true
            }else{
                print("false")
                setAgain()
            }
        }
        if let sourceViewController = sender.sourceViewController as? stepFourViewController{
            
            if keepGoing == true{
                createListStep4.enabled = false
            }else{
                print("false")
                setAgain()
            }
        }
    }
    
        func setAgain(){
            createListStep1.enabled = true
            createListStep2.enabled = false
            createListStep3.enabled = false
            createListStep4.enabled = false
        }
    
    
    

}
/*
else if let foryourLoveViewController = destination as? forYourLoveTableViewController{
    foryourLoveViewController.userTodoList.append(myMission)
}
*/






