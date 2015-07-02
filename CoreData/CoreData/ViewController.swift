//
//  ViewController.swift
//  CoreData
//
//  Created by JayWon on 15/7/2.
//  Copyright © 2015年 JayWon. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        
//        var error:NSError?
        
        //创建User对象
        let oneUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as! User
        oneUser.userID = 1
        oneUser.userEmail = "junfei521@126.com"
        oneUser.userPawd = "18500"
        
        
        //保存
        
        /* swift1.2语法 */
//        if(!context.save(&error))
//        {
//            print("不能保存：\(error?.localizedDescription)");
//        }
        
        /* swift2.0语法 */
        do {
            try context.save()
        } catch let error as NSError{
            print("不能保存：\(error.localizedDescription)");
        }

        
        
        //查询
        let fetchRequest:NSFetchRequest = NSFetchRequest()
        fetchRequest.fetchLimit = 10// 限定查询结果的数量
        fetchRequest.fetchOffset = 0// 查询的偏移量
        
        
        let entity:NSEntityDescription? = NSEntityDescription.entityForName("User", inManagedObjectContext: context)
        
        fetchRequest.entity = entity
        
        /* swift1.2语法 */
//        var fetchedObjects:[AnyObject]? = context.executeFetchRequest(fetchRequest, error: &error)
        
        /* swift2.0语法 */
        var fetchedObjects:[AnyObject]?
        do {
            fetchedObjects = try context.executeFetchRequest(fetchRequest)
        } catch _ as NSError {
        }
        
        
        for info:User in fetchedObjects as! [User] {
            
            print("userID = \(info.userID)")
            print("userEmail = \(info.userEmail)")
            print("userPawd = \(info.userPawd)")
            print("++++++++++++++++++++++++++++++++++++++")
        }
        
        print(NSHomeDirectory())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

