//
//  ListViewController.swift
//  HostingUiDemo
//
//  Created by taemmy on 2021/01/19.
//  Copyright © 2021 tm. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController{
    var delegate: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize.height = 250
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = "\(indexPath.row) Option"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectedItem(IndexPath: indexPath)
    }
}
