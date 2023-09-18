//
//  HouseDetailViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 05/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
import SDWebImage

class HouseDetailViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var btngifimage: UIImageView!
    @IBOutlet weak var propertyimage: UIImageView!
    @IBOutlet weak var property_room: UILabel!
    @IBOutlet weak var btnReadyToMove: UIButton!
    @IBOutlet weak var viewOwnerType: UIStackView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var lblOwnerType: UILabel!
    @IBOutlet weak var labelTitleHeading: UILabel!
    @IBOutlet weak var slider_imageView: UICollectionView!
    @IBOutlet weak var lblFurnishing: UILabel!
    @IBOutlet weak var Propertyview: UIView!
    @IBOutlet weak var phone_view: UIView!
    @IBOutlet weak var phonetable_view: UITableView!
    var phonearr : [String] = []
    @IBOutlet weak var selectnumberlbl: UILabel!
    var phonenumberWhatsApp = ""
    
    var bannerModel : BannerImageModel?
    
    var chkphone = ""
    
    @IBOutlet weak var house_imageView: UIImageView!
    @IBOutlet weak var callbtn: UIButton!
    
    @IBOutlet weak var chatbtn: UIButton!
    @IBOutlet weak var name_label: UILabel!
    
    
    @IBOutlet weak var area_label: UILabel!
    
    @IBOutlet weak var description_label: UILabel!
    
    @IBOutlet weak var room_label: UILabel!
    
    @IBOutlet weak var propertyId_label: UILabel!
    
    
    @IBOutlet weak var type_label: UILabel!
    
    @IBOutlet weak var ownerName_label: UILabel!
    
    @IBOutlet weak var bathroom_label: UILabel!
    
    @IBOutlet weak var price_btn: UIButton!
    var objCell = ImageCollectionViewCell()
    
    @IBOutlet weak var banner_image: UIImageView!
    
    var houseDetail : HomeData?
    var price = ""

    
    override func viewDidLoad()  {
        super.viewDidLoad()
        chatbtn.layer.cornerRadius = 10
        callbtn.layer.cornerRadius = 10
        phonetable_view.delegate = self
        phonetable_view.dataSource = self
        phone_view.isHidden = true
        phone_view.layer.cornerRadius = 20
        slider_imageView.delegate = self
        slider_imageView.dataSource = self
        if houseDetail?.selType != "" {
            btnReadyToMove.isHidden = false
            btnReadyToMove.setTitle(houseDetail?.selType, for: .normal)
        }else{
            //btnReadyToMove.isHidden = true
        }
        print(houseDetail?.propertyCategory)
        if  ((self.houseDetail?.propertyCategory ?? "") == "Sell Property")
        {
            self.banner_image.image = UIImage(named: "SALE2")
            //UIImage.gif(name: "SALE2")
            
        }
        else
        {
            self.banner_image.image = UIImage(named: "RENT_2")
           // UIImage.gif(name: "RENT_2")
            
        }
        btngifimage.image = UIImage(named: "button-gif")
       // UIImage.gif(name: "button-gif")
        
        name_label.text = (houseDetail?.propertyType ?? "") + "\n" + (houseDetail?.room_size ?? "")
        
        area_label.text = (houseDetail?.houseArea ?? "") + " " + (houseDetail?.houseUnit ?? "")
        ownerName_label.text = (houseDetail?.userName ?? "")
        lblOwnerType.text = "\(houseDetail?.ownerType ?? "")"
        lblFurnishing.text = (houseDetail?.roomType ?? "")
        
        room_label.text = houseDetail?.room_size ?? ""
        labelTitleHeading.text = "\(houseDetail?.society ?? "") \(houseDetail?.locality ?? "")"
        
        if houseDetail?.room_size ?? "" == "" {
            room_label.text = houseDetail?.roomType ?? ""
            property_room.text = "Room Type"
        }
        
        //        if houseDetail?.room_size ?? "" == ""
        //        {
        //            property_room.isHidden = false
        //            propertyimage.isHidden = false
        //        }
        
        
        pageControll.hidesForSinglePage = true
        pageControll.isHidden = true
        type_label.text = houseDetail?.aappartmentType ?? ""
        bathroom_label.text = houseDetail?.bathroomSize ?? ""
        
        if houseDetail?.propertyCategory == "Sell Commercial Property" {
            viewOwnerType.isHidden = false
            
        } else if houseDetail?.propertyCategory == "Sell Property" {
            viewOwnerType.isHidden = false
        } else {
            viewOwnerType.isHidden = true
        }
        let h_id = houseDetail?.id
        
        //  let id = self.homeScreenModel?.first?.data?[sender.tag].id
        
        switch h_id {
            
        case .bool(let _):
            print("bool")
            
        case .int(let val):
            let propertyname = "RW"
            propertyId_label.text = propertyname + String(val)
            self.getBanner_API(propertyId: String(val))
            
        case .string(let val) :
            let propertyname = "RW"
            propertyId_label.text = propertyname + val
            self.getBanner_API(propertyId: String(val))
            
        case .none:
            
            print("none")
            
        }
        //        propertyvalue =
        
        
        description_label.text! = houseDetail?.datumDescription ?? ""
        if (houseDetail?.price ?? "-1") == "-1" || (houseDetail?.price ?? "0") == "0" {
            
            price_btn.setTitle("On Request", for: .normal)
        }
        else {
            let largeNumber = Double(houseDetail?.price ?? "") ?? 0
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
            print(formattedNumber as Any)
            
            
            let p = formatPoints(num: Double(houseDetail?.price ?? "") ?? 0.0)
            print(price)
            print(p)
            let priceCount = houseDetail?.price?.unicodeScalars.count
            print(priceCount )
            if priceCount ?? 0 < 6{
                price_btn.setTitle(String(formattedNumber ?? ""), for: .normal)
                
                // self.price_label.text = "₹ " + String(formattedNumber ?? "" )
            }else{
                price_btn.setTitle(String(houseDetail?.ios_price ?? ""), for: .normal)
                
                
                //  self.price_label.text = "₹ " + String(p)
                
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    @IBAction func tap_back_btn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    func getBanner_API(propertyId : String) {
        let param : [String:Any] = [ "propertyid" : propertyId]
        
        print(param)
        
        ApiManager.apiPost(url:  Api.getuserproperties_images, param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    self.bannerModel = try JSONDecoder().decode(BannerImageModel.self, from: data)
                    // self.bannerModel?.first?.data?.count as Any
                    if ((self.bannerModel?.first?.data?.count) == 0)
                    {
                        //                                            let indexPath = IndexPath.init(row: 0, section: 0)
                        
                        self.objCell.image?.image = UIImage(named: "placeholder")
                        //self.objCell.image?.image? = UIImage(named: "home")!
                        
                        
                        //self.slider_imageView.reloadData()
                        
                    }
                    else
                    {
                        DispatchQueue.main.async
                        {
                            
                            //self.objCell.image?.image = UIImage(named: "home")
                            self.slider_imageView.reloadData()                       }
                    }
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
    @IBAction func tap_share_btn(_ sender: Any) {
        
        var propertyId = ""
     
        let h_id = houseDetail?.id
    
        switch h_id {
            
        case .bool(let _):
            print("bool")
            
        case .int(let val):
             propertyId = String(val)
//            propertyId_label.text = propertyname + String(val)
//            self.getBanner_API(propertyId: String(val))
            
        case .string(let val) :
             propertyId = val
            
//            propertyId_label.text = propertyname + val
//            self.getBanner_API(propertyId: String(val))
            
        case .none:
            
            print("none")
            
        }
        
        
        let textToShare = "\(houseDetail?.propertyCategory ?? "") Rs.\(houseDetail?.price ?? ""), \(houseDetail?.locality ?? ""), \(houseDetail?.houseArea ?? ""),\(houseDetail?.houseUnit ?? ""), \(houseDetail?.datumDescription ?? "") RW\(propertyId),\n https://reallworld.com/single-property/\(propertyId)"
    
       // let textToShare = "http://www.google.com"
        let objectsToShare = [textToShare] as [Any]
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems:  objectsToShare, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.print, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToVimeo]
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)  {
            
            activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.size.width, y: self.view.bounds.size.height, width: 1.0, height: 1.0)
            
        }
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    //    @IBAction func chatbtn(_ sender: Any) {
    //            openWhatsapp()
    ////        let urlWhats = URL(string: "https://api.whatsapp.com/send?phone=9512347895&text=Invitation")
    ////        //"whatsapp://send?text=\("www.google.com")"
    ////
    ////        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
    ////            if let whatsappURL = NSURL(string: urlString) {
    ////                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
    ////                    UIApplication.shared.open(whatsappURL as URL)
    ////                }
    ////                else {
    ////                    print("please install watsapp")
    ////                }
    ////            }
    ////        }
    //    }
    
    @IBAction func chatbtn(_ sender: Any) {
        
        phonetable_view.isHidden = false
        
        if houseDetail?.mobile == "Available for premium users"
        {
            chkphone = "1"
            let arr =  ["Available for premium users"]
            phonearr = arr
            // let text = arr.firstIndex(of: "Available for premium users")
            //phonearr.append(arr.first ?? "")
            // phonearr.append(text)
            phonetable_view.reloadData()
            phone_view.isHidden = false
            // picker_view.isHidden = false
            phonetable_view.isHidden = false
            
            selectnumberlbl.isHidden = false
        }
        else
        {
            // print(self.homeScreenModel?.first?.data?[(sender as AnyObject).tag].mobile as Any)
            let phone = houseDetail?.mobile ?? ""
            //               let mobile = "\(self.homeScreenModel?.first?.data?[(sender as AnyObject).tag].alternativeNumber ?? "")"
            let mobile = houseDetail?.alternativeNumber ?? ""
            
            phonearr = phone.components(separatedBy: ", ")
            phonearr.append(mobile)
            phonenumberWhatsApp = houseDetail?.mobile as! String
            chkphone = "1"
            phonetable_view.reloadData()
            
            phone_view.isHidden = false
            // picker_view.isHidden = false
            phonetable_view.isHidden = false
            
            selectnumberlbl.isHidden = false
        }
    }
    @IBAction func phone_okbtn(_ sender: Any) {
        phone_view.isHidden = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   phonearr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let str = phonearr[indexPath.row]
        
        
        cell.textLabel?.text = str
        
        
        
        return   cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == phonetable_view
        {
            if chkphone == "1"
                
            {
                
                var str = phonearr[indexPath.row]
                
                str = str.addingPercentEncoding(withAllowedCharacters: (NSCharacterSet.urlQueryAllowed))!
                let whatsappURL = URL(string: str)
                
                var txt = "Hello Please share the property details and pictures.Thank You.."
                //  let urlWhats = "whatsapp://send?phone=str&abid=12354&text=txt"
                
                let urlWhats = "\("whatsapp://send?phone=")\("91"+str)&abid=12354&text=Hello Please share the property details and pictures.Thank You.."
                //
                var characterSet = CharacterSet.urlQueryAllowed
                characterSet.insert(charactersIn: "?&")
                
                if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: characterSet){
                    
                    if let whatsappURL = NSURL(string: urlString) {
                        if UIApplication.shared.canOpenURL(whatsappURL as URL){
                            UIApplication.shared.openURL(whatsappURL as URL)
                        }
                        else {
                            print("Install Whatsapp")
                            
                        }
                    }
                }
            }
            
            else if chkphone == "2"
                        
            {
                var str = phonearr[indexPath.row]
                
                var url = NSURL()
                url = NSURL(string: "tel://" + str)!
                
                
                if (UIApplication.shared.canOpenURL(url as URL)){
                    // UIApplication.shared.openURL(url as URL)
                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                    
                }else {
                    
                    self.presentAlert(msg: "Your device does not support calling")
                    
                }
            }
        }
    }
    
    @IBAction func callbtn(_ sender: Any) {
        
        if houseDetail?.mobile == "Available for premium users"
        {
            chkphone = "1"
            let arr =  ["Available for premium users"]
            phonearr = arr
            // let text = arr.firstIndex(of: "Available for premium users")
            //phonearr.append(arr.first ?? "")
            // phonearr.append(text)
            phonetable_view.reloadData()
            phone_view.isHidden = false
            // picker_view.isHidden = false
            phonetable_view.isHidden = false
            
            selectnumberlbl.isHidden = false
        }
        else
        {
            let phone = houseDetail?.mobile ?? ""
            
            let mobile = houseDetail?.alternativeNumber ?? ""
            
            phonearr = phone.components(separatedBy: ",")
            phonearr.append(mobile)
            chkphone = "2"
            
            phonetable_view.reloadData()
            phone_view.isHidden = false
            // picker_view.isHidden = false
            phonetable_view.isHidden = false
            
            selectnumberlbl.isHidden = false
        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.bannerModel?.first?.data?.count as Any)
        
        return self.bannerModel?.first?.data?.count ?? 1
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.slider_imageView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        objCell = cell
        
        
        if bannerModel?.first?.data?.count ?? 0 == 0
        {
            cell.image?.image = UIImage(named: "home")
            
        }
        
        cell.image?.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        
        let url = self.bannerModel?.first?.data?[indexPath.row].image ?? ""
        // cell.image.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "home"))
        cell.image?.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "home"))
        
        //  cell.image.sd_setImage(with: URL(string: url))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex:CGFloat = slider_imageView.contentOffset.x / slider_imageView.frame.size.width
        pageControll.currentPage = Int(currentIndex)
    }
    
    func formatPoints(num: Double) ->String{
        //  var thousandNum = num/1000
        var millionNum = num/100000
        var crore = num/10000000
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
