//
//  registerGenderViewController.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/15.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class registerGenderViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var registerGender: UIPickerView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    var gender = ["男","女"]
    var userGender:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerGender.delegate = self
        registerGender.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: PickerView
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int {
        return gender.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        /*
        if(component == 0){
            println("month selected: \(month[row])")
        }
        if(component == 1){
            println("week selected: \(week[row])")
        }
*/
        if(row == 0){
            print("男")
            userGender = 1
        }else{
            print("女")
            userGender = 2
        }
        
        
        
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
        
        let destinationViewController = segue.destinationViewController as! registerTableViewController
        
        if sender === saveButton {
               destinationViewController.userImformation = userAccount(userName: (destinationViewController.userImformation?.userName)!, userEmail: (destinationViewController.userImformation?.userEmail)!, userCode: (destinationViewController.userImformation?.userCode)!, userAge: (destinationViewController.userImformation?.userAge)!, userGender: userGender!, userInterestField: destinationViewController.userImformation?.userInterestField)
            
            
        }else if sender === cancelButton{
            
        }
    }
    

}
