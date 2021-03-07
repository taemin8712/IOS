//
//  ListTableViewController.swift
//  TMPlist
//
//  Created by taemmy on 2021/01/28.
//  Copyright © 2021 tm. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var married: UISwitch!
    @IBOutlet weak var gender: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let plist = UserDefaults.standard
        
        self.name.text = plist.string(forKey: "name")
        self.married.isOn = plist.bool(forKey: "married")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func save(_ sender: Any) {
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex

        let plist = UserDefaults.standard
        plist.set(value, forKey: "gender")
        plist.synchronize()
    }
    
    @IBAction func chagneMarried(_ sender: UISwitch) {
        let value = sender.isOn
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "married")
        plist.synchronize()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
          showAlert()
        }
    }
    @IBAction func editName(_ sender: Any) {
        showAlert()
    }
    func showAlert(){
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
                  
              
                  alert.addTextField() {
                      $0.text = self.name.text
                  }
                  alert.addAction(UIAlertAction(title: "OK", style: .default){
                      (_) in
                      
                      let value = alert.textFields![0].text
                      let plist = UserDefaults.standard
                      plist.set(value, forKey: "name")
                      plist.synchronize()
                      
                      self.name.text = value
                  })
                  
                  self.present(alert, animated: false, completion: nil)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
