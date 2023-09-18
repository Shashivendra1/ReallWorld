//
//  ViewResponseVC.swift
//  RealWorld
//
//  Created by Gurinder Singh on 18/12/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class ViewResponseVC: BaseViewController {

    @IBOutlet weak var noRecordFound: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var user_detailArr : [User_detail]?
    var propertyDesc = ""
    var propId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringArray = propertyDesc.components(separatedBy: CharacterSet.decimalDigits.inverted)
        for item in stringArray {
            if let number = Int(item) {
                print("number: \(number)")
                propId = "\(number)"
            }
        }
        getFavritproperty(PropId : propId)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK: TableView Delagate & data Source
extension ViewResponseVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if user_detailArr?.count ?? 0 > 0 {
            noRecordFound.isHidden = true
        }else{
            noRecordFound.isHidden = false
        }
        return user_detailArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewResponseTableCell", for: indexPath) as! ViewResponseTableCell
        cell.lblName.text = user_detailArr?[indexPath.row].name
        cell.lblEmail.text = user_detailArr?[indexPath.row].email
        cell.lblDate.text = user_detailArr?[indexPath.row].current_date_time
        cell.lblMobile.text = user_detailArr?[indexPath.row].mobile
        return cell
    }
    
    
}
//MARK:- Api Calling
extension ViewResponseVC{
    
    func getFavritproperty(PropId : String) {
  
        let param : [String:Any] = [ "userid" : Singleton.sharedInstance.loginModel?.first?.data?.id ?? "","property_id": PropId ]
        
        ApiManager.apiPostWithoutBase(url: "http://reallworld.com/api/addViewcount", param: param, ref: self) {
            (json, error) in
            
            if error == nil{
                DataHolder.ViewResponseData = try! DataHolder.decoder.decode(ViewResponseModal.self, from: json!)
                self.user_detailArr = DataHolder.ViewResponseData.user_detail
                print(self.user_detailArr)
                self.tableView.reloadData()
                print(error?.localizedDescription ?? "")
            }else {
                guard json != nil else {
                    print("error")
                    return
                }
            }
        }
    }
}
