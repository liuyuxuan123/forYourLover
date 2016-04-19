//
//  registerTableViewController.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/15.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class registerTableViewController: UITableViewController {

    
    var userImformation:userAccount?{
        didSet{
            print("set you are changing me")
            updateNameLabel()
            updateEmailLabel()
            updateCodeLabel()
            updateAgeLabel()
            updateGenderLabel()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            if(userImformation != nil){
                print("why")
            }
            updateNameLabel()
        }
    }
    @IBOutlet weak var emaiLLabel: UILabel!{
        didSet{
           updateEmailLabel()
        }
    }
    @IBOutlet weak var codeLabel: UILabel!{
        didSet{
            updateCodeLabel()
        }
    }
    @IBOutlet weak var ageLabel: UILabel!{
        didSet{
            print("next?")
            updateAgeLabel()
        }
    }
    @IBOutlet weak var genderLabel: UILabel!{
        didSet{
            updateGenderLabel()
        }
    }

    
    // MARK: update method
  
    
    func updateNameLabel(){
        nameLabel?.text = userImformation?.userName
    }
    
    
    func updateEmailLabel(){
        emaiLLabel?.text = userImformation?.userEmail
    }
    
    func updateCodeLabel(){
        codeLabel?.text = userImformation?.userCode
    }
    
    func updateAgeLabel(){
        let age = String(userImformation?.userAge)
        ageLabel?.text = age
        
    }
    
    func updateGenderLabel(){
        genderLabel?.text = userImformation?.userGender == 1 ? "男":"女"
    }

    
    
    override func viewDidLoad(){
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
     print("hi this viewDidLoad")

    }
    

  /*
    func updateUI(){
        
        nameLabel?.text = userImformation?.userName
        emaiLLabel?.text = userImformation?.userEmail
        codeLabel?.text = userImformation?.userCode
        ageLabel?.text = String(userImformation?.userAge)
        genderLabel?.text = userImformation?.userGender == 1 ? "男":"女"
       
    }
*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: unwind action
    
    @IBAction func getImformation(sender:UIStoryboardSegue){
        saveUserAccount()   
    }
    
    func saveUserAccount() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(userImformation!, toFile: userAccount.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save userAccount...")
        }else{
            print("store a new imformation")
        }
    }
 
}
