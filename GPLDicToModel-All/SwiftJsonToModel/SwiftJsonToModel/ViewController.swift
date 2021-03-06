//
//  ViewController.swift
//  SwiftJsonToModel
//
//  Created by GPL on 2017/11/10.
//  Copyright © 2017年 GPL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let req: UserInfoRequest = UserInfoRequest()
        req.initWithBlock(success: { (req) in
            let resData:UserInfoResponceData = req.resopnse.data as! UserInfoResponceData
            print("code = \(req.resopnse.error),token =\(resData.blog)")
            let count:Int = resData.projectListCell.count
            for i in 0..<count {
                let cell:ProjectListCell = resData.projectListCell[i]
                print("\ncomment = \(cell.comment) \nid = \(cell.projectId) \nname = \(cell.name) \nurl = \(cell.url)\n")
            }
        }) { (req) in
            print("错误\(req.resopnse.error)")
        }
        req.requestParm = ["name":"yanzhenjie" as AnyObject,"pwd":"123" as AnyObject]
        HttpServiceEngine.shareInstance.asyncGetRequest(req: req)
//        self.func1()
        self.func2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func func1(){
        
        let dict = ["age":24,
                    "name":"阿花",
                    "sex":true,
                    "code":["英语","java","php","swift"],
                    "class":["classId":110,"className":"12年级","infoTest":["infoId":25,"infoName":"花花"]],
                    "school":[["schoolId":10000,
                              "schoolName":"牛逼小学"],
                              ["schoolId":10001,
                               "schoolName":"牛逼大学"]],
                    ] as [String : AnyObject]
        let teacher:TeacherModel = TeacherModel.objectWithKeyValues(keyValues: dict) as! TeacherModel
        
        
        print("age = \(teacher.age) "+"name = \(teacher.name) "+"sex = \(teacher.sex) "+"coding = \(teacher.coding) "+"classId = \(teacher.classModel.classId) "+"className = \(teacher.classModel.className)"+"infoId = \(teacher.classModel.infoTestModel.infoId) "+"infoName=\(teacher.classModel.infoTestModel.infoName) ")
        
        
        let c:Int = teacher.schoolModel.count
        for i in 0 ..< c {
            let sm:SchoolModel = teacher.schoolModel[i]
            print("\(sm.schoolId) "+"\(sm.schoolName)")
        }
    }

    func func2(){
        let dict = [["age":24,
                     "name":"阿花",
                     "sex":true,
                     "code":["英语","java","php","swift"],
                     "class":["classId":110,"className":"12年级","infoTest":["infoId":25,"infoName":"花花"]],
                     "school":[["schoolId":10000,
                                "schoolName":"牛逼小学"],
                               ["schoolId":10001,
                                "schoolName":"牛逼大学"]],
                     ],
                    ["age":25,
                     "name":"阿龙",
                     "sex":false,
                     "code":["英语","java","php","swift"],
                     "class":["classId":110,"className":"12年级","infoTest":["infoId":26,"infoName":"花花"]],
                     "school":[["schoolId":10000,
                                "schoolName":"牛逼小学"],
                               ["schoolId":10001,
                                "schoolName":"牛逼大学"]]],
                    ]
        
        let teacherArr:Array = TeacherModel.objectArrayForModelArr(dict)
        let c = teacherArr.count
        for i in 0 ..< c {
            let teacher = teacherArr[i]
            print("age = \(teacher.age) "+"name = \(teacher.name) "+"sex = \(teacher.sex) "+"coding = \(teacher.coding) "+"classId = \(teacher.classModel.classId) "+"className = \(teacher.classModel.className)"+"infoId = \(teacher.classModel.infoTestModel.infoId) "+"infoName=\(teacher.classModel.infoTestModel.infoName) ")
        }
    }

}


