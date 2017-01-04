//
//  ViewController.swift
//  swiftDemoUIKit
//
//  Created by 哲 on 17/1/2.
//  Copyright © 2017年 XSZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
   
    var pickerView:UIPickerView!
    let width:CGFloat = (UIScreen.main.bounds.size.width / 3.0)
    var addressArray:Array<AnyObject>?
    var cityArray:Array<AnyObject>?
    var areaArray:Array<AnyObject>?
    var pickIndex = 0
    var cityIndex = 0
    var areaIndex = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         self.address()
         self.picker()
    }
    func picker() {
        pickerView = UIPickerView()

        pickerView.frame = CGRect.init(x: 0.0, y: self.view.frame.size.height - 200.0, width: self.view.frame.size.width, height: 200.0)
        pickerView.delegate = self
        pickerView.dataSource = self
        self.view.addSubview(pickerView)
  
    }
   
    func address() {
        
        
        let cityArea011 = ["cityName":"吉林市","cityArea":["丰台区","永吉","蛟河","桦甸","磐石","舒兰"]] as [String : Any]
        let cityArea012 = ["cityName":"长春市","cityArea":["九台市","德惠市","朝阳区","公主岭","农安县","双阳区",]] as [String : Any]
        let cityArea013 = ["cityName":"松原市","cityArea":["乾安县","前郭尔罗斯自治县","扶余县","长岭县","宁江开发区"]] as [String : Any]
        let provinceCity01 = ["provinceName":"吉林省","provinceCity":[cityArea011,cityArea012,cityArea013]] as [String : Any]
        // 辽宁
        let cityArea021 = ["cityName":"沈阳市","cityArea":["梅江区","账号县","分县","刚发县","凤凰县","单身狗县","头哥市"]] as [String : Any]
        let cityArea022 = ["cityName":"大连市","cityArea":["防守县","反倒县","放大","合数"]] as [String : Any]
        let cityArea023 = ["cityName":"铁岭市","cityArea":["但是区","朝阳区","鞍山区","东区","西区","南区","北区"]] as [String : Any]
        let cityArea024 = ["cityName":"鞍山市","cityArea":["朝阳区","回族县","大手大脚市","逗你玩县","你猜县"]] as [String : Any]
        let provinceCity02 = ["provinceName":"辽宁省","provinceCity":[cityArea021,cityArea022,cityArea023,cityArea024]] as [String : Any]
        
        self.addressArray = [provinceCity01 as AnyObject, provinceCity02 as AnyObject]
        
      
        
        
        
           }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 每个选择框的行数
        if 0 == component
        {
            // 第一列
            let count = self.addressArray!.count
            return count
        }
        else if 1 == component
        {
            // 第二列
            let count:NSDictionary = self.addressArray?[pickIndex] as! NSDictionary
            let countCitys :NSArray  = count.object(forKey: "provinceCity") as! NSArray
            return countCitys.count
        }
        else if 2 == component
        {
            // 第三列
            let count:NSDictionary = self.addressArray?[pickIndex] as! NSDictionary
            let countCitys :NSArray  = count.object(forKey: "provinceCity") as! NSArray
            
            let citys:NSDictionary = countCitys[cityIndex] as! NSDictionary
            let countCity :NSArray  = citys.object(forKey: "cityArea") as! NSArray
            
            return countCity.count
          
        }
        
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 每个选择框每行的显示内容
        if 0 == component
        {

            return self.addressArray?[row]["provinceName"] as? String
        }
        else if 1 == component
        {
            let count:NSDictionary = self.addressArray?[pickIndex] as! NSDictionary
            let countCitys :NSArray  = count.object(forKey: "provinceCity") as! NSArray
            
            let citys : NSDictionary = countCitys[row] as! NSDictionary
            return citys.object(forKey: "cityName") as? String
        }
        else if 2 == component
        {
            let count:NSDictionary = self.addressArray?[pickIndex] as! NSDictionary
            let countCitys :NSArray  = count.object(forKey: "provinceCity") as! NSArray
            
            let citys:NSDictionary = countCitys[cityIndex] as! NSDictionary
            let countCity :NSArray  = citys.object(forKey: "cityArea") as! NSArray
            let city : String = countCity[row] as! String
            return city
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        // 每个选择框的行宽
        return width
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let image = UIImage(named:"1")
//        let imageView = UIImageView()
//        imageView.image = image
//        return imageView
//        
//        
//    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 每个选择框每行被选中的值
        print(component, row)
        
        if 0 == component
        {
             pickIndex = row;
            cityIndex = 0;
            areaIndex = 0;
            pickerView.reloadComponent(1)
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            pickerView.selectRow(0, inComponent: 2, animated: true)

        
         
            
        }
        else if 1 == component
        {
            cityIndex = row;
            areaIndex = 0;
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: false)
           
        }
        else if 2 == component
        {
            // 第三列时的行数
          areaIndex = row;
            
         
        }

     
    }
    
    
    
  
    
    
    
    
}
