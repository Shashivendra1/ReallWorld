//
//  SideMenuViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 03/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class SideMenuViewController: BaseViewController {

    @IBOutlet weak var list_tableView: UITableView!
    @IBOutlet weak var back_View: UIView!
    var selectedArray : [IndexPath] = [IndexPath]()
    var postvaluepropertychk:String = ""

    @IBOutlet weak var email_lbl: UILabel!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var labelExpiryDate: UILabel!
    
    var listArray = [ "Home" , "User Property", "User Favourite Property" , "Search Residential Property" , "Search Commercial Property" ,  "Post Residential Property" , "Post Commercial Property" , "Post Tenant Requirement" , "Post Buyer Requirement" ,"Weekly Property Listing", "Mothly Property Listing" , "Hire Top Agent" ,"Buy our Service", "Hire for Legal Paperwork", "Feedback & Suggestions" ,"About Us" , "Contact Us", "Logout" , "Delete Account"]
  
    var listImage_Array = [ UIImage(named: "homeSide") , UIImage(named: "clock")  , UIImage(named: "heart") ,UIImage(named: "search"), UIImage(named: "commercial") ,UIImage(named: "topagent"), UIImage(named: "tennat1x"), UIImage(named: "tennat1x") , UIImage(named: "list"),UIImage(named: "list"), UIImage(named: "topagent"),UIImage(named: "hire1x"),UIImage(named: "search"),UIImage(named: "hire1x"),UIImage(named: "card"),UIImage(named: "arrows"),UIImage(named: "arrows"), UIImage(named: "logout"),UIImage(named: "delete")  ]
    
  var listImage_Array1 = [ UIImage(named: "homepurple1x") , UIImage(named: "clockpurple1x")  ,  UIImage(named: "heart_purple1x") , UIImage(named: "heart_purple1x") , UIImage(named: "searchpurple1x"), UIImage(named: "commercialpurple1x") ,UIImage(named: "postpuple1x"), UIImage(named: "tennatpurple1x"), UIImage(named: "tennatpurple1x") , UIImage(named: "listingpurple1x"),UIImage(named: "listingpurple1x"), UIImage(named: "postpuple1x"),UIImage(named: "hirepurple1x"),UIImage(named: "search"),UIImage(named: "hirepurple1x"),UIImage(named: "cardpurple1x"),UIImage(named: "sendpurple1x"),UIImage(named: "sendpurple1x"), UIImage(named: "logout") , UIImage(named: "delete")]
    
    var isSuccess = false
     var chkvalue = false

    let selectindex : Int? = nil

    var moveNext = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list_tableView.delegate = self
        list_tableView.dataSource = self
        name_lbl.text = "\(Singleton.sharedInstance.loginModel?.first?.data?.name ?? "")"
        labelExpiryDate.text = "\(Singleton.sharedInstance.loginModel?.first?.expiry_date ?? "")"
        email_lbl.text = "\(Singleton.sharedInstance.loginModel?.first?.data?.email ?? "")"

        postvaluepropertychk = "Residential"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func push() {
        
        self.list_tableView.frame.origin.x = -self.list_tableView.frame.width
        self.back_View.isHidden = false
        
        
        UIView.animate(withDuration: 0.3) {
            self.list_tableView.frame.origin.x = 0
            self.back_View.frame.origin.x = 0
        }
        
    }
    
    func pop(vc: UIViewController?){
        
        self.back_View.isHidden = true
        
        UIView.animate(withDuration: 0.3, animations: {
            self.list_tableView.frame.origin.x = -self.list_tableView.frame.width
            self.back_View.frame.origin.x = -self.back_View.frame.width
        }) { (fn) in
            
            if(fn){
                self.tapBackView(vc: vc)
            }
        }
        
    }
    
    @IBAction func tapDismis_Btn(_ sender: UIButton) {
        self.pop(vc: nil)
    }
    
    
    @objc func tapBackView(vc: UIViewController?) {
        
        let transition = CATransition()
        transition.duration = 0.1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        
        if(vc != nil){
            
            self.dismiss(animated: false, completion: {
                self.moveNext.navigationController?.pushViewController(vc!, animated: true)
            })
            
        }else{
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func dismissAlertWithYes() {
        
        logout_API()
        
    }
    
    override func dismissAlert() {
        
        if isSuccess {
            
            let vcs = self.moveNext.navigationController?.viewControllers
            
            if (vcs?.count ?? 0) > 0 {
                
                for vc in vcs! {
                    
                    if vc.isKind(of: CustomSplashViewController.self) {
                        
                        self.dismiss(animated: false, completion: nil)
                        
                        
                        UserDefaults.standard.removeObject(forKey: "UserData")
                        
                        let new = self.moveNext.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                        
                        vc.navigationController?.pushViewController(new, animated: true)
                        
                    }
                }
                
            }
            
        }
        
    }
    
}
extension SideMenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.list_tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell") as! SideMenuTableViewCell
//          bool isSelected = // enter your own code here
//             if (isSelected)
//             {
//                 [cell setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:0.75 alpha:1]];
//                 [cell setAccessibilityTraits:UIAccessibilityTraitSelected];
//             }
        cell.bannernew_image.isHidden = true

        print(chkvalue)
        if(indexPath.row == 9)||(indexPath.row == 10)
        {
            cell.bannernew_image.isHidden = false
            
        }
        else
        {
            cell.bannernew_image.isHidden = true

        }
        if (chkvalue == false) {

            cell.listIcon_imageView.image = listImage_Array[indexPath.row]
            cell.list_label.text! = listArray[indexPath.row]
            cell.list_label.textColor = UIColor.black


        }
      else
       {
            cell.listIcon_imageView.image = listImage_Array1[indexPath.row]
            cell.list_label.text! = listArray[indexPath.row]
            cell.list_label.textColor =  UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1)



        }
        
