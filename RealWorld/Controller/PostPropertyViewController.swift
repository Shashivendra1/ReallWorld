//
//  PostPropertyViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 05/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
import CoreLocation
import SDWebImage
import Alamofire
import OpalImagePicker
import Photos
import BSImagePicker
enum SelectionType {
    case apartment
    case apartment1
    case basement
    case basement1
    case room
    case room1
    
    case area
    case area1
    
    case freehold
    case booking
    case furnished
    case furnished1
    case city
    case city1
    
    case locality
    case locality1
    
}

enum ApiType {
    
    case residential
    case commercial
    
}
enum classtype {
    
    case residential
    case comemrcial
    
}

enum SaleRent {
    case sale
    case rent
}

class PostPropertyViewController: BaseViewController,OpalImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate {
    
    var cityName = ""
    var searchedCountry = [String]()
    var searching = false
    var countryNameArr = [String]()
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var countrySearch: UISearchBar!
    @IBOutlet weak var searchTableHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchTableView: UITableView!
   
    @IBOutlet weak var apartment_btn: UIButton!
    
    @IBOutlet weak var rentproperty_btn: UIButton!
    @IBOutlet weak var alternate_no: UITextField!
    @IBOutlet weak var lblPriceConvertor: UILabel!
    @IBOutlet weak var basement_btn: UIButton!
    @IBOutlet weak var furnished_btn: UIButton!
    
    @IBOutlet weak var selectcitybtn1: UIButton!
    @IBOutlet weak var selectcitybtn: UIButton!
    @IBOutlet weak var furnished1_btn: UIButton!
    
    @IBOutlet weak var alternate_no1: UITextField!
    @IBOutlet weak var sellproperty_btn: UIButton!
    @IBOutlet var textfieldContainer_view: [UIView]!
    
    @IBOutlet weak var roomselectionbtn1: UIButton!
    @IBOutlet weak var roomselectionbtn: UIButton!
    @IBOutlet weak var areaselectionbtn1: UIButton!
    @IBOutlet weak var areaselectionbtn: UIButton!
    @IBOutlet weak var apartmentbtn1: UIButton!
    @IBOutlet weak var selectPropertyType_label: UILabel!
    
    @IBOutlet weak var basement_label: UILabel!
    var propertyId = ""
    var postvaluepropertychk:String = ""
    var param : [String:Any] = [:]
    
    var chkvalue:String = ""
    var SelectedAssests = [PHAsset]()
    @IBOutlet weak var totalFloor_textfield: UITextField!
    
    @IBOutlet weak var image_collectionView: UICollectionView!
    
    @IBOutlet weak var imageCollectionView_height: NSLayoutConstraint!
    @IBOutlet weak var carpetheight: NSLayoutConstraint!
    @IBOutlet weak var imageCollectionView_top: NSLayoutConstraint!
    
    @IBOutlet weak var mobile1_textfield: UITextField!
    @IBOutlet weak var name1_textfield: UITextField!
    @IBOutlet weak var name_textfield: UITextField!
    
    @IBOutlet weak var mobile_textfield: UITextField!
    
    @IBOutlet weak var price_textfield: UITextField!
    
    @IBOutlet weak var balconies1_textfield: UITextField!
    @IBOutlet weak var bathroom_textfield: UITextField!
    
    @IBOutlet weak var bathroom1_textfield: UITextField!
    @IBOutlet weak var noOfBalconies_textfield: UITextField!
    
    @IBOutlet weak var sqtFeet_textfield: UITextField!
    
    @IBOutlet weak var lattitude1_textfield: UITextField!
    @IBOutlet weak var address1_textfield: UITextField!
    @IBOutlet weak var area1_textfield: UITextField!
    @IBOutlet weak var area_textfield: UITextField!
    @IBOutlet weak var carpet_textfield: UITextField!
    
    @IBOutlet weak var submitbtn1: UIButton!
    @IBOutlet weak var submitbtn: UIButton!
    @IBOutlet weak var freeHold_textfield: UITextField!
    
    @IBOutlet weak var booking1_textfield: UITextField!
    @IBOutlet weak var freehold1_textfield: UITextField!
    @IBOutlet weak var description1_textfield: GrowingTextView!
    @IBOutlet weak var booking_textfield: UITextField!
    
    @IBOutlet weak var furnished1_textfield: UITextField!
    @IBOutlet weak var longitude1_textfield: UITextField!
    @IBOutlet weak var furnished_textfield: UITextField!
    
    @IBOutlet weak var totalfloor1_textfield: UITextField!
    @IBOutlet weak var selectCity_textfield: UITextField!
    
    @IBOutlet weak var selectcity1_textfield: UITextField!
    @IBOutlet weak var address_textfield: UITextField!
    
    @IBOutlet weak var basementbtn1: UIButton!
    @IBOutlet weak var basement1_label: UILabel!
    @IBOutlet weak var description_textfield: UITextView!
    
    @IBOutlet weak var sqfeet1_textfield: UITextField!
    @IBOutlet weak var room1_textfield: UITextField!
    @IBOutlet weak var price1_textfield: UITextField!
    @IBOutlet weak var room_textfield: UITextField!
    var chklocationvalue = false
    var currentLocation: CLLocation?
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var sellProperty_label: UILabel!
    
    @IBOutlet weak var rentProperty_label: UILabel!
    
    @IBOutlet weak var longitude_textfield: UITextField!
    
    @IBOutlet weak var lattitude_texfield: UITextField!
    
    @IBOutlet weak var carpet_view: UIView!
    
    @IBOutlet weak var booking_view: UIView!
    @IBOutlet weak var freehold_view: UIView!
    var Cameraimage:UIImage!
    
    @IBOutlet weak var roomapartment_view: UIView!
    
    @IBOutlet weak var sell_view: UIView!
    
    @IBOutlet weak var selectproperty1_label: UILabel!
    @IBOutlet weak var rent_view: UIView!
    var image_array : [UIImage] = []
    var valuechk = "1"
    var homeData : HomeData?
    
    //let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomCell!
    
    var image_picker : UIImagePickerController = UIImagePickerController()
    let imagePicker = OpalImagePickerController()
    
    var imageOption = ["Take photo" , "Choose From Gallery"]
    var actionSheet = UIAlertController()
    var imageData : NSData? = nil
    
    var long = 0.0
    var lati = 0.0
    var long1 = 0.0
    var lati1 = 0.0
    
