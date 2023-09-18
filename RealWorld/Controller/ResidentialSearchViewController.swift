//
//  ResidentialSearchViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 04/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class ResidentialSearchViewController: UIViewController {
    
    
    @IBOutlet weak var search_view: UIView!
    
    @IBOutlet weak var property_view: UIView!
    
    @IBOutlet weak var bedroom_view: UIView!
    
    @IBOutlet weak var buy_label: UILabel!
    
    @IBOutlet weak var rent_label: UILabel!
    
    @IBOutlet weak var rentSelectionLine_view: UIView!
    
    @IBOutlet weak var buySelection_view: UIView!
    
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

         setBuyRent(buy: UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), rent: UIColor.black , buyLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1) , rentLine : UIColor.clear)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Residential Search", bgColor: .clear, barTintColor: UIColor.black, right: .None, center_type: .None, titleColor: .white)
    }
    

    override func viewWillLayoutSubviews() {
        
        search_view.setView(borderWidth: 2, borderColor: .darkGray, cornerRadius: 5)
        
        property_view.setView(borderWidth: 2, borderColor: .darkGray, cornerRadius: 5)
        
        bedroom_view.setView(borderWidth: 2, borderColor: .darkGray, cornerRadius: 5)
        
    }
    
    //MARK:- Button Action
    
    @IBAction func tap_buy_btn(_ sender: Any) {
        
        setBuyRent(buy: UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), rent: UIColor.black , buyLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), rentLine : UIColor.clear)
    }
    
   
    @IBAction func tap_rent_btn(_ sender: Any) {
        
        setBuyRent(buy: UIColor.black, rent: UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1),buyLine : UIColor.clear , rentLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1))
    }
    
    
    func setBuyRent(buy : UIColor , rent : UIColor, buyLine : UIColor ,rentLine : UIColor ) {
        
        rentSelectionLine_view.backgroundColor = rentLine
        
        rent_label.textColor = rent
        
        buy_label.textColor = buy
        
        buySelection_view.backgroundColor = buyLine
    }

}
