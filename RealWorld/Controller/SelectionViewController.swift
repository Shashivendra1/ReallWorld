//
//  SelectionViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 11/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

var propertyaray : [String] = []
var bedRoomSelectionBuy = [String]()
var bedRoomSelectionRent = [String]()
var floorSelectionBuy = [String]()
var floorSelectionRent = [String]()
var PropertySelectionBuy = [String]()
var PropertySelectionRent = [String]()
var PropertySelectioncommBuy = [String]()
var PropertySelectioncommRent = [String]()
var floorSelectioncomBuy = [String]()
var floorSelectioncomRent = [String]()




var apartment_Array = ["All","Apartment" , "Service Apartment" , "Builder floor" , "Plot/Land" , "House/Villa" , "Farmhouse" ]
var apartment_Array2 = ["Office Space","Co-working Office", "Commercial Lands/Plots", "Hotel/Resorts", "Guest-House/Banquet-Halls", "Shop/Showroom", "Industrial land", "Agriculture/Farmland", "Factory", "Warehouse"]
var room_Array = ["All","1  Room/Studio Apartment","1 Bhk","2 Bhk","3 Bhk","4 Bhk","5 Bhk","5+ Bhk" ]

// var room_Array = [ "1 Room/Studio Apartment" , "1  Bhk" , "2 Bhk" , "3 Bhk" , "4 Bhk" , "5 Bhk" , "5+ Bhk" ]

var area_Array = [ "Sq.ft" , "Sq.yards" , "Sq.meter" , "Acres" , "Marla" , "Cents" , "Bigha" , "Kotha" , "Grounds" , "Hectare" ]

var floor_Array = ["All","Basement","Ground","Lower Ground","Duplex","Bungalow","1","2","3","4","5","6","7","8" ,"9","10","11","12","14","15","16","17","18","19","20"]

var floor_Arraycount = ["All","Basement","Ground","Lower Ground","Duplex","Entire Building","1","2","3","4","5","6","7","8" ,"9","10","11","12","14","15","16","17","18","19","20"]
var commercialPropertycount = ["All","Office Space", "Co-working Office","Commercial Lands/Plots","Hotel/Resorts","Guest-House/Banquet-Halls","Shop/Showroom","Industrial land","Agriculture/Farmland","Factory","Warehouse"]
protocol SelectedItem : class {
    
    func selectItem(value : String, index : Int)
    
}

enum FieldType {
    
    case propertyType
    case sqFeet
    case bedRoom
    case commercialPropfloor
    case floor
    case furnished
    case image
    case commercialProp
    
    
}


class SelectionViewController: UIViewController {
    
    @IBOutlet weak var list_tableView: UITableView!
    
    weak var delegate : SelectedItem?
    
    var type = ""
    var comesFromBuy = true
    var selctionType : FieldType = .propertyType
    var arry = [String]()
    
    
    var isChecked = [ false , false , false , false , false , false ,  false , false , false , false , false , false, false , false , false , false , false , false ,  false , false , false , false , false , false, false , false , false , false , false , false ,  false , false , false , false , false , false  ]
    
    var selection = 0
    var data_array : [String] = []
    var openFromProperty = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list_tableView.delegate = self
        list_tableView.dataSource = self
        