    var apartment_Array = [String]()
    //["Apartment" , "Service Apartment" , "Builder Floor" , "Plot/Land" , "House/Villa" , "Farmhouse" ]
    var apartment_Array1 = ["Office Space","Co-working Office", "Commercial Lands/Plots", "Hotel/Resorts", "Guest-House/Banquet-Halls", "Shop/Showroom", "Industrial land", "Agriculture/Farmland", "Factory", "Warehouse"]
    
    var basement_Array = ["Basement" , "Ground" , "Lower Ground" , "1" ,"2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" , "11" , "12" , "13" , "14" , "15" , "16" , "17" , "18" , "19" , "20" , "20+" ,"BMT+GF" , "Duplex" , "Banglow" ]
    
    
    var room_Array = ["1 Room/Studio Apartment" , "1 Bhk" , "2 Bhk" , "3 Bhk" , "4 Bhk" , "5 Bhk" , "5+ Bhk","Plot" ]
    
    var area_Array = ["Sq.ft" , "Sq.yards" , "Sq.meter" , "Acres" , "Marla" , "Cents" , "Bigha" , "Kotha" , "Grounds" , "Hectare" ]
    
    var freehold_Array = ["Freehold" , "Leasehold" ,"Power of attorney" , "Not Confirm" , "Others" ]
    
    var booking_Array = ["Booking" , "Under construction" , "Ready To Move" , "resale" ]
    
    var furnished_Array = ["Furnished" , "Semifurnished"]
    var furnished_Array1 = ["Furnished" , "Semifurnished"]
    
    
    var cityId = ""
    
    var selectionType : SelectionType = .apartment
    
    var cityModel : CityModel?
    
    var localityModel : LocalityModel?
    
    var localityArray : [LocalityData]? = []
    
    
    var sellOrRent = ""
    
    var apiType : ApiType? // = .residential
    var classtype : classtype?
    
    
    var saleRent : SaleRent = .sale
    
    var link = ""
    var valuedata = ""
    var bannerModel : BannerImageModel?
    var objCell = PostPropertyCollectionViewCell()
    
    
    let geoCoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countrySearch.delegate = self

        valuechk = "1"
        sellOrRent = "Sell Property"
        
        if valuedata == "1"
        {
            rent_view.isHidden = true
            sell_view.isHidden = true
            imageCollectionView_top.constant = 16
            imageCollectionView_height.constant = 200
        }
        else
        {
            imageCollectionView_top.constant = 0
            
            imageCollectionView_height.constant = 0
        }
        
        print(postvaluepropertychk)
        
        if postvaluepropertychk == "Residential"
            
        {
            apiType = .residential
            
            classtype  = .residential
            apartment_Array = ["Apartment" , "Service Apartment" , "Builder Floor" , "Plot/Land" , "House/Villa" , "Farmhouse" ]
            
            carpetheight.constant = 0
            self.carpet_view.isHidden = true
            
            roomapartment_view.isHidden = false
            //            area_textfield.text = "Area"
            sellOrRent = "Sell Property" //Rent Out Property"
            
            
        }
        else
        {
            sellOrRent = "Sell Commercial Property"
            apiType  = .commercial
            classtype  = .comemrcial
            apartment_Array = ["Office Space","Co-working Office", "Commercial Lands/Plots", "Hotel/Resorts", "Guest-House/Banquet-Halls", "Shop/Showroom", "Industrial land", "Agriculture/Farmland", "Factory", "Warehouse"]
            carpetheight.constant = 50
            self.carpet_view.isHidden = false
            //  area_textfield.text = "Super Area"
            roomapartment_view.isHidden = true
        }

        let h_id = homeData?.id
        
        switch h_id {
            
        case .bool(let _):
            print("bool")
            
        case .int(let val):
            // let propertyname = "RW"
            //  propertyId_label.text = propertyname + String(val)
            self.getBanner_API(propertyId: String(val))
            
        case .string(let val) :
            //  let propertyname = "RW"
            //propertyId_label.text = propertyname + val
            self.getBanner_API(propertyId: String(val))
            
        case .none:
            
            print("none")
            
        }
        
        
        image_picker.delegate = self
        imagePicker.imagePickerDelegate = self
        
        self.image_collectionView.delegate = self
        
        self.image_collectionView.dataSource = self
        
        picker.delegate = self
        
        picker.dataSource = self
        
        picker.isHidden = true
        
        toolbar.isHidden = true
        
