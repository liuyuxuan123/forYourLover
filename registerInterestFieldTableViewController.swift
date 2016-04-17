//
//  registerInterestFieldTableViewController.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/16.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class registerInterestFieldTableViewController: UITableViewController {

    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var lifeStyleButton: UIButton!
    @IBOutlet weak var foreignLanguageLearnningButton: UIButton!
    @IBOutlet weak var workPromotion: UIButton!
    @IBOutlet weak var schoolTestButton: UIButton!
    @IBOutlet weak var otherTestButton: UIButton!
    
    var lifeStyleBool:Bool = false{
        didSet{
            if(lifeStyleButton == true){
                let button = UIImage(named: "sample1")
                lifeStyleButton.setImage(button, forState: .Normal)
                print("sample1")
            }else{
                lifeStyleButton.setImage(nil, forState: .Normal)
            }
        }
    }
    var foreignLanguageLearningBool:Bool = false{
        didSet{
            if(foreignLanguageLearningBool == true){
                foreignLanguageLearnningButton.setImage(UIImage(named: "sample2"), forState: .Normal)
                print("change2")
            }else{
                foreignLanguageLearnningButton.setImage(nil, forState: .Normal)
            }
        }
    }
    var workPromotionBool:Bool = false
    var schoolTestBool:Bool = false
    var otherTestBool:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: "setting"){
        
        lifeStyleButton.setImage(image, forState: .Normal)
        lifeStyleButton.setTitle("", forState: .Normal)
        foreignLanguageLearnningButton.setImage(image, forState: .Normal)
        foreignLanguageLearnningButton.setTitle("", forState: .Normal)
        workPromotion.setImage(image, forState: .Normal)
        workPromotion.setTitle("", forState: .Normal)
        schoolTestButton.setImage(image, forState: .Normal)
        schoolTestButton.setTitle("", forState: .Normal)
        otherTestButton.setImage(image, forState: .Normal)
            otherTestButton.setTitle("", forState: .Normal)
        }else{
            print("holy shit")
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
/*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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
    
    
    //MARK: button
    
    @IBAction func lifeStyleAction(sender: AnyObject) {
        lifeStyleBool = !lifeStyleBool
    }
    @IBAction func foreignLanguageLearningAction(sender: AnyObject) {
        foreignLanguageLearningBool = !foreignLanguageLearningBool
    }
    @IBAction func schoolTestAction(sender: AnyObject) {
        schoolTestBool = !schoolTestBool
    }
    @IBAction func workPromotionAction(sender: AnyObject) {
        workPromotionBool = !workPromotionBool
    }
    @IBAction func otherTestAction(sender: AnyObject) {
        otherTestBool = !otherTestBool
    }
 
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewController = segue.destinationViewController as! registerTableViewController
        
        if sender === saveButton {
            
        }else if sender === cancelButton{
            
        }
    }

}