        switch selctionType {
            
        case .bedRoom:
            UserDefaults.standard.set("bedbuy", forKey: "popup")
            
            data_array = room_Array
            if let value =  UserDefaults.standard.value(forKey:"bedRoomSelectionBuy1") as? [String] {
                bedRoomSelectionBuy = value
            }
            if let value1 =  UserDefaults.standard.value(forKey:"bedRoomSelectionRent1") as? [String] {
                bedRoomSelectionRent = value1
            }
            
            
            selection = 1
            
        case .propertyType:
            UserDefaults.standard.set("propertybuy", forKey: "popup")
            
            data_array = apartment_Array
            if let value =  UserDefaults.standard.value(forKey:"PropertySelectionBuy1") as? [String] {
                PropertySelectionBuy = value
            }
            if let value1 =  UserDefaults.standard.value(forKey:"PropertySelectionRent1") as? [String] {
                PropertySelectionRent = value1
            }
            selection = 0
            
        case .sqFeet:
            
            data_array = area_Array
            
            selection = 2
            
        case .floor:
            UserDefaults.standard.set("floorbuy", forKey: "popup")
            
            selection = 3
            data_array = floor_Array
            if let value =  UserDefaults.standard.value(forKey:"floorSelectionBuy1") as? [String] {
                floorSelectionBuy = value
            }
            if let value1 =  UserDefaults.standard.value(forKey:"floorSelectionRent1") as? [String] {
                floorSelectionRent = value1
            }
            
            
            
        case .commercialProp:
            UserDefaults.standard.set("commprop", forKey: "popup")
            
            selection = 4
            data_array = commercialPropertycount
            if let value =  UserDefaults.standard.value(forKey:"PropertySelectioncommBuy1") as? [String] {
                PropertySelectioncommBuy = value
            }
            if let value1 =  UserDefaults.standard.value(forKey:"PropertySelectioncommRent1") as? [String] {
                PropertySelectioncommRent = value1
            }
            
            
        case .commercialPropfloor:
            UserDefaults.standard.set("commfloor", forKey: "popup")
            
            selection = 5
            data_array = floor_Arraycount
            if let value =  UserDefaults.standard.value(forKey:"floorSelectioncomBuy1") as? [String] {
                floorSelectioncomBuy = value
            }
            if let value1 =  UserDefaults.standard.value(forKey:"floorSelectioncomRent1") as? [String] {
                floorSelectioncomRent = value1
            }
            
            
        case .furnished:
            
            print("furnished")
            
        case .image:
            
            print("images")
            
            
        }
        