        //  image_collectionView.isHidden = true
        //  image_array.append(img)
        //        imageCollectionView_top.constant = 0
        //
        //        imageCollectionView_height.constant = 0
        
        
        self.sellProperty_label.textColor = UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1)
        self.rentProperty_label.textColor = .black
        
        locationManager.delegate = self

        name_textfield.isHidden = false
        mobile_textfield.isHidden = false
        
        alternate_no.isHidden = false
        
        basement_label.isHidden = false
        totalFloor_textfield.isHidden = false
        sqtFeet_textfield.isHidden = false
        furnished_textfield.isHidden = false
        freeHold_textfield.isHidden = false
        price_textfield.isHidden = false
        bathroom_textfield.isHidden = false
        noOfBalconies_textfield.isHidden = false
        area_textfield.isHidden = false
        booking_textfield.isHidden = false
        address_textfield.isHidden = false
        lattitude_texfield.isHidden = false
        longitude_textfield.isHidden = false
        description_textfield.isHidden = false
        room_textfield.isHidden = false
        selectPropertyType_label.isHidden = false
        selectCity_textfield.isHidden = false
        furnished_btn.isHidden = false
        basement_btn.isHidden = false
        apartment_btn.isHidden = false
        selectcitybtn.isHidden = false
        roomselectionbtn.isHidden = false
        areaselectionbtn.isHidden = false
        submitbtn.isHidden = false
        
 
        
        name1_textfield.isHidden = true
        mobile1_textfield.isHidden = true
        alternate_no1.isHidden = true
        price1_textfield.isHidden = true
        bathroom1_textfield.isHidden = true
        balconies1_textfield.isHidden = true
        area1_textfield.isHidden = true
        address1_textfield.isHidden = true
        longitude1_textfield.isHidden = true
        lattitude1_textfield.isHidden = true
        description1_textfield.isHidden = true
        basement1_label.isHidden = true
        totalfloor1_textfield.isHidden = true
        sqfeet1_textfield.isHidden = true
        furnished1_textfield.isHidden = true
        freehold1_textfield.isHidden = true
        selectcity1_textfield.isHidden = true
        room1_textfield.isHidden = true
        
        selectproperty1_label.isHidden = true
        furnished1_btn.isHidden = true
        basementbtn1.isHidden = true
        apartmentbtn1.isHidden = true
        selectcitybtn1.isHidden = true
        roomselectionbtn1.isHidden = true
        areaselectionbtn1.isHidden = true
        submitbtn1.isHidden = true
        
        
        price1_textfield.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        price_textfield.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        
        
        searchViewFilter()
        self.setTableHeight()
    } //End did load func
    
    
    func searchViewFilter () {
        
        searchView.layer.borderWidth = 1
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchView.layer.borderColor = UIColor.black.cgColor
        self.searchTableHeightConstraint.isActive = true
 
    }
    
    
    func setTableHeight() {
        if self.countryNameArr.count != 0 {
            
        self.searchTableHeightConstraint.constant = 200

        }
        else {
            self.searchTableHeightConstraint.constant = 0

        }
        self.searchTableView.reloadData()

    }
    
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        lblPriceConvertor.numberOfLines = 2
        
        if  textField.text?.isEmpty != true {
            let value = Int(textField.text!)
            let string = numberFormatter.string(from:value! as NSNumber)
            lblPriceConvertor.text = string
            lblPriceConvertor.numberOfLines = 2
        }
        else {
            lblPriceConvertor.text = ""
            print("empty")
        }
        
    }
    
    
    @IBAction func tap_liveLocation_btn(_ sender: Any) {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
            chklocationvalue = true
        }
    }
  
    
    //MARK: - location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        
        self.lattitude_texfield.text = "\(userLocation.coordinate.latitude)"
        self.longitude_textfield.text = "\(userLocation.coordinate.longitude)"
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                print(placemark.locality!)
                print(placemark.administrativeArea!)
                print(placemark.country!)
                
                self.address_textfield.text = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
                
                
                
            }
        }
        
    }
    private func locationManager1(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        self.lattitude1_textfield.text = "\(userLocation.coordinate.latitude)"
        self.longitude1_textfield.text = "\(userLocation.coordinate.longitude)"
        
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                print(placemark.locality!)
                print(placemark.administrativeArea!)
                print(placemark.country!)
                
                
                self.address1_textfield.text = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
                
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
        
    }
    
    override func viewWillLayoutSubviews() {
        
        apartment_btn.setButton(borderWidth: 1, borderColor: .black, cornerRadius: 8)
        
        basement_btn.setButton(borderWidth: 1, borderColor: .black, cornerRadius: 8)
        apartmentbtn1.setButton(borderWidth: 1, borderColor: .black, cornerRadius: 8)
        
        basementbtn1.setButton(borderWidth: 1, borderColor: .black, cornerRadius: 8)
        
        
        textfieldContainer_view.forEach{$0.layer.cornerRadius = 5 }
        
        textfieldContainer_view.forEach{$0.layer.borderWidth = 1 }
        
        textfieldContainer_view.forEach{$0.layer.borderColor = UIColor.black.cgColor }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .purple
        self.navigationItem.leftBarButtonItem?.title = ""
        self.navigationItem.title = "Residential Property"
        getCity_API()
        
    }
    
    
    @IBAction func tap_map_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.lat = String(self.lati)
        vc.long = String(self.long)
        self.navigationController?.pushViewController(vc, animated: true)
        
