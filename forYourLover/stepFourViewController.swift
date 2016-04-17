//
//  stepFourViewController.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/14.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class stepFourViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var myMission:missionList?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let createCellStepFourViewController = segue.destinationViewController as! UIViewController
        
        if sender === doneButton {
            let destination = createCellStepFourViewController as! UINavigationController
            let destination2 = destination.visibleViewController
            let destination3 = destination2 as! forYourLoveTableViewController
            destination3.userTodoList.append(myMission!)
        }else if sender === cancelButton{
            let destination = createCellStepFourViewController as! ViewController
            print("cancelNutton")
            destination.keepGoing = false
        }
    }

}