        if comesFromBuy == true{
            switch selctionType {
                
            case .bedRoom:
                propertyaray = bedRoomSelectionBuy
                UserDefaults.standard.set("bedbuy", forKey: "popup")
                if let value =  UserDefaults.standard.value(forKey:"bedRoomSelectionBuy1") as? [String] {
                    bedRoomSelectionBuy = value
                }
                
                
                // data_array = propertyaray
            case .propertyType:
                UserDefaults.standard.set("propertybuy", forKey: "popup")
                propertyaray = PropertySelectionBuy
                
                if let value =  UserDefaults.standard.value(forKey:"PropertySelectionBuy1") as? [String] {
                    PropertySelectionBuy = value
                }
                // PropertySelectionBuy = (UserDefaults.standard.value(forKey: "PropertySelectionBuy1")) as! [String]
                
                
            case .sqFeet:
                
                propertyaray = area_Array
                
            case .floor:
                UserDefaults.standard.set("floorbuy", forKey: "popup")
                
                propertyaray = floorSelectionBuy
                if let value =  UserDefaults.standard.value(forKey:"floorSelectionBuy1") as? [String] {
                    floorSelectionBuy = value
                }
                //  data_array = propertyaray
                
            case .commercialProp:
                
                UserDefaults.standard.set("commpropbuy", forKey: "popup")
                
                propertyaray = PropertySelectioncommBuy
                if let value =  UserDefaults.standard.value(forKey:"PropertySelectioncommBuy1") as? [String] {
                    PropertySelectioncommBuy = value
                }
                
                
            case .commercialPropfloor:
                UserDefaults.standard.set("commfloorbuy", forKey: "popup")
                
                
                propertyaray = floorSelectioncomBuy
                if let value =  UserDefaults.standard.value(forKey:"floorSelectioncomBuy1") as? [String] {
                    floorSelectioncomBuy = value
                }
                
            case .furnished:
                break
                // return 0
            case .image:
                
                break
            }
        }else{
            switch selctionType {
                
            case .bedRoom:
                UserDefaults.standard.set("bedrent", forKey: "popup")
                propertyaray = bedRoomSelectionRent
                if let value =  UserDefaults.standard.value(forKey:"bedRoomSelectionRent1") as? [String] {
                    bedRoomSelectionRent = value
                }
                // data_array = propertyaray
            case .propertyType:
                UserDefaults.standard.set("propertyrent", forKey: "popup")
                propertyaray = PropertySelectionRent
                if let value =  UserDefaults.standard.value(forKey:"PropertySelectionRent1") as? [String] {
                    PropertySelectionRent = value
                }
                
            case .sqFeet:
                
                propertyaray = area_Array
                
            case .floor:
                UserDefaults.standard.set("floorrent", forKey: "popup")
                
                
                propertyaray = floorSelectionRent
                if let value =  UserDefaults.standard.value(forKey:"floorSelectionRent1") as? [String] {
                    floorSelectionRent = value
                }
                
                
                //  data_array = propertyaray
                
            case .commercialProp:
                
                UserDefaults.standard.set("commproprent", forKey: "popup")
                
                propertyaray = PropertySelectioncommRent
                if let value =  UserDefaults.standard.value(forKey:"PropertySelectioncommRent1") as? [String] {
                    PropertySelectioncommRent = value
                }
                
                
            case .commercialPropfloor:
                UserDefaults.standard.set("commfloorrent", forKey: "popup")
                
                propertyaray = floorSelectioncomRent
                if let value =  UserDefaults.standard.value(forKey:"floorSelectioncomRent1") as? [String] {
                    floorSelectioncomRent = value
                }
            case .furnished:
                break
                // return 0
            case .image:
                
                break
            }
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    @IBAction func tap_Back_Btn_Action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tap_Cancel_Btn_Action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tap_ok_btn(_ sender: Any) {
        
        navigationController?.popViewControllerWithHandler(animated: true, completion: {
            
            var arr : [String] = []
            if propertyaray.contains("All"){
                arr.append("All")
            }
            else if propertyarray.contains(""){
                arr.append("")
            }
            else
            {
                for i in 0..<propertyaray.count {
                    
                    arr.append(propertyaray[i])
                    
                }
            }
            var str = ""
            
            str = arr.map { String($0) }
                .joined(separator: ", ")
            let trimmedString = str.replacingOccurrences(of: " ", with: "")
            
            if(UserDefaults.standard.value(forKey: "popup"))as? String == "propertybuy"
            {
                UserDefaults.standard.set(propertyaray, forKey: "PropertySelectionBuy1")
            }
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "bedbuy"
            {
                UserDefaults.standard.set(propertyaray, forKey: "bedRoomSelectionBuy1")
            }
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "propertyrent"
            {
                UserDefaults.standard.set(propertyaray, forKey: "PropertySelectionRent1")
            }
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "bedrent"
            {
                UserDefaults.standard.set(propertyaray, forKey: "bedRoomSelectionRent1")
            }
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "floorbuy"
            {
                UserDefaults.standard.set(propertyaray, forKey: "floorSelectionBuy1")
            }
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "floorrent"
            {
                UserDefaults.standard.set(propertyaray, forKey: "floorSelectionRent1")
            }
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "commfloorbuy"
            {
                UserDefaults.standard.set(propertyaray, forKey: "floorSelectioncomBuy1")
            }
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "commfloorrent"
            {
                UserDefaults.standard.set(propertyaray, forKey: "floorSelectioncomRent1")
            }
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "commproprent"
            {
                UserDefaults.standard.set(propertyaray, forKey: "PropertySelectioncommRent1")
            }
            
            else if(UserDefaults.standard.value(forKey: "popup"))as? String == "commpropbuy"
            {
                UserDefaults.standard.set(propertyaray, forKey: "PropertySelectioncommBuy1")
            }
            
            
            self.delegate?.selectItem(value: str, index: self.selection)
            
            
        })
    }
    
}
extension SelectionViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selctionType {
            
        case .bedRoom:
            
            return room_Array.count
            
        case .propertyType:
            
            return apartment_Array.count
            
        case .sqFeet:
            
            return area_Array.count
            
        case .floor:
            
            return floor_Array.count
            
        case .commercialProp:
            
            return commercialPropertycount.count
            
        case .commercialPropfloor:
            
            return floor_Arraycount.count
        case .furnished:
            
            return 0
        case .image:
            
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.list_tableView.dequeueReusableCell(withIdentifier: "SelectionTableViewCell") as! SelectionTableViewCell
        if data_array.count > 0{
            cell.data_label.text = data_array[indexPath.row]
            print(cell.data_label.text as Any)
        }
        
        
        
        
        
        
        
        if propertyaray.contains(data_array[indexPath.row]) {
            UserDefaults.standard.set(data_array, forKey: "prop")
            
            
            
            cell.checkBox_btn.setImage(UIImage(named: "check"), for: .normal)
        }
        else {
            
            cell.checkBox_btn.setImage(UIImage(named: "uncheck"), for: .normal)
        }
        