//        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
//            UIApplication.shared.open(URL(string:"comgooglemaps://?center=\(self.lati),\(self.long)&zoom=14&views=traffic&q=\(self.long),\(self.lati)")!, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.open(URL(string: "http://maps.google.com/maps?q=loc:\(self.lati),\(self.long)&zoom=14&views=traffic&q=\(self.lati),\(self.long)")!, options: [:], completionHandler: nil)
//        }
        
    }
    
    
    func getlocationFromCoordinates(location : CLLocation) {
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("Error in reverseGeocode")
            }
            
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count > 0 {
                
                let placemark = placemarks![0]
                
                let loc = String(describing: placemark).split(separator: "@")
                
                // print(String(describing: loc[0]))
                
                self.address_textfield.text = String(describing: loc[0])
                
                
            }
        })
        
    }
    func getlocationFromCoordinates1(location : CLLocation) {
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("Error in reverseGeocode")
            }
            
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count > 0 {
                
                let placemark = placemarks![0]
                
                let loc = String(describing: placemark).split(separator: "@")
                
                print(String(describing: loc[0]))
                
                
                
                self.address1_textfield.text = String(describing: loc[0])
                
                
            }
        })
        
    }
    
    
    @IBAction func tap_sellProperty_btn(_ sender: Any) {
        valuechk =  "1"
        
        self.lblPriceConvertor.text = "" // to emty price convertor
        
        self.saleRent = .sale
        self.sellProperty_label.textColor = UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1)
        self.rentProperty_label.textColor = .black
        booking_view.isHidden = false
        booking_view.isHidden = false
        freehold_view.isHidden = false
        

        name_textfield.isHidden = false
        mobile_textfield.isHidden = false
        
        alternate_no.isHidden = false
        
        basement_label.isHidden = false
        totalFloor_textfield.isHidden = false
        sqtFeet_textfield.isHidden = false
        furnished_textfield.isHidden = false
        freeHold_textfield.isHidden = false
        price_textfield.isHidden = false
        bathroom_textfield.isHidden = false
        noOfBalconies_textfield.isHidden = false
        area_textfield.isHidden = false
        booking_textfield.isHidden = false
        address_textfield.isHidden = false
        lattitude_texfield.isHidden = false
        longitude_textfield.isHidden = false
        description_textfield.isHidden = false
        room_textfield.isHidden = false
        selectPropertyType_label.isHidden = false
        selectCity_textfield.isHidden = false
        furnished_btn.isHidden = false
        basement_btn.isHidden = false
        apartment_btn.isHidden = false
        selectcitybtn.isHidden = false
        roomselectionbtn.isHidden = false
        areaselectionbtn.isHidden = false
        submitbtn.isHidden  = false
        
  
        name1_textfield.isHidden = true
        mobile1_textfield.isHidden = true
        alternate_no1.isHidden = true
        price1_textfield.isHidden = true
        bathroom1_textfield.isHidden = true
        balconies1_textfield.isHidden = true
        area1_textfield.isHidden = true
        address1_textfield.isHidden = true
        longitude1_textfield.isHidden = true
        lattitude1_textfield.isHidden = true
        description1_textfield.isHidden = true
        room1_textfield.isHidden = true
        
        basement1_label.isHidden = true
        totalfloor1_textfield.isHidden = true
        sqfeet1_textfield.isHidden = true
        furnished1_textfield.isHidden = true
        freehold1_textfield.isHidden = true
        selectcity1_textfield.isHidden = true
        selectproperty1_label.isHidden = true
        furnished1_btn.isHidden = true
        basementbtn1.isHidden = true
        apartmentbtn1.isHidden = true
        selectcitybtn1.isHidden = true
        roomselectionbtn1.isHidden = true
        areaselectionbtn1.isHidden = true
        submitbtn1.isHidden = true
        
        
        selectCity_textfield.text = "Select City"
        searchedCountry.removeAll()
        countryNameArr.removeAll()
        countrySearch.text = ""
        self.setTableHeight()
        self.searchTableView.reloadData()
        
    }
    
    @IBAction func tap_rentProperty_btn(_ sender: Any) {
        
        
        valuechk = "2"
        self.lblPriceConvertor.text = "" // to emty price convertor
        
        self.saleRent = .rent
        self.sellProperty_label.textColor = .black
        self.rentProperty_label.textColor = UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1)
        booking_view.isHidden = true
        booking_view.isHidden = true
        freehold_view.isHidden = true
        name_textfield.isHidden = true
        mobile_textfield.isHidden = true
        alternate_no.isHidden = true
        price_textfield.isHidden = true
        bathroom_textfield.isHidden = true
        noOfBalconies_textfield.isHidden = true
        area_textfield.isHidden = true
        booking_textfield.isHidden = true
        address_textfield.isHidden = true
        lattitude_texfield.isHidden = true
        longitude_textfield.isHidden = true
        description_textfield.isHidden = true
        selectPropertyType_label.isHidden = true
        room_textfield.isHidden = true
        submitbtn.isHidden = true
        
        
        selectCity_textfield.isHidden = true
        basement_label.isHidden = true
        furnished_btn.isHidden = true
        totalFloor_textfield.isHidden = true
        sqtFeet_textfield.isHidden = true
        furnished_textfield.isHidden = true
        freeHold_textfield.isHidden = true
        description_textfield.isHidden = true
        basement_btn.isHidden = true
        apartment_btn.isHidden = true
        selectcitybtn.isHidden = true
        roomselectionbtn.isHidden = true
        areaselectionbtn.isHidden = true
        
        
        name1_textfield.isHidden = false
        mobile1_textfield.isHidden = false
        alternate_no1.isHidden = false
        price1_textfield.isHidden = false
        bathroom1_textfield.isHidden = false
        balconies1_textfield.isHidden = false
        area1_textfield.isHidden = false
        address1_textfield.isHidden = false
        longitude1_textfield.isHidden = false
        lattitude1_textfield.isHidden = false
        description1_textfield.isHidden = false
        basement1_label.isHidden = false
        totalfloor1_textfield.isHidden = false
        sqfeet1_textfield.isHidden = false
        furnished1_textfield.isHidden = false
        freehold1_textfield.isHidden = false
        description1_textfield.isHidden = false
        room1_textfield.isHidden = false
        
        selectproperty1_label.isHidden = false
        selectcity1_textfield.isHidden = false
        furnished1_btn.isHidden = false
        basementbtn1.isHidden = false
        apartmentbtn1.isHidden = false
        selectcitybtn1.isHidden = false
        roomselectionbtn1.isHidden = false
        areaselectionbtn1.isHidden = false
        submitbtn1.isHidden = false
        
        searchedCountry.removeAll()
        countryNameArr.removeAll()
        countrySearch.text = ""
        selectcity1_textfield.text = "Select City"
        self.setTableHeight()
        self.searchTableView.reloadData()
        
    }
    
    
    @IBAction func tap_apartmentbtn1(_ sender: Any) {
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .apartment1
        
        self.picker.reloadAllComponents()
    }
    @IBAction func tap_apartment_btn(_ sender: Any) {
        
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .apartment
        
        self.picker.reloadAllComponents()
    }
    
    @IBAction func tap_basementbtn1(_ sender: Any) {
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .basement1
        
        self.picker.reloadAllComponents()
    }
    @IBAction func tap_basement_btn(_ sender: Any) {
        
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .basement
        
        self.picker.reloadAllComponents()
    }
    
    @IBAction func tap_uploadImage_btn(_ sender: Any) {
        
        self.createActionSheet()
    }
    
    @IBAction func tap_roomselectionbtn1(_ sender: Any) {
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .room1
        
        self.picker.reloadAllComponents()
    }
    @IBAction func tap_roomSelection_btn(_ sender: Any) {
        
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .room
        
        self.picker.reloadAllComponents()
    }
    
    
    @IBAction func tap_areaselectionbtn1(_ sender: Any) {
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .area1
        
        self.picker.reloadAllComponents()
    }
    @IBAction func tap_areaSelection_btn(_ sender: Any) {
        
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .area
        
        self.picker.reloadAllComponents()
    }
    
    @IBAction func tap_freshHold_btn(_ sender: Any) {
        
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .freehold
        
        self.picker.reloadAllComponents()
    }
    
    @IBAction func tap_booking_btn(_ sender: Any) {
        
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .booking
        
        self.picker.reloadAllComponents()
    }
    
    @IBAction func tap_furnishedbtn1(_ sender: Any) {
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .furnished1
        
        
        self.picker.reloadAllComponents()
    }
    @IBAction func tap_furnished_btn(_ sender: Any) {
        
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .furnished
        
        
        self.picker.reloadAllComponents()
    }
    
    @IBAction func tap_selectcitybtn1(_ sender: Any) {
        //   if Connectivity.isConnectedToInternet() {
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .city1
        
        self.picker.reloadAllComponents()

    }
    
    @IBAction func tap_selectCity_btn(_ sender: Any) {
        //  if Connectivity.isConnectedToInternet() {
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .city
        
        self.picker.reloadAllComponents()

    }
    
    @IBAction func localityeditingbegin1(_ sender: Any) {
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .locality1
        
        self.picker.reloadAllComponents()
    }
    @IBAction func locality_editingBegin(_ sender: Any) {
        
        self.picker.isHidden = false
        self.toolbar.isHidden = false
        
        self.selectionType = .locality
        
        self.picker.reloadAllComponents()
    }
    
    
    @IBAction func tap_done_btn(_ sender: Any) {
        
        self.picker.isHidden = true
        self.toolbar.isHidden = true
        
        if self.selectionType == .city {
            
            getLocality_API(cityId: self.cityId)
        }
        else  if self.selectionType == .city1 {
            
            getLocality_API(cityId: self.cityId)
           // getLocality_API1(cityId: self.cityId)
        }
        else if self.selectionType == .locality {
            
         //   self.get(address: locality_textfield.text ?? "")
            
        }
        else if self.selectionType == .locality1 {
            
          //  self.get1(address: locality1_textfield.text ?? "")
            
            
        }
    }
    
    @IBAction func cancel_btn(_ sender: Any) {
        
        self.picker.isHidden = true
        self.toolbar.isHidden = true
    }
    
    
    @IBAction func tap_submit_btn(_ sender: Any) {
        submitbtn1.isEnabled = true
        submitbtn.isEnabled = false
        
        
        valuechk = "1"
        if  valuedata == "1"
        {
            
            self.imagupload()
            //   self.postProperty()
        }
        else
        {
            if validate() {
                self.imagupload()

            }
        }
    }
    
    @IBAction func submit1_btn(_ sender: Any) {
        submitbtn.isEnabled = true
        submitbtn1.isEnabled = false
        
        valuechk = "2"
        if validate1() {
            self.imagupload()
            
            //   self.postProperty()
            
            //   self.postProperty()
        }
        
    }
    
    //MARK:- Validation
    
    func validate() -> Bool  {
        
        if (totalFloor_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter floor size")
            return false
            
        }else if (name_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter name")
            return false
            
            
        }else if (mobile_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter mobile number")
            return false
            
        }
        else if !Validation.check.isValidMobileNumber((mobile_textfield.text ?? "")) {
            
            self.presentAlert(msg : "Enter valid Mobile")
            
            return false
            
        }
        
        
        //            else if alternate_no1.text?.count ?? 0 < 10 {
        //                       self.presentAlert(msg: "Please enter valid alternate number.")
        //                       return false
        //
        //                   }
        else if (price_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter price")
            return false
            
        }else if (bathroom_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter bathroom size")
            return false
            
        }else if (noOfBalconies_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter balcony")
            return false
            
        }else if (area_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter area")
            return false
            
            
        }else if (selectCity_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please select city")
            return false
            
        }else if (address_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter address")
            return false
            
        }else if (description_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter description")
            return false
        }else {
            
            return true
        }
    }
    
    func validate1() -> Bool  {
        
        if (totalfloor1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter floor size")
            return false
            
        }else if (name1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter name")
            return false
            
            
        }else if (mobile1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter mobile number")
            return false
            
        }
        else if !Validation.check.isValidMobileNumber((mobile1_textfield.text ?? "")) {
            
            self.presentAlert(msg : "Enter valid Mobile")
            
            return false
            
        }
        //            else if mobile_textfield.text?.count ?? 0 < 11 {
        //                self.presentAlert(msg: "Please enter valid mobile number.")
        //                return false
        
        // }
        //            else if alternate_no1.text?.count ?? 0 < 10 {
        //                       self.presentAlert(msg: "Please enter valid alternate number.")
        //                       return false
        //
        //                   }
        else if (price1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter price")
            return false
            
        }else if (bathroom1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter bathroom size")
            return false
            
        }else if (balconies1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter balcony")
            return false
            
        }else if (area1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter area")
            return false
            
            
        }else if (selectcity1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please select city")
            return false
            
        }else if (address1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter address")
            return false
            
        }else if (description1_textfield.text ?? "").replacingOccurrences(of: " ", with: "") == "" {
            
            self.presentAlert(msg: "Please enter description")
            return false
        }else {
            
            return true
        }
    }
    
    //MARK:- Get Address
    func get(address : String){
        
        //   IJProgressView.shared.showProgressView(self.view)
        //   self.view.isUserInteractionEnabled = false
        CLGeocoder().geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            //   IJProgressView.shared.hideProgressView()
            //       self.view.isUserInteractionEnabled = true
            if((error) != nil){
            }
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                self.long = (coordinates.longitude)
                self.lati = (coordinates.latitude)
                print(self.long)
                print(self.lati)
                
                self.lattitude_texfield.text = String(self.lati)
                self.longitude_textfield.text = String(self.long)
                
                // self.addressSeletion = true
            }
        })
    }
    
    func get1(address : String){
        
        //   IJProgressView.shared.showProgressView(self.view)
        //   self.view.isUserInteractionEnabled = false
        CLGeocoder().geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            //   IJProgressView.shared.hideProgressView()
            //       self.view.isUserInteractionEnabled = true
            if((error) != nil){
            }
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                self.long1 = (coordinates.longitude)
                self.lati1 = (coordinates.latitude)
                print(self.long1)
                print(self.lati1)
                
                self.lattitude1_textfield.text = String(self.lati1)
                print(self.lattitude1_textfield.text as Any)
                
                
                self.longitude1_textfield.text = String(self.long1)
                print(self.longitude1_textfield.text as Any)
                
                
                // self.addressSeletion = true
            }
        })
    }
    
    func editpostProperty() {
        let h_id = homeData?.id
        
        
        switch h_id {
            
        case .bool(let _):
            print("bool")
            
        case .int(let val):
            propertyId = String(val)
        case .string(let val) :
            propertyId = String(val)
            
        case .none:
            
            print("none")
            
        }
        print(propertyId)
        
        
        
        var param : [String:Any] = [ "house_name" : name_textfield.text! , "city" : selectCity_textfield.text! , "room_size" : room_textfield.text! , "house_area" : area_textfield.text! , "area_unit" : sqtFeet_textfield.text! , "name" : name_textfield.text! , "userid" :  Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" , "price" : price_textfield.text! , "mobile" : mobile_textfield.text! ,"alternativeNumber" : alternate_no.text!, "property_category" : sellOrRent , "property_type" : "residensial" , "bathroom_size" : bathroom_textfield.text! , "appartment_type" :  selectPropertyType_label.text! , "sel_type" : booking_textfield.text! , "society" : address_textfield.text! , "description" : description_textfield.text! , "owner_type" : freeHold_textfield.text! , "balconies" : noOfBalconies_textfield.text! , "property_floor" : basement_label.text! , "locality" : cityName,"room_type" : furnished_textfield.text! , "total_floor" : totalFloor_textfield.text!, "lat" : self.lati , "long" : self.long,"property_id" :propertyId,"price_per_unit_area":"","reg_no":"","url":"","corpet_area":"","is_location":false,"image":""]
        
        print(param)
        
        switch apiType {
            
        case .commercial:
            param.updateValue(carpet_textfield.text as Any, forKey: "corpet_area")
            
            
            param.updateValue("Commercial", forKey: "property_type")
            print(param)
            
            
        case .residential:
            
            
            param.updateValue("Residential", forKey: "property_type")
            
        case .none:
            break
        }
        
        switch saleRent {
            
        case .rent:
            param.updateValue("Commercial", forKey: "property_type")
            
        case .sale:
            
            param.updateValue("Commercial", forKey: "property_type")
        }
        
        
        ApiManager.apiPost(url:  Api.editpower_updateproperty, param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    self.localityModel = try JSONDecoder().decode(LocalityModel.self, from: data)
                    
                    self.localityArray = (self.localityModel?.data)
                    
                    if (self.localityModel?.code ?? "") == "200" {
                        
                        DispatchQueue.main.async {
                            self.presentAlert(msg: (self.cityModel?.msg ?? ""))
                        }
                    }
                    else {
                        
                        self.presentAlert(msg: (self.cityModel?.msg ?? ""))
                        
                        
                    }
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
    

    
    func imagupload(){
        let api_url = "http://reallworld.com/public/realworld/index.php/post_residentialproperty"
        guard let url = URL(string: api_url) else {
            return
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0 * 1000)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var param : [String:Any] = [:]
        if valuechk == "1"
        {
            param = ["key": "5642vcb546gfnbvb7r6ewc211365v13122","house_name" : name_textfield.text! , "city" : selectCity_textfield.text! , "room_size" : room_textfield.text! , "house_area" : area_textfield.text! , "area_unit" : sqtFeet_textfield.text! , "name" : name_textfield.text! , "userid" :  Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" , "price" : price_textfield.text! , "mobile" : mobile_textfield.text! ,"alternativeNumber" : alternate_no.text!, "property_category" : "Sell Property", "property_type" : "Residential" , "bathroom_size" : bathroom_textfield.text! , "appartment_type" :  selectPropertyType_label.text! , "sel_type" : booking_textfield.text!.lowercased() , "society" : address_textfield.text! , "description" : description_textfield.text! , "owner_type" : freeHold_textfield.text! , "balconies" : noOfBalconies_textfield.text! , "property_floor" : basement_label.text! , "locality" : cityName ,"room_type" : furnished_textfield.text! , "total_floor" : totalFloor_textfield.text!, "lat" : "\(self.lati)" , "lng" : "\(self.long)","corpet_area" :"","price_per_unit_area":"","reg_no":"","url":"", "image" : image_array]
        }else if valuechk == "2"
        {
            print(totalfloor1_textfield.text as Any)
            param = ["key": "5642vcb546gfnbvb7r6ewc211365v13122","house_name" : name1_textfield.text! , "city" : selectcity1_textfield.text! , "room_size" : room1_textfield.text! , "house_area" : area1_textfield.text! , "area_unit" : sqfeet1_textfield.text! , "name" : name1_textfield.text! , "userid" :  Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" , "price" : price1_textfield.text! , "mobile" : mobile1_textfield.text! ,"alternativeNumber" : alternate_no1.text!, "property_category" :"Rent Out Property" , "property_type" : "Residential" , "bathroom_size" : bathroom1_textfield.text! , "appartment_type" :  selectproperty1_label.text! , "sel_type" : booking1_textfield.text!.lowercased() , "society" : address1_textfield.text! , "description" : description1_textfield.text! , "owner_type" : freeHold_textfield.text! , "balconies" : balconies1_textfield.text! , "property_floor" : basement1_label.text! , "locality" : cityName ,"room_type" : furnished1_textfield.text! , "total_floor" : totalfloor1_textfield.text!, "lat" : lattitude1_textfield.text! , "lng" : longitude1_textfield.text!,"corpet_area" :"","price_per_unit_area":"","reg_no":"","url":"", "image" : image_array]
        }
        
        
        //Set Image Data
        print(param)
        switch apiType {
        case .commercial:
            param.updateValue(carpet_textfield.text ?? ""  as Any, forKey: "corpet_area")
            param.updateValue("Commercial", forKey: "property_type")
            param.updateValue("Sell Commercial Property", forKey: "property_category")
        case .residential:
            
            param.updateValue("Residential", forKey: "property_type")
            
        case .none:
            break
        }
        
        AF.upload(multipartFormData: { multiPart in
            if self.image_array.count > 0 {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat="yyyymmddhhmmss"
                //  let stringDate = dateFormatter.string(from: NSDate() as Date)
                for a in 0..<self.image_array.count {
                    
                    let image12 = self.image_array[a]
                    let timeStamp = Date().timeIntervalSince1970 * 1000
                    let fileName = "image\(timeStamp).png"
                    multiPart.append(image12.jpegData(compressionQuality: 0.3)!, withName: "image[]", fileName: fileName , mimeType: "image/png")
                    
                }
            }
            for (key, value) in param {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key )
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key )
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                        if let num = element as? Int {
                            let value = "\(num)"
                            multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            
            
            //   multiPart.append(imgData!, withName: "image", fileName: "file.jpg", mimeType: "image/jpeg")
        }, with: urlRequest)
        .uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
        })
        .responseJSON(completionHandler: { data in
            
            switch data.result {
                
            case .success(_):
                do {
                    
                    let dictionary = try JSONSerialization.jsonObject(with: data.data!, options: .fragmentsAllowed) as! NSDictionary
                    // completion(data)
                    print("Success!")
                    let alert = UIAlertController(title: "Reall World", message: "Our team will contact you shortly.Thank you.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.present(alert, animated: true)
                    //  }
                    // self.presentAlert(msg: (self.cityModel?.msg ?? ""))
                    
                    print(dictionary)
                }
                catch {
                    // catch error.
                    print("catch error")
                    
                }
                break
                
            case .failure(_):
                print("failure")
                
                break
                
            }
            
            
        })
    }
    
    func postProperty() {
        
        
        param = ["key": "5642vcb546gfnbvb7r6ewc211365v13122","house_name" : name_textfield.text! , "city" : selectCity_textfield.text! , "room_size" : room_textfield.text! , "house_area" : area_textfield.text! , "area_unit" : sqtFeet_textfield.text! , "name" : name_textfield.text! , "userid" :  Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" , "price" : price_textfield.text! , "mobile" : mobile_textfield.text! ,"alternativeNumber" : alternate_no.text!, "property_category" : sellOrRent , "property_type" : "Residential" , "bathroom_size" : bathroom_textfield.text! , "appartment_type" :  selectPropertyType_label.text! , "sel_type" : booking_textfield.text!.lowercased() , "society" : address_textfield.text! , "description" : description_textfield.text! , "owner_type" : freeHold_textfield.text! , "balconies" : noOfBalconies_textfield.text! , "property_floor" : basement_label.text! , "locality" : cityName ,"room_type" : furnished_textfield.text! , "total_floor" : totalFloor_textfield.text!, "lat" : self.lati , "lng" : self.long,"corpet_area" :"","price_per_unit_area":"","reg_no":"","url":"","image":""]
        // param?.updateValue("5642vcb546gfnbvb7r6ewc211365v13122", forKey: "key")
        print(param)
        switch apiType {
        case .commercial:
            param.updateValue(carpet_textfield.text ?? ""  as Any, forKey: "corpet_area")
            param.updateValue("Commercial", forKey: "property_type")
            param.updateValue("Sell Commercial Property", forKey: "property_category")
        case .residential:
            
            param.updateValue("Residential", forKey: "property_type")
            
        case .none:
            break
        }
        
        
        
        
        ApiManager.apiPost(url:  Api.postProperty, param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    self.localityModel = try JSONDecoder().decode(LocalityModel.self, from: data)
                    
                    self.localityArray = (self.localityModel?.data)
                    
                    if (self.localityModel?.code ?? "") == "200" {
                        
                        DispatchQueue.main.async {
                            
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                    else {
                        
                        self.presentAlert(msg: (self.cityModel?.msg ?? ""))
                        
                        
                    }
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
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
                    
                    DispatchQueue.main.async {
                        
                        self.image_collectionView.reloadData()
                    }
                    
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
    func getLocality_API(cityId : String) {
        
        self.countryNameArr.removeAll()
        self.searchedCountry.removeAll()
        
        let param : [String:Any] = [ "city_id" : cityId ]
        
        print(param)
        
        ApiManager.apiPost(url:  Api.getLocality, param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    self.localityModel = try JSONDecoder().decode(LocalityModel.self, from: data)
                    self.localityArray = (self.localityModel?.data)
                    
                    if (self.localityModel?.code ?? "") == "200" {
                       
                        for item in  0...self.localityArray!.count - 1 {
                            self.countryNameArr.append((self.localityArray?[item].localityName)!)
                        }
                        
                        if self.countryNameArr.count != 0 {
                            self.searchTableHeightConstraint.constant = 200
                        }
                        else {
                            self.searchTableHeightConstraint.constant = 0

                        }
                        
                        self.searchTableView.reloadData()
                        
                    }
                    else {
                        
                        if Connectivity.isConnectedToInternet() {}
                        
                        else {
                            let alert = UIAlertController(title: "Color Picker", message: "Please Check your Internet Connection", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true)
                        }
                        //  self.presentAlert(msg: (self.cityModel?.msg ?? ""))
                    }
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
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
                        
                        
                    }
                    else {
                        
                        //self.presentAlert(msg: (self.cityModel?.msg ?? ""))
                    }
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
}
extension PostPropertyViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if valuedata == "1"
        {
            return self.bannerModel?.first?.data?.count ?? 0
            
        }
        else
        {
            return image_array.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.image_collectionView.dequeueReusableCell(withReuseIdentifier: "PostPropertyCollectionViewCell", for: indexPath) as! PostPropertyCollectionViewCell
        objCell = cell
        
        if valuedata == "1"
        {
            
            cell.upload_imageView.contentMode = .scaleAspectFill
            cell.upload_imageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            cell.upload_imageView.contentMode = .scaleAspectFill
            
            let url = self.bannerModel?.first?.data?[indexPath.row].image ?? ""
            cell.upload_imageView.sd_setImage(with: URL(string: url))
            
        }
        
        else
        {
            cell.container_view.clipsToBounds = true
            
            cell.upload_imageView.clipsToBounds = true
            
            cell.upload_imageView.contentMode = .scaleAspectFill
            
            cell.upload_imageView.image = image_array[indexPath.row]
            
            //for delete button
            cell.deleteButton.tag = indexPath.row
            cell.deleteButton.addTarget(self, action: #selector(deleteButtonAction(_sender:)), for: .touchUpInside)
        }
        
        return cell
    }
    
    
    
    @objc func deleteButtonAction(_sender: UIButton) {
        image_array.remove(at: _sender.tag)
        
        if image_array.isEmpty == true {
            
            imageCollectionView_top.constant = 0
            imageCollectionView_height.constant = 0
        }
        image_collectionView.reloadData()
    }
    
}
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
    return CGSize(width: 158, height: 280)
}
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    return CGSize(width:image_collectionView.frame.width, height: 150)
//      }
extension PostPropertyViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch selectionType {
        case .apartment:
            
            return apartment_Array.count
        case .apartment1:
            
            return apartment_Array.count
            
        case .area:
            
            return area_Array.count
            
        case .basement:
            
            return basement_Array.count
            
        case .booking:
            
            return booking_Array.count
            
        case .city:
            
            return self.cityModel?.data?.count ?? 0
            
        case .freehold:
            
            return freehold_Array.count
            
        case .furnished:
            
            return furnished_Array.count
            
        case .furnished1:
            
            return furnished_Array1.count
            
        case .room:
            
            return room_Array.count
            
        case .locality:
            
            return localityArray?.count ?? 0
        case .basement1:
            return basement_Array.count
        case .city1:
            return self.cityModel?.data?.count ?? 0
        case .locality1:
            return localityArray?.count ?? 0
            
        case .room1:
            return room_Array.count
            
        case .area1:
            return area_Array.count
            
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        switch selectionType {
        case .apartment:
            
            return apartment_Array[row]
            
        case .area:
            
            return area_Array[row]
            
        case .basement:
            
            return basement_Array[row]
            
        case .booking:
            
            return booking_Array[row]
            
        case .city:
            
            return self.cityModel?.data?[row].cityName ?? ""
            
        case .freehold:
            
            return freehold_Array[row]
            
        case .furnished:
            
            return furnished_Array[row]
        case .furnished1:
            
            return furnished_Array1[row]
            
        case .room:
            
            return room_Array[row]
            
        case .locality:
            
            return localityArray?[row].localityName ?? ""
        case .apartment1:
            return apartment_Array[row]
            
        case .basement1:
            return basement_Array[row]
        case .city1:
            return self.cityModel?.data?[row].cityName ?? ""
            
        case .locality1:
            return localityArray?[row].localityName ?? ""
            
        case .room1:
            return room_Array[row]
            
        case .area1:
            return area_Array[row]
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        switch selectionType {
        case .apartment:
            
            selectPropertyType_label.text = apartment_Array[row]
            
        case .area:
            
            sqtFeet_textfield.text = area_Array[row]
            
            
        case .basement:
            
            basement_label.text = basement_Array[row]
            
            // basement_btn.setTitle(basement_Array[row], for: .normal)
            
        case .booking:
            
            booking_textfield.text = booking_Array[row]
            booking1_textfield.text = booking_Array[row]
            
            
        case .city:
            
            selectCity_textfield.text = (self.cityModel?.data?[row].cityName ?? "")
            
            self.cityId = String(self.cityModel?.data?[row].id ?? -1)
            
        case .freehold:
            
            freeHold_textfield.text = freehold_Array[row]
            freehold1_textfield.text = freehold_Array[row]
            
            
        case .furnished:
            
            furnished_textfield.text = furnished_Array[row]
            
        case .furnished1:
            furnished1_textfield.text = furnished_Array1[row]
            
        case .room:
            
            room_textfield.text = room_Array[row]
            
            
        case .locality:
            print("*(*")

           // locality_textfield.text = localityArray?[row].localityName ?? ""
            
        case .apartment1:
            selectproperty1_label.text = apartment_Array[row]
            
        case .basement1:
            basement1_label.text = basement_Array[row]
            
        case .city1:
            selectcity1_textfield.text = (self.cityModel?.data?[row].cityName ?? "")
            self.cityId = String(self.cityModel?.data?[row].id ?? -1)
            
            
        case .locality1:
            print("*(*")
          //  locality1_textfield.text = localityArray?[row].localityName ?? ""
            
        case .room1:
            room1_textfield.text = room_Array[row]
            
        case .area1:
            sqfeet1_textfield.text = area_Array[row]
            
        }
    }
}



extension PostPropertyViewController {
    
    //MARK:- Image Picker
    
    func createActionSheet()
    {
        actionSheet = UIAlertController(title: nil, message: "Add Photo", preferredStyle: UIAlertController.Style.actionSheet)
        
        for i in 0..<imageOption.count
        {
            let action = UIAlertAction(title: imageOption[i] as String, style: .default, handler: {
                _ in
                self.performAction(index: i)
            })
            actionSheet.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {(alert : UIAlertAction!) -> Void in
        })
        actionSheet.addAction(cancelAction)
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
        {
            actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height, width: 1.0, height: 1.0)
        }
        actionSheet.popoverPresentationController?.sourceView = self.view
        present(actionSheet, animated: true, completion: nil)
    }
    
    func performAction(index : Int)
    {
        switch index
        {
        case 0:
            openCamera()
            
        case 1:
            openGallery()
        default :
            print("action")
            
        }
    }
    
    func openGallery()
    {
        //        image_array.removeAll()
        //        SelectedAssests.removeAll()
        ////                   image_picker.allowsEditing = false
        ////          image_picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        ////             present(image_picker, animated: true, completion: nil)
        ////    let imagePicker = OpalImagePickerController()
        ////    imagePicker.imagePickerDelegate = self
        ////        imagePicker.maximumSelectionsAllowed = 20
        //
        let imagePicker = ImagePickerController()
        
        imagePicker.settings.selection.max = 20
        imagePicker.settings.theme.selectionStyle = .numbered
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image, .video]
        imagePicker.settings.selection.unselectOnReachingMax = true
        
        let start = Date()
        self.presentImagePicker(imagePicker, select: { (asset) in
            print("Selected: \(asset)")
            
        }, deselect: { (asset) in
            print("Deselected: \(asset)")
        }, cancel: { (assets) in
            print("Canceled with selections: \(assets)")
        }, finish: { (assets) in
            
            for i in 0..<assets.count
            {
                self.SelectedAssests.append(assets[i])
            }
            self.convertAssestToimages()
            print("Finished with selections: \(assets)")
        }, completion: {
            let finish = Date()
            print(finish.timeIntervalSince(start))
        })
        //        image_picker.allowsEditing = false
        //              image_picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        //                 present(image_picker, animated: true, completion: nil)
    }
    
    func convertAssestToimages() -> Void
    {
        if  SelectedAssests.count != 0
        {
            for i in 0..<SelectedAssests.count
            {
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var thumbnail = UIImage()
                option.isSynchronous = true
                
                manager.requestImage(for: SelectedAssests[i], targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: option,  resultHandler:{(result, info)->Void in
                    thumbnail = result!
                    
                })
                self.image_array.append(thumbnail)
                
                image_collectionView.isHidden = false
                
                imageCollectionView_height.constant = 200
                
                imageCollectionView_top.constant = 16
                
                //  dismiss(animated: true, completion: nil)
                
                image_collectionView.reloadData()
                
            }
        }
    }
    func imagePickerDidCancel(_ picker: OpalImagePickerController) {
        //Cancel action?
        presentedViewController?.dismiss(animated: true, completion: nil)
        
    }
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]){
        print(images)
        // self.arryOfImages = images
        //           self.image_array.append(contentsOf: images)
        self.image_array = images
        imagePicker.dismiss(animated: true, completion: nil)
        //               for img in images {
        //                   self.imagesource.append(ImageSource(image:  img))
        //               }
        self.image_collectionView.isHidden = false
        self.imageCollectionView_height.constant = 200
        self.imageCollectionView_top.constant = 16
        imagePicker.dismiss(animated: true, completion: nil)
        self.image_collectionView.reloadData()
        //    picker.dismiss(animated: true, completion: nil)
        presentedViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    func openCamera()
    {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            image_picker.allowsEditing = false
            image_picker.sourceType = UIImagePickerController.SourceType.camera
            image_picker.cameraCaptureMode = .photo
            present(image_picker, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Camera Not Found", message: "This Device Has No Camera", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //   print(info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage)
        
        guard let img = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage else { return  }
        
        image_array.append(img)
        
        image_collectionView.isHidden = false
        
        imageCollectionView_height.constant = 200
        
        imageCollectionView_top.constant = 16
        
        dismiss(animated: true, completion: nil)
        
        image_collectionView.reloadData()
    }
}

