//
//  FilterViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 14/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

enum Filter {
    
    case highToLow
    case lowToHigh
    case latestDate
    case alphabeticOrder
    
}

protocol FilterDelegate : class {
    
    func filterWith(param : [String:Any])
    
}
var selectedIndex = 0
var propertyarray : [String] = []
var filterArr : [String] = []
var filtercommercialProperty = ["All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"]
var filterType = [ "All Properties" , "Residential Properties" , "Commercial Properties" , "Rent" , "Sale" , "Price High to Low" , "Price Low to High" , "Latest Date" , "Alphabetic Order" ]

var filterTypeSend = [ "All Properties" , "Residential Properties" , "Commercial Properties" , "Rent" , "Sale" , "Price High to Low" , "Price Low to High" , "Latest Date" , "Alphabetic Order" ]
import UIKit

class FilterViewController: UIViewController {
    
    
    @IBOutlet weak var filter_tableView: UITableView!
    
    
    var filter : Filter = .highToLow
    weak var delegate : FilterDelegate?
    
  
    
  
    
    var filterParam : [String:Any] =  [ "orderby" : "" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        filter_tableView.delegate = self
        filter_tableView.dataSource = self
        
   }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Setup Home Page Properties", bgColor: .black, barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
    }
    
    @IBAction func btnCancelAction(_ sender: Any) {
        if propertyarray.count > 0 {
            self.navigationController?.popViewController(animated: true)
        }else{
            let str = filterTypeSend.joined(separator: "")
            self.filterParam.updateValue(str, forKey: "orderby")
            
            self.delegate?.filterWith(param: self.filterParam)
            self.navigationController?.popViewController(animated: true)
        }
       
    }
    
    @IBAction func tap_submit_btn(_ sender: Any) {
        
//        var newArray : [String] = []
//
//        for index in 0..<self.filterType.count {
//
//            if isSelected[index] {
//
//                newArray.append(self.filterTypeSend[index])
//            }
//
//        }
          if propertyarray.count == 0
          {
            let alert = UIAlertController(title: "Alert", message: "please Choose property", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else
        
          {
            var str = propertyarray.joined(separator: ",")

           
            let replacedvalue = str.replacingOccurrences(of:",",with:", ")
            var value = replacedvalue
            print(value)
            if (value == "Alphabetic Order")
            {
                value =  "Latest DateIn Alphabetic Order"

            }


                   
                   self.filterParam.updateValue(value, forKey: "orderby")
                   
                   self.delegate?.filterWith(param: self.filterParam)
                   
                   self.navigationController?.popViewController(animated: true)
        }
        
       
        
        
    }
    
    
  

}
extension FilterViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.filter_tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell") as! FilterTableViewCell
        
        cell.filter_label.text = filterType[indexPath.row]
      
        if propertyarray.contains(filterType[indexPath.row])
         {
            cell.icon_imageView.image = UIImage(named: "check")
        }
        else
        {
            cell.icon_imageView.image = UIImage(named: "uncheck")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let objectToRemove = filterType[indexPath.row]
        print(objectToRemove)
        
        if indexPath.row == 0{
            if propertyarray.count == 0{
                propertyarray.append(contentsOf: filterType)
                // filterArr.append(contentsOf: propertyarray)
                self.filter_tableView.reloadData()
            }
            else{
                propertyarray.removeAll()
                self.filter_tableView.reloadData()
            }
        }
        else{
            print(filterType[indexPath.row])
            if propertyarray.contains(filterType[indexPath.row]){
                if let index = propertyarray.firstIndex(of: objectToRemove) {
                    propertyarray.remove(at: index)
                }
                self.filter_tableView.reloadData()
            }
            else{
                propertyarray.append(filterType[indexPath.row])
                self.filter_tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    
        return UIView()
    }
    
}
