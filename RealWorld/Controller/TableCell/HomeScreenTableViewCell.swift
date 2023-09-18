//
//  HomeScreenTableViewCell.swift
//  RealWorld
//
//  Created by SAT PAL on 08/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var verified_imageView: UIImageView!
    
    @IBOutlet weak var rent_imageView: UIImageView!
    
    @IBOutlet weak var whatsapp_btn: UIButton!
    
    @IBOutlet weak var direction_lbl: UILabel!
    @IBOutlet weak var call_btn: UIButton!
    
    @IBOutlet weak var comment_btn: UIButton!
    
    @IBOutlet weak var direction_btn: UIButton!
    
    @IBOutlet weak var share_btn: UIButton!
    
    @IBOutlet weak var days_label: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var availableForPremium_label: UILabel!
    
    @IBOutlet weak var rent_image: UIImageView!
    @IBOutlet weak var rent_btn: UIButton!
    
    @IBOutlet weak var area_label: UILabel!
    
    @IBOutlet weak var room_label: UILabel!
    
    @IBOutlet weak var floor_label: UILabel!
    
    @IBOutlet weak var furnished_label: UILabel!
    
    @IBOutlet weak var price_label: UILabel!
    
    @IBOutlet weak var main_imageView: UIImageView!
    
    @IBOutlet weak var heart_btn: UIButton!
    
    @IBOutlet weak var edit_btn: UIButton!
    
    @IBOutlet weak var comment_label: UILabel!
    
    @IBOutlet weak var viewTable: UIStackView!
    
    @IBOutlet weak var viewTableHeightConstant: NSLayoutConstraint!
    
    @IBOutlet weak var lblLineOne: UILabel!
    @IBOutlet weak var lblLineTwo: UILabel!
    @IBOutlet weak var btnTotalCall: UIButton!
    @IBOutlet weak var btnTotalView: UIButton!
    
    
    
    
    @IBOutlet weak var rent_lbl: UILabel!
    var price:String = ""
    
    var btnViewResposeAct: (()->Void)?
    
    var oneIndexData : HomeData? {
        didSet {
            
            //sold_out
            
            //self.rent_image.image = UIImage(named: "rent_out")
            
            self.days_label.text = (oneIndexData?.cdate ?? "").dateFormatConversion(from: "yyyy-MM-dd HH:mm:ss", to: "dd-MMM-yyyy")
            price =  (self.oneIndexData?.price ?? "0")
            btnTotalView.setTitle("Total View:\(self.oneIndexData?.user_view ?? 0)", for: .normal)
            btnTotalCall.setTitle("Total Call:\(self.oneIndexData?.call_status ?? 0)", for: .normal)
            print(price)
            
            let largeNumber = Double(price) ?? 0
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
            print(formattedNumber as Any)
            
            if (oneIndexData?.price ?? "-1") == "-1" || (oneIndexData?.price ?? "0") == "0" {
                
                price_label.text = "₹ " + "On Request"
                
            }
            
            else  {
                
                let p = formatPoints(num: Double(price) ?? 0.0)
                print(price)
                print(p)
                let priceCount = price.unicodeScalars.count
                print(priceCount )
                if priceCount == 0 {
                    self.price_label.text = "On Request"
                }
                else if priceCount < 6{
                    self.price_label.text = "₹ " + String(formattedNumber ?? "" )
                }else{
                    self.price_label.text = "₹ " + String(oneIndexData?.ios_price ?? "")
                    
                }
                
                
            }
            
            furnished_label.text = oneIndexData?.roomType ?? ""
            let string = "\(oneIndexData?.floor ?? "")"
            var checkNo = Int()
            if let number = Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
                // Do something with this number
                checkNo = number
            }
            //let floor = (oneIndexData?.floor ?? "")  + " of "
            if oneIndexData?.propertyType == "Commercial"{
                room_label.text = oneIndexData?.aappartmentType ?? ""
                if checkNo != Int(oneIndexData?.floor ?? ""){
                    floor_label.text = "\(oneIndexData?.floor ?? "")"
                }else{
                    if "\(oneIndexData?.floor ?? "")" == "1" {
                        floor_label.text = "\(oneIndexData?.floor ?? "")st Floor"
                    }else if "\(oneIndexData?.floor ?? "")" == "2" {
                        floor_label.text = "\(oneIndexData?.floor ?? "")nd Floor"
                    }else if "\(oneIndexData?.floor ?? "")" == "3" {
                        floor_label.text = "\(oneIndexData?.floor ?? "")rd Floor"
                    }else {
                        floor_label.text = "\(oneIndexData?.floor ?? "")th Floor"
                    }
                }
                
            }else{
                room_label.text = oneIndexData?.room_size ?? ""
                if checkNo != Int(oneIndexData?.floor ?? ""){
                    floor_label.text = "\(oneIndexData?.floor ?? "")"
                }else{
                    if "\(oneIndexData?.floor ?? "")" == "1" && "\(oneIndexData?.totalFloor ?? "")" == "1"{
                        floor_label.text = "\(oneIndexData?.floor ?? "")st of \(oneIndexData?.totalFloor ?? "")st Floor"
                    }else if "\(oneIndexData?.floor ?? "")" == "2" && "\(oneIndexData?.totalFloor ?? "")" == "2"{
                        floor_label.text = "\(oneIndexData?.floor ?? "")nd of \(oneIndexData?.totalFloor ?? "")nd Floor"
                    }else if "\(oneIndexData?.floor ?? "")" == "3" && "\(oneIndexData?.totalFloor ?? "")" == "2"{
                        floor_label.text = "\(oneIndexData?.floor ?? "")rd of \(oneIndexData?.totalFloor ?? "")rd Floor"
                    }else if "\(oneIndexData?.floor ?? "")" == "4" && "\(oneIndexData?.totalFloor ?? "")" == "3"{
                        floor_label.text = "\(oneIndexData?.floor ?? "")rd of \(oneIndexData?.totalFloor ?? "")th Floor"
                    }else if "\(oneIndexData?.floor ?? "")" == "1" && "\(oneIndexData?.totalFloor ?? "")" > "3"{
                        floor_label.text = "\(oneIndexData?.floor ?? "")st of \(oneIndexData?.totalFloor ?? "")th Floor"
                    }else if "\(oneIndexData?.floor ?? "")" == "2" && "\(oneIndexData?.totalFloor ?? "")" > "3"{
                        floor_label.text = "\(oneIndexData?.floor ?? "")nd of \(oneIndexData?.totalFloor ?? "")th Floor"
                    }else if "\(oneIndexData?.floor ?? "")" == "3" && "\(oneIndexData?.totalFloor ?? "")" > "3"{
                        floor_label.text = "\(oneIndexData?.floor ?? "")rd of \(oneIndexData?.totalFloor ?? "")th Floor"
                    }else{
                        floor_label.text = "\(oneIndexData?.floor ?? "")th of \(oneIndexData?.totalFloor ?? "")th Floor"
                    }
                    
                }
                
            }
            
            floor_label.sizeToFit()
            //    (oneIndexData?.floor ?? "") + " " +  "floor" + "of" + (oneIndexData?.totalFloor ?? "") + " " + "flor"
            
            //   floor_label.text = floor  + (oneIndexData?.totalFloor ?? "") + " floor"
            //            if oneIndexData?.aappartmentType == ""{
            //                room_label.text = oneIndexData?.roomType ?? ""
            //            }else{
            //                room_label.text = oneIndexData?.room_size ?? ""
            //            }
            
            area_label.text = (oneIndexData?.houseArea ?? "") + " " + (oneIndexData?.houseUnit ?? "")
            
            availableForPremium_label.text = (oneIndexData?.society ?? "")  + " " + (oneIndexData?.locality ?? "")
            
            location.text = (oneIndexData?.locality ?? "")
            
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func btnViewResponseAction(_ sender: Any) {
        self.btnViewResposeAct!()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func formatPoints(num: Double) ->String{
        //  var thousandNum = num/1000
        var millionNum = num/100000.0
        var crore = num/10000000.0
        if num >= 100000 && num < 9999999{
            if(floor(millionNum) == millionNum){
                // return("\(Int(thousandNum))Thousand")
                return ("\(millionNum.roundToPlaces(1))Lakh")
            }
            return ("\(millionNum.roundToPlaces(1))Lakh")
        }
        else if num >= 10000000{
            if(floor(crore) == crore){
                //   return("\(Int(thousandNum))Thousand")
                return ("\(crore.roundToPlaces(1))Crore")
            }
            return ("\(crore.roundToPlaces(1))Crore")
        }
        else{
            if(floor(num) == num){
                return ("\(Int(num))")
            }
            return ("\(num)")
        }
        
    }
    
    
}


extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

extension Double {
    // Rounds the double to decimal places value
    mutating func roundToPlaces(_ places : Int) -> Double {
        let divisor = pow(10.00, Double(places))
        return (self.rounded() * divisor) / divisor
    }
}

