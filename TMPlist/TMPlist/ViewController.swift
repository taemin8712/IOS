//
//  ViewController.swift
//  TMPlist
//
//  Created by taemmy on 2021/01/28.
//  Copyright © 2021 tm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func readPlistData(){
        //data.plist read
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)

        let path = paths[0] as NSString
        let plist = path.strings(byAppendingPaths: ["data.plist"])[0]
        let data = NSMutableDictionary(contentsOfFile: plist)

        //parsing
        let name = data?.value(forKey:"이름") as? String
        let age = data?.value(forKey:"나이") as? Int

        if let _name = name {
            print(_name)
        }
        
        if let _age = age {
            print(_age)
        }
        
        data?.setValue("name Change", forKey: "이름")
        data?.setValue("age Change", forKey: "나이")
        

        //데이터 쓰고 저장
        data?.write(toFile: plist, atomically: true)
    }
    //파일에 기본 ** read -> setvalue,readValue -> write&save

}

