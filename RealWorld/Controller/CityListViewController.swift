//
//  CityListViewController.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 11/10/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import UIKit
import Alamofire

protocol PasscityName{
    func passcityAddress(cityName:[String],cityId:[String])
}

class CityListViewController: BaseViewController {
    var passcityName:PasscityName?
    var cityModel : CityModel?
    var cityListArr = [CityData]()
    var idData = [String]()
    var CityName =  [String]()
//    var idData = NSMutableArray()
//    var CityName = NSMutableArray()
    
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCity_API()
        cityTableView.delegate = self
        cityTableView.dataSource = self
        dismissBtn.layer.cornerRadius = 20

    }
    //MARK: submit action button
    @IBAction func submitButton(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.passcityName?.passcityAddress(cityName: self.CityName , cityId: self.idData )
        }
    }

    @IBAction func dismissactionBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func getCity_API() {
        
        let param : [String:Any] = [ : ]
        
        print(param)
        
        ApiManager.apiPost(url:  Api.getCity, param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    self.cityModel = try JSONDecoder().decode(CityModel.self, from: data)
                    
                    if (self.cityModel?.code ?? "") == "200" {
                        self.cityListArr = self.cityModel?.data ?? []
                    }
                    else {
                        
                    }
                }catch  {
                    print("err \(error)")
                }
                self.cityTableView.reloadData()
            }
            
        }
        
    }

}

extension CityListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityListArr.count//cityModel?.data?.count  ?? 0//10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cityTableView.dequeueReusableCell(withIdentifier: "CityPopUpTableViewCell", for: indexPath) as! CityPopUpTableViewCell
        
       // let info = cityModel?.data?[indexPath.row]
        let info = cityListArr[indexPath.row]
//        cell.selectionStyle = .none
        cell.labelName.text = info.cityName//"badre Alam"
       // cell.btnSelected.tag = indexPath.row
        if info.isSelected == "yes" {
            cell.imgCheckMark.image = UIImage(named: "check")
        }else{
            cell.imgCheckMark.image = UIImage(named: "uncheck")

        }
       // cell.btnSelected.addTarget(self, action: #selector(btnSelectedAction(_:)), for: .touchUpInside)
        
        return cell
    }
    
//    @objc func btnSelectedAction (_ sender : UIButton) {
//
//        sender.isSelected = !sender.isSelected
//
//        let indexPath = IndexPath(row: sender.tag, section: 0)
//        let cell = self.cityTableView.cellForRow(at: indexPath) as! CityPopUpTableViewCell
//
//        DispatchQueue.main.async {
//
//            var info = self.cityModel?.data?[sender.tag]
//            if sender.isSelected == true {
//                info?.isSelected = "yes"
//                //sender.setImage(UIImage(named: "check"), for: .normal)
//                cell.imgCheckMark.image = UIImage(named: "check")
//                let citynameVaule = info?.cityName ?? ""
//                let City_idData =  info?.id ?? 0
//
//                self.CityName.append(citynameVaule)
//                self.idData.append(String(City_idData))
//
//            }else{
//                info?.isSelected = "no"
//                self.CityName.remove(at:sender.tag)
//                self.idData.remove(at:sender.tag)
//                cell.imgCheckMark.image = UIImage(named: "uncheck")
//                //sender.setImage(UIImage(named: "uncheck"), for: .normal)
//
//            }
//            // self.cityTableView.reloadData()
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var info = cityListArr[indexPath.row]
        if info.isSelected == "yes"{
            info.isSelected = "no"
            self.cityListArr.remove(at: indexPath.row)
            cityListArr.insert(info, at: indexPath.row)
            let cityname = info.cityName ?? ""
            let id = info.id ?? 0
            if CityName.contains(cityname){
                let index = CityName.firstIndex(of: cityname)
                CityName.remove(at: index!)
                
            }
            if idData.contains(String(id)){
                let index = idData.firstIndex(of: String(id))
                idData.remove(at: index!)
                
            }
            print(CityName)
            print(idData)
//            self.CityName.remove(cityname)
//            self.idData.remove(String(id))


        } else {
            info.isSelected = "yes"
            self.cityListArr.remove(at: indexPath.row)
            cityListArr.insert(info, at: indexPath.row)
            let cityname = info.cityName ?? ""
            let id = info.id ?? 0
            self.idData.append(String(id))
            self.CityName.append(cityname)
        }
        cityTableView.reloadData()
    }
    
   /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {

                cell.accessoryType = .none
                CityName.remove(at:indexPath.row)
                idData.remove(at:indexPath.row)

   
//                let citynameVaule =  cityModel?.data?[indexPath.row].cityName ?? ""
//                let City_idData =  cityModel?.data?[indexPath.row].id ?? 0
//
//                CityName.append(citynameVaule) // set city_name
//                idData.append(String(City_idData)) // set city_Id

                
                
            } else {
                cell.accessoryType = .checkmark
          
                let citynameVaule = cityModel?.data?[indexPath.row].cityName ?? ""
                let City_idData =  cityModel?.data?[indexPath.row].id ?? 0

                CityName.append(citynameVaule) // set city_name
                idData.append(String(City_idData)) // set city_Id

            }
            }
        
    }
    */

}
