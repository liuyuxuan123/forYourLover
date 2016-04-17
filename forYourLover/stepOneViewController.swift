//
//  stepOneViewController.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/14.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class stepOneViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var cancelBUtton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var targetTextField: UITextField!
    
   //in this step we gonna create an new activity
    var myMission:missionList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        targetTextField.delegate = self
        checkValidName()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        doneButton.enabled = false
    }
    
    func checkValidName() {
        // Disable the Save button if the text field is empty.
        let nameText = nameTextField.text ?? ""
        let targetText = targetTextField.text ?? ""
        doneButton.enabled = !nameText.isEmpty && !targetText.isEmpty
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
        let createCellStepOneViewController = segue.destinationViewController as! ViewController
        if sender === doneButton {
            createCellStepOneViewController.keepGoing = true
            createCellStepOneViewController.myMission.missionName = nameTextField.text! + targetTextField.text!
          
        }else if sender === cancelBUtton {
            createCellStepOneViewController.keepGoing = false
            print("cancel")
        }
        
        
        /*
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealListTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating)
        }
*/
    }
}
