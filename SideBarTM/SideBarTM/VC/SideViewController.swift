//
//  SideViewController.swift
//  SideBarTM
//
//  Created by taemmy on 2021/01/25.
//  Copyright © 2021 tm. All rights reserved.
//

import SwiftUI

class SideViewController: UITableViewController {
    
    
    var delegate : ViewController?
    
    let titles = ["Menu - 1", "Menu - 2","Menu - 3", "Menu - 4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accountLabel = UILabel()
        accountLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        accountLabel.text = "Title"
        accountLabel.textColor = .white
        accountLabel.font = UIFont.boldSystemFont(ofSize: 15)
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        v.backgroundColor = .black
        v.addSubview(accountLabel)
        self.tableView.tableHeaderView = v
        
    }
    
    // MARK: - TalbleView Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let id = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: id)
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: id)
//        }
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegate?.sideMenuEvent(indexPath.row)
    }
}