        cell.checkBox_btn.tag = indexPath.row
        cell.checkBox_btn.addTarget(self, action: #selector(tap_chkboxbtn), for: .touchUpInside)
        //        switch selctionType {
        //
        //               case .bedRoom:
        //
        //                propertyaray = room_Array
        //
        //               case .propertyType:
        //
        //                propertyaray = apartment_Array
        //
        //               case .sqFeet:
        //
        //                 propertyaray = area_Array
        //
        //               case .floor:
        //
        //                 propertyaray = floor_Array
        //
        //               case .commercialProp:
        //
        //               propertyaray = commercialPropertycount
        //
        //                 case .commercialPropfloor:
        //
        //                 propertyaray = floor_Arraycount
        //               case .furnished:
        //                 break
        //                // return 0
        //               case .image:
        //
        //                 break
        //             }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    @objc func tap_chkboxbtn(sender : UIButton)
    {
        
        let objectToRemove = data_array[sender.tag]
        print(objectToRemove)
        
        
        if sender.tag == 0{
            if propertyaray.count == 0{
                propertyaray.append(contentsOf: data_array)
                if comesFromBuy == true{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        data_array = bedRoomSelectionBuy
                        
                    case .propertyType:
                        PropertySelectionBuy.append(contentsOf: propertyaray)
                        data_array = PropertySelectionBuy
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionBuy.append(contentsOf: propertyaray)
                        data_array = floorSelectionBuy
                    case .commercialProp:
                        PropertySelectioncommBuy.append(contentsOf: propertyaray)
                        data_array = PropertySelectioncommBuy
                        //  propertyaray = commercialPropertycount
                        
                    case .commercialPropfloor:
                        
                        floorSelectioncomBuy.append(contentsOf: propertyaray)
                        data_array = floorSelectioncomBuy                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }else{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        bedRoomSelectionRent.append(contentsOf: propertyaray)
                        data_array = bedRoomSelectionRent
                        
                    case .propertyType:
                        PropertySelectionRent.append(contentsOf: propertyaray)
                        data_array = PropertySelectionRent
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionRent.append(contentsOf: propertyaray)
                        data_array = floorSelectionRent
                    case .commercialProp:
                        PropertySelectioncommRent.append(contentsOf: propertyaray)
                        data_array = PropertySelectioncommRent
                        // propertyaray = commercialPropertycount
                        
                    case .commercialPropfloor:
                        floorSelectioncomRent.append(contentsOf: propertyaray)
                        data_array = floorSelectioncomRent
                        //   propertyaray = floor_Arraycount
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }
                
                //   UserDefaults.standard.set(propertyaray, forKey: "propArr")
                // filterArr.append(contentsOf: propertyaray)
                self.list_tableView.reloadData()
            }else{
                propertyaray.removeAll()
                
                if comesFromBuy == true{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        bedRoomSelectionBuy.removeAll()
                        
                    case .propertyType:
                        PropertySelectionBuy.removeAll()
                        //propertyaray = apartment_Array
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionBuy.removeAll()
                        
                    case .commercialProp:
                        PropertySelectioncommBuy.removeAll()
                        
                        //                                    propertyaray = commercialPropertycount
                        
                    case .commercialPropfloor:
                        
                        floorSelectioncomBuy.removeAll()
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }else{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        bedRoomSelectionRent.removeAll()
                        
                    case .propertyType:
                        PropertySelectionRent.removeAll()
                        // propertyaray = apartment_Array
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionRent.removeAll()
                        
                    case .commercialProp:
                        
                        //propertyaray = commercialPropertycount
                        PropertySelectioncommRent.removeAll()
                        
                        
                    case .commercialPropfloor:
                        
                        floorSelectioncomRent.removeAll()
                        
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }
                
                
                //  propertyaray.append(contentsOf: filterType)
                
                self.list_tableView.reloadData()
                
            }
        }
        else
        {
            //  print(data_array[indexPath.row])
            if propertyaray.contains(data_array[sender.tag])
            {
                if comesFromBuy == true{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        // bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .propertyType:
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        //  propertyaray = apartment_Array
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        //  floorSelectionBuy.append(contentsOf: propertyaray)
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .commercialProp:
                        
                        //propertyaray = commercialPropertycount
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .commercialPropfloor:
                        
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                    case .furnished:
                        
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }else{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        // bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .propertyType:
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        //  propertyaray = apartment_Array
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        //  floorSelectionBuy.append(contentsOf: propertyaray)
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .commercialProp:
                        
                        //propertyaray = commercialPropertycount
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .commercialPropfloor:
                        
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }
                
                
                
                self.list_tableView.reloadData()
                
                
                
            }
            else
            {
                propertyaray.append(data_array[sender.tag])
                if comesFromBuy == true{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        // bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        bedRoomSelectionBuy = propertyaray
                        UserDefaults.standard.set(bedRoomSelectionBuy, forKey: "bedRoomSelectionBuy1")
                        
                        
                    case .propertyType:
                        
                        PropertySelectionBuy = propertyaray
                        
                        UserDefaults.standard.set(PropertySelectionBuy, forKey: "PropertySelectionBuy1")
                        
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionBuy = propertyaray
                        
                        UserDefaults.standard.set(floorSelectionBuy, forKey: "floorSelectionBuy1")
                        
                        
                    case .commercialProp:
                        
                        PropertySelectioncommBuy = propertyaray
                        
                        UserDefaults.standard.set(PropertySelectioncommBuy, forKey: "PropertySelectioncommBuy1")
                        
                        
                        
                        
                    case .commercialPropfloor:
                        
                        floorSelectioncomBuy = propertyaray
                        
                        UserDefaults.standard.set(floorSelectioncomBuy, forKey: "floorSelectioncomBuy1")
                        
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }else{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        // bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        bedRoomSelectionRent = propertyaray
                        UserDefaults.standard.set(bedRoomSelectionRent, forKey: "bedRoomSelectionRent1")
                        
                        
                    case .propertyType:
                        
                        PropertySelectionRent = propertyaray
                        
                        UserDefaults.standard.set(PropertySelectionRent, forKey: "PropertySelectionRent1")
                        
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionRent = propertyaray
                        
                        UserDefaults.standard.set(floorSelectionRent, forKey: "floorSelectionRent1")
                        
                    case .commercialProp:
                        
                        PropertySelectioncommRent =  propertyaray
                        
                        UserDefaults.standard.set(PropertySelectioncommRent, forKey: "PropertySelectioncommRent1")
                        
                        
                        
                        
                        
                    case .commercialPropfloor:
                        floorSelectioncomRent = propertyaray
                        
                        UserDefaults.standard.set(floorSelectioncomRent, forKey: "floorSelectioncomRent1")
                        
                        
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }
                
                self.list_tableView.reloadData()
                
                
            }
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let objectToRemove = data_array[indexPath.row]
        print(objectToRemove)
        
        
        if indexPath.row == 0{
            if propertyaray.count == 0{
                propertyaray.append(contentsOf: data_array)
                if comesFromBuy == true{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        data_array = bedRoomSelectionBuy
                        
                    case .propertyType:
                        PropertySelectionBuy.append(contentsOf: propertyaray)
                        data_array = PropertySelectionBuy
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionBuy.append(contentsOf: propertyaray)
                        data_array = floorSelectionBuy
                    case .commercialProp:
                        PropertySelectioncommBuy.append(contentsOf: propertyaray)
                        data_array = PropertySelectioncommBuy
                        //  propertyaray = commercialPropertycount
                        
                    case .commercialPropfloor:
                        
                        floorSelectioncomBuy.append(contentsOf: propertyaray)
                        data_array = floorSelectioncomBuy                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }else{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        bedRoomSelectionRent.append(contentsOf: propertyaray)
                        data_array = bedRoomSelectionRent
                        
                    case .propertyType:
                        PropertySelectionRent.append(contentsOf: propertyaray)
                        data_array = PropertySelectionRent
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionRent.append(contentsOf: propertyaray)
                        data_array = floorSelectionRent
                    case .commercialProp:
                        PropertySelectioncommRent.append(contentsOf: propertyaray)
                        data_array = PropertySelectioncommRent
                        // propertyaray = commercialPropertycount
                        
                    case .commercialPropfloor:
                        floorSelectioncomRent.append(contentsOf: propertyaray)
                        data_array = floorSelectioncomRent
                        //  propertyaray = floor_Arraycount
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }
                
                //   UserDefaults.standard.set(propertyaray, forKey: "propArr")
                // filterArr.append(contentsOf: propertyaray)
                self.list_tableView.reloadData()
            }else{
                propertyaray.removeAll()
                
                if comesFromBuy == true{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        bedRoomSelectionBuy.removeAll()
                        
                    case .propertyType:
                        PropertySelectionBuy.removeAll()
                        //propertyaray = apartment_Array
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionBuy.removeAll()
                        
                    case .commercialProp:
                        PropertySelectioncommBuy.removeAll()
                        
                        //                                    propertyaray = commercialPropertycount
                        
                    case .commercialPropfloor:
                        
                        floorSelectioncomBuy.removeAll()
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }else{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        bedRoomSelectionRent.removeAll()
                        
                    case .propertyType:
                        PropertySelectionRent.removeAll()
                        // propertyaray = apartment_Array
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionRent.removeAll()
                        
                    case .commercialProp:
                        
                        //propertyaray = commercialPropertycount
                        PropertySelectioncommRent.removeAll()
                        
                        
                    case .commercialPropfloor:
                        
                        floorSelectioncomRent.removeAll()
                        
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }
                
                
                //  propertyaray.append(contentsOf: filterType)
                
                self.list_tableView.reloadData()
                
            }
        }
        else
        {
            print(data_array[indexPath.row])
            if propertyaray.contains(data_array[indexPath.row])
            {
                if comesFromBuy == true{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        // bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .propertyType:
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        //  propertyaray = apartment_Array
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        //  floorSelectionBuy.append(contentsOf: propertyaray)
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .commercialProp:
                        
                        //propertyaray = commercialPropertycount
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .commercialPropfloor:
                        
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                    case .furnished:
                        
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }else{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        // bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .propertyType:
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        //  propertyaray = apartment_Array
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        //  floorSelectionBuy.append(contentsOf: propertyaray)
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .commercialProp:
                        
                        //propertyaray = commercialPropertycount
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }
                        
                    case .commercialPropfloor:
                        
                        if let index = propertyaray.firstIndex(of: objectToRemove) {
                            propertyaray.remove(at: index)
                        }                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }
                
                
                
                self.list_tableView.reloadData()
                
                
                
            }
            else
            {
                propertyaray.append(data_array[indexPath.row])
                if comesFromBuy == true{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        // bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        bedRoomSelectionBuy = propertyaray
                        UserDefaults.standard.set(bedRoomSelectionBuy, forKey: "bedRoomSelectionBuy1")
                        
                        
                    case .propertyType:
                        
                        PropertySelectionBuy = propertyaray
                        
                        UserDefaults.standard.set(PropertySelectionBuy, forKey: "PropertySelectionBuy1")
                        
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionBuy = propertyaray
                        
                        UserDefaults.standard.set(floorSelectionBuy, forKey: "floorSelectionBuy1")
                        
                        
                    case .commercialProp:
                        
                        PropertySelectioncommBuy = propertyaray
                        
                        UserDefaults.standard.set(PropertySelectioncommBuy, forKey: "PropertySelectioncommBuy1")
                        
                        
                        
                        
                    case .commercialPropfloor:
                        
                        floorSelectioncomBuy = propertyaray
                        
                        UserDefaults.standard.set(floorSelectioncomBuy, forKey: "floorSelectioncomBuy1")
                        
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }else{
                    switch selctionType {
                        
                    case .bedRoom:
                        
                        // bedRoomSelectionBuy.append(contentsOf: propertyaray)
                        bedRoomSelectionRent = propertyaray
                        UserDefaults.standard.set(bedRoomSelectionRent, forKey: "bedRoomSelectionRent1")
                        
                        
                    case .propertyType:
                        
                        PropertySelectionRent = propertyaray
                        
                        UserDefaults.standard.set(PropertySelectionRent, forKey: "PropertySelectionRent1")
                        
                        
                    case .sqFeet:
                        
                        propertyaray = area_Array
                        
                    case .floor:
                        
                        floorSelectionRent = propertyaray
                        
                        UserDefaults.standard.set(floorSelectionRent, forKey: "floorSelectionRent1")
                        
                    case .commercialProp:
                        
                        PropertySelectioncommRent =  propertyaray
                        
                        UserDefaults.standard.set(PropertySelectioncommRent, forKey: "PropertySelectioncommRent1")
                        
                        
                        
                        
                        
                    case .commercialPropfloor:
                        floorSelectioncomRent = propertyaray
                        
                        UserDefaults.standard.set(floorSelectioncomRent, forKey: "floorSelectioncomRent1")
                        
                        
                    case .furnished:
                        break
                        // return 0
                    case .image:
                        
                        break
                    }
                }
                
                self.list_tableView.reloadData()
                
                
            }
            
        }
        
        
        
    }
    
    
}
