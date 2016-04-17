//
//  stepTwoViewController.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/14.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class stepTwoViewController: UIViewController,UITextFieldDelegate {
    
    
    var myMission:missionList?
    
    @IBOutlet weak var loverNameTextField: UITextField!
    @IBOutlet weak var benifitToYourLover: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        loverNameTextField.delegate = self
        benifitToYourLover.delegate = self
        
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        doneButton.enabled = true
        checkValidName()
    }
    
    func checkValidName() {
        // Disable the Save button if the text field is empty.
        let nameText = loverNameTextField.text ?? ""
        let targetText = benifitToYourLover.text ?? ""
        doneButton.enabled = !nameText.isEmpty && !targetText.isEmpty
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        doneButton.enabled = false
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
    
    let createCellStepTwoViewController = segue.destinationViewController as! ViewController
    
        if sender === doneButton {
            createCellStepTwoViewController.keepGoing = true
         
        }else if sender === cancelButton{
            print("cancelNutton")
            createCellStepTwoViewController.keepGoing = false
        }
    }
}
