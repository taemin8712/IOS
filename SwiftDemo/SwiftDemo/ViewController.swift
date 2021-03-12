
//
//  ViewController.swift
//  SwiftDemo
//
//  Created by taemmy on 2020/08/25.
//  Copyright © 2020 tm. All rights reserved.
//

import UIKit


let cellheight : CGFloat = 100.0

class ViewController: UIViewController {
    
    @IBOutlet weak var m_TVNames: UITableView!
    @IBOutlet weak var sidemenuVW: UIView!
    @IBOutlet weak var rightSideMenuVW: UIView!
    
    var isShowLeftMenu : Bool = false
    
    
    
    /*
     UIStoryboard *sb = [UIStoryboard storyboardWithName:@"CustomView" bundle:nil];
     Company100ViewController * vc = (Company100ViewController *)[sb instantiateViewControllerWithIdentifier:@"vc-identifier"];
     
     **/
    
    //    var rightSideMenu = RightSideMenuController.init(nibName: "RightSideMenuController", bundle: nil)
    //    var sideMenu = SideMenuController.init(nibName: <#T##String?#>, bundle: <#T##Bundle?#>)
    //    var m_nameDemo = ["TableVIew with CustomCell"]
    
    
    
    
    
    var m_nameGroupDeome = ["First", "Second", "Third"]
    var m_nameDataDemo = [["TableView with Custom", "---"], ["Second Time Demo", "---"], ["Third Time Demo", "---"] ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setNavigationBar()
        setSideMenu()
        m_TVNames.delegate = self
        m_TVNames.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    // MARK: -setSideMenu
    func setSideMenu(){
        let custom_st = UIStoryboard(name: "CustomView", bundle: nil)
        let LsideMenu = custom_st.instantiateViewController(identifier: "side_vw") as! SideMenuController
        LsideMenu.m_menuList = ["Menu 1", "Menu 2", "Menu 3"]
        
        let RsideMenu =  RightSideMenuController()
        RsideMenu.m_menuList = ["Menu 1", "Menu 2", "Menu 3"]
        
        sidemenuVW.frame = CGRect(x: -sidemenuVW.frame.width, y: 74, width: sidemenuVW.frame.width, height: sidemenuVW.frame.height)
        rightSideMenuVW.frame = CGRect(x: self.view.frame.width + rightSideMenuVW.frame.width, y: 74, width: rightSideMenuVW.frame.width, height: rightSideMenuVW.frame.height)
        
        
        sidemenuVW.addSubview(LsideMenu.view)
        rightSideMenuVW.addSubview(RsideMenu.view)
        addChild(LsideMenu)
        addChild(RsideMenu)
    }
    // MARK: - NavigationBar
    
    func setNavigationBar(){
        let naviVW = UIView(frame: CGRect(x: 0.0, y: 30.0, width:view.frame.width, height: 44.0))
        naviVW.backgroundColor = .systemBlue
        
        let naviLeftBtn = UIButton(frame: CGRect(x: 10.0, y: 2.0, width: 40.0, height: 40.0))
        naviLeftBtn.backgroundColor = .gray
        naviLeftBtn.addTarget(self, action: #selector(onBtnNaviLeft(_:)), for: .touchUpInside)
        
        naviVW.addSubview(naviLeftBtn)
        self.view.addSubview(naviVW)
    }
    @objc func onBtnNaviLeft(_ sender : Any) {
        print("Button Event")
        let leftVW = self.children[0] as! SideMenuController
        leftVW.isShowing(isShow: isShowLeftMenu, showView: sidemenuVW)
        isShowLeftMenu = !isShowLeftMenu
    }
}



// MARK: - TableView
extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return m_nameDataDemo[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellheight
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = m_TVNames.dequeueReusableCell(withIdentifier: "nameCell") as! CustomTVC
        //        let name = m_nameDemo[indexPath.row]
        let name = m_nameDataDemo[indexPath.section][indexPath.row]
        
        cell.m_vwCell.layer.cornerRadius  = cell.m_vwCell.frame.height / 4
        cell.m_vwCell.backgroundColor = .darkGray
        cell.m_lblName.text = name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    
    // MARK: - TableView Header
    func numberOfSections(in tableView: UITableView) -> Int {
        return m_nameGroupDeome.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 20.0))
        
        header.backgroundColor = .black
        
        let m_lblsectionTitle = UILabel(frame: header.bounds)
        let title = m_nameGroupDeome[section]
        
        
        m_lblsectionTitle.text = title
        m_lblsectionTitle.textColor = .white
        
        header.addSubview(m_lblsectionTitle)
        
        //        https://api.opendota.com/api/herostats
        
        
        return header
        
    }
}


/*
 func viewWillLayoutSubviews(){
 
 }
 func viewDidLayoutSubviews(){
 
 }
 */