//        if (chkvalue == true) {
//        if(selectedArray.contains(indexPath))
//        {
//            cell.list_label.textColor = UIColor.red
//             cell.listIcon_imageView.image = listImage_Array1[indexPath.row]
//        }
//else
//        {
//            cell.list_label.textColor = UIColor.black
//             cell.listIcon_imageView.image = listImage_Array[indexPath.row]
//        }
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SideMenuTableViewCell
//        cell.listIcon_imageView.image = listImage_Array[indexPath.row]
        print(chkvalue)
//          if (chkvalue) {
//                if(selectedArray.contains(indexPath))
//                {
//                    cell.list_label.textColor = UIColor.red
//                     cell.listIcon_imageView.image = listImage_Array1[indexPath.row]
//                }
//        else
//                {
//                    cell.list_label.textColor = UIColor.black
//                     cell.listIcon_imageView.image = listImage_Array[indexPath.row]
//                }
//                }

        switch indexPath.row {
            
        case 0:

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController

                vc.comeFrom = .home
                chkvalue = true

            cell.list_label.textColor = UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1)
            cell.listIcon_imageView.image = listImage_Array1[indexPath.row]
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            chkvalue = true
            vc.comeFrom = .user

            cell.list_label.textColor =  UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1)
            cell.listIcon_imageView.image = listImage_Array1[indexPath.row]
            
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            cell.list_label.textColor = UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1)
                                 cell.listIcon_imageView.image = listImage_Array1[indexPath.row]
            vc.comeFrom = .favourite
            chkvalue = true
            cell.list_label.textColor =  UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1)
            cell.listIcon_imageView.image = listImage_Array1[indexPath.row]

            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
  
        
        case 3:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
            vc.searchBy = .residential
            chkvalue = true

            
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)


            
        case 4:
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchComericalVC") as! SearchComericalVC
              vc.searchBy1 = .commercial
            chkvalue = true

            
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            

            
        case 5:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostPropertyViewController") as! PostPropertyViewController
            vc.postvaluepropertychk = postvaluepropertychk

            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
        case 6:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "postpropertycommericalvc") as! postpropertycommericalvc
            
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostRequirementViewController") as! PostRequirementViewController
            vc.PassValue = "Tenant"
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
    
            
            
        case 8:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostRequirementViewController") as! PostRequirementViewController
            vc.PassValue = "Buyer"
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)

        case 9:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            
            vc.comeFrom = .weekly
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
            //======
        case 10:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            
            vc.comeFrom = .monthly
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)

            
        case 11:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HireTopAgentViewController") as! HireTopAgentViewController
            
            vc.isComeFromAgent = true
            
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
        case 12:

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BuyServiceViewController") as! BuyServiceViewController
            cell.list_label.textColor = UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1)
            cell.listIcon_imageView.image = listImage_Array1[indexPath.row]
            // vc.comeFrom = .favourite
            chkvalue = true
            cell.list_label.textColor =  UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1)
            cell.listIcon_imageView.image = listImage_Array1[indexPath.row]
            
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
        case 13: // for leagal agent
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HireTopAgentViewController") as! HireTopAgentViewController
            vc.isComeFromAgent = false
            
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
            
        case 14:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
            
            vc.comeFrom = .Feedback
            
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
            
        case 15:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
            
        case 16:
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
            self.dismiss(animated: false, completion: nil)
            self.moveNext.navigationController?.pushViewController(vc, animated: true)
            
        case 17: //This case for logout
            
            
            self.presentYesNoAlert(msg: "Do you want to logout" )
            
        case 18: // this case for delete account in app
            
            deletAccount()
            
        default:
            print("")
        }
        
    }

    //MARK: this alert func use for delete account
     
     func deletAccount() {
         
         let actionSheetController = UIAlertController(title: "Are you sure want to delete this account", message: "", preferredStyle: .actionSheet)

         let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
             print("Cancel")
         }
         actionSheetController.addAction(cancelActionButton)

         let saveActionButton = UIAlertAction(title: "No", style: .default) { action -> Void in
             print("No")
         }
         actionSheetController.addAction(saveActionButton)

         let deleteActionButton = UIAlertAction(title: "Delete", style: .default) { action -> Void in
             print("Delete")
             self.deleteApiCall()
         }
         actionSheetController.addAction(deleteActionButton)
         self.present(actionSheetController, animated: true, completion: nil)
     }
    
            
     //MARK: func Delete Account Api call
     func deleteApiCall() {
         let param1 : [String:Any] = [ "user_id" : Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" ]
         
 //        ApiManager.apiPost(url:"http://reallworld.com/api/accountdelete", param: param1, ref: self) {  (json, error) in
         
         ApiManager.apiGetWithoutBaseWithKeyOriginally(url:"http://reallworld.com/api/accountdelete", param: param1, ref: self) { (json, error) in
           
             //  guard let self = self else { return  }
             
             if error != nil{
                 print(error?.localizedDescription ?? "")
             }else {
                 guard let data = json else {
                     print("error")
                     return
                 }
                 do {
                     
                     let model = try JSONDecoder().decode(DeleteAccount.self, from: data)
                     
                     if (model.status ?? "") == "true" {
                         
                         self.isSuccess = true
                         self.presentAlert(msg: (model.message ?? "") )

                         
                     }else {
                         
                         
                     }
                     
                 }catch  {
                     
                     
                     print("err \(error)")
                 }
             }
             
         }
         
         
         
     }
    
   //MARK: Logout api
    
    func logout_API() {
        
        let param : [String:Any] = [ "userid" : Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" ]
        
        print(param)
        
        ApiManager.apiPost(url:  Api.logout, param: param, ref: self.moveNext as! BaseViewController) {  (json, error) in
            
            //  guard let self = self else { return  }
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                }
                do {
                    
                    let model = try JSONDecoder().decode(SignUpModelElement.self, from: data)
                    
                    if (model.code ?? "") == "200" {
                        
                        self.isSuccess = true
//                        UserDefaults.standard.removeObject(forKey: "sqdata")
//                        UserDefaults.standard.removeObject(forKey: "floordata")
//                        UserDefaults.standard.removeObject(forKey: "furnished")
//                        UserDefaults.standard.removeObject(forKey: "roomvalue")
//                        UserDefaults.standard.removeObject(forKey: "propertyvalue")
//                        UserDefaults.standard.removeObject(forKey: "floordata1")
//                        UserDefaults.standard.removeObject(forKey: "floordatacom")
//                        UserDefaults.standard.removeObject(forKey: "propertyvaluecom")

                      
                         //UserDefaults.standard.value(forKey: "sqdata") as? String
                        self.presentAlert(msg: (model.msg ?? "") )
                        
                    }else {
                        
                        self.presentAlert(msg: (model.msg ?? "") )
                        
                    }
                    
                }catch  {
                    
                    
                    print("err \(error)")
                }
            }
            
        }
        
    }
}
