//
//  CommentViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 08/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

protocol passValue {
    func send(value:Bool,indexValue:String)
}


class CommentViewController: BaseViewController {
    
    var delegate : passValue?
    var indexVlaue = ""
    
    @IBOutlet weak var comment_textView: UITextView!
    
    @IBOutlet weak var list_tableView: UITableView!
    
    var model : CommentModel?
  
    var propertyId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        list_tableView.delegate = self
        list_tableView.dataSource = self
        getComment()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       // getComment()
        self.navigationController?.navigationBar.backgroundColor = .purple

        self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Comment", bgColor: .clear, barTintColor: .black, right: .None, center_type: .None, titleColor: .white)
    }
    
    @IBAction func tap_submit_btn(_ sender: Any) {
        
        if (comment_textView.text ?? "").replacingOccurrences(of: " ", with: "") != "" {
            
            postComment()
        }else {
            
            self.presentAlert(msg: "Please enter comment")
        }
    }
    
    
    
    func postComment() {
       
        let param : [String:Any] = ["property_id" : propertyId , "userid" : Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" , "message" : comment_textView.text! ]
        
        ApiManager.apiPost(url: Api.postComment , param: param, ref: self) { (json, error) in
            
               if error != nil{
                
                   print(error?.localizedDescription ?? "")
                
               }else {
                
                   guard let data = json else {
                       print("error")
                       return}
                   do {
            
                    let model = try JSONDecoder().decode(FeedbackModel.self, from: data)
                    
                    if (model.code ?? "") == "200" {
                        
                        comesFromCommented = true
                        self.self.delegate?.send(value:true,indexValue:self.indexVlaue)

                        self.getComment()

                    }
                    
                    
                   }catch  {
                       print("err \(error)")
                   }
               }
        }
    }

    func getComment() {
       
        let param : [String:Any] = ["property_id" : propertyId , "user_id" : Singleton.sharedInstance.loginModel?.first?.data?.id ?? ""  ]
        
     //   let param : [String:Any] = ["property_id" : 911 , "user_id" : 1  ]
        
        ApiManager.apiGetWithoutBaseWithKeyOriginally(url: Api.base_url + Api.getComment , param: param, ref: self) { (json, error) in
            
               if error != nil{
                
                   print(error?.localizedDescription ?? "")
                
               }else {
                
                   guard let data = json else {
                       print("error")
                       return}
                   do {
            
                    let model = try JSONDecoder().decode(CommentModel.self, from: data)
                    
                    self.model = model
                    
                    DispatchQueue.main.async {
                       
                        self.list_tableView.reloadData()
                       // self.list_tableView.reloadData()
                    }
                   
                    
                    //self.list_tableView.reloadData()
                   
                    print(model)
                    
                   }catch  {
                       print("err \(error)")
                   }
               }
            
        }
    }

    
}
extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.model?.first?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.list_tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
        
        cell.date_label.text = self.model?.first?.data[indexPath.row].cdate ?? ""
        
        cell.comment_label.text = self.model?.first?.data[indexPath.row].message ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    
        return UIView()
    }
}
