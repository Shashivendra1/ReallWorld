//
//  PopCalenderVC.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 20/09/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import UIKit

protocol PassDate {
    func passDate(date:String , sendDate: String)
}
class PopCalenderVC: UIViewController {
    
    var passDate:PassDate? = nil
    var datePicker = UIDatePicker()

    @IBOutlet weak var textFieldCalender: UITextField!
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        
        super.viewDidLoad()
        textFieldCalender.delegate = self
        
        showDatePicker()

    }
    func showDatePicker(){
        
        //Formate Date
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        let calendar = Calendar(identifier: .gregorian)
        
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        
        
        components.year = -1
        components.month = 12
        

        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -3, to: Date())

        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        //  use this case for set date in multiple textfiled using same picker
        toolbar.sizeToFit()
        textFieldCalender.inputAccessoryView = toolbar
        textFieldCalender.inputView = datePicker
        
    }
    //MARK: Function to handle done in datepicker
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "yyyy-MM"
        let paramDate = formatter2.string(from: datePicker.date)
      // print(formatter2.string(from: datePicker.date))
        
        textFieldCalender.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
   
        
        passDate?.passDate(date: textFieldCalender.text! , sendDate:paramDate )
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    //MARK: Function to handle cancel in datepicker
    
    @objc func cancelDatePicker(){
        
        self.view.endEditing(true)
    }
    
    @IBAction func backActionBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}

//MARK: This Extension is used for textfield delegate func

extension PopCalenderVC : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    
            showDatePicker()
        return true

        }
    }
