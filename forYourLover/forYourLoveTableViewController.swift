//
//  forYourLoveTableViewController.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/14.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class forYourLoveTableViewController: UITableViewController {

    
    
    var user:userAccount = userAccount(userName: "刘宇轩", userEmail: "1010134430@qq.com", userCode: "123456789", userAge: 20, userGender: 1, userInterestField: nil)!
    
    var userTodoList:[missionList] = []{
        didSet{
            saveUserToDoList()
        }
    }
    
    
    //typealias propertyList = AnyObject
    
    /*
    var program:propertyList{
        
        get{
            return userTodoList
        }
    }
*/
 
    
    
    var userDefault = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userDefault.setObject(userTodoList, forKey: "yourToDoList")
        //userDefault.synchronize()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if let savedUserAccount = loadUserAccount(){
            user = savedUserAccount
        }else{
            print("havent been setted yet")
        }
        
      
        
        
        if let savedToDoList = loadToDoList(){
            userTodoList = savedToDoList
            print("i have imformation")
        }else{
            print("havent been setted yet to do")
        }

        
        for(index,element) in userTodoList.enumerate(){
            print("\(index)"+element.missionName + "  ")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userTodoList.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCellWithIdentifier("reuserTableViewCell", forIndexPath: indexPath)
        let cell = dequeued as! forYourLoveTableViewCell
        cell.missonNaneLabel.text = userTodoList[indexPath.row].missionName
        cell.missonRemainTime.text = String(userTodoList[indexPath.row].missionRemainTime)
        
        print("hi i create an table view cell")
        return cell
    }
    

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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
       
        if let destinationViewController = segue.destinationViewController as? registerTableViewController {
            destinationViewController.userImformation = user
        }else{

        }
        
        if let destinationViewController = segue.destinationViewController as? ViewController
        {
            print("use create segue to viewcontroller")
    
           
        }else{
            
        }
    }
    /*
    func saveUserAccount() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(user, toFile: userAccount.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save userAccount...")
        }
    }
*/
    
    func loadUserAccount() -> userAccount? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(userAccount.ArchiveURL.path!) as? userAccount
    }
    
    
    func saveUserToDoList() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(userTodoList, toFile: missionList.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save toDolist..")
        }else{
            print("store a new imformation")
        }
    }
    
    
    func loadToDoList() -> [missionList]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(missionList.ArchiveURL.path!) as? [missionList]
    }

   
}
