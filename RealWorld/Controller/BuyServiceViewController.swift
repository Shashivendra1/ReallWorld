//
//  BuyServiceViewController.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 21/08/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import UIKit

class BuyServiceViewController: UIViewController ,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var buyColletion: UICollectionView!
    
    var arrayData = [buyService]()
    
    var List_title = [String]()
    var List_price = [String]()
    


      override func viewDidLoad() {
          super.viewDidLoad()
    

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        buyColletion.setCollectionViewLayout(layout, animated: true)
        
        buyColletion.delegate = self
        buyColletion.dataSource = self
        
      //  ApiCalling()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .purple
        self.navigationItem.leftBarButtonItem?.title = ""

        self.navigationItem.title = "Buy Services"

        ApiCalling()
    }
    
    
    func ApiCalling () {
        var request = URLRequest(url: URL(string: "http://reallworld.com/api/buyourservice")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { [self] data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(buyService.self, from: data!)
               // let responseModel1 : Services = try jsonDecoder.decode(Services.self, from: data!)
                
                let data = responseModel.services
                print(data)
                self.arrayData.append(responseModel)
                
                for item in 0...data!.count - 1 {
                
                    List_title.append(data![item].title!)
                    List_price.append(String(data![item].price!))

                }
            

                DispatchQueue.main.async {
                    buyColletion.reloadData()
                }
                
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
 
    
    


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        
        return CGSize(width:widthPerItem, height:150)
    }

}

extension BuyServiceViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   // return 10
        return List_title.count //arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = buyColletion.dequeueReusableCell(withReuseIdentifier: "BuyServiceCollectionViewCell", for: indexPath) as! BuyServiceCollectionViewCell
  
        cell.lblName.text =  List_title[indexPath.row]//"shashi"
        cell.lblPrice.text = List_price[indexPath.row]
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 0.1
        cell.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cell
        
    }
    

    
}

//MARK:- Api Calling

