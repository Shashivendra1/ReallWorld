//
//  SearchComericalVC.swift
//  RealWorld
//
//  Created by Arthtech Supports on 08/02/21.
//  Copyright © 2021 ArthTech Solutions. All rights reserved.
//

import UIKit
import RangeSeekSlider

enum SearchBy1 {
    case commercial
}

var imagesearch1 = "All"
var sqfeet1 = "Sq.yards"
var floorji1 = ""
var room1 = "All"
var comProperty1 = "All"
//var p21 = "1000000000"
var areaMaximum1 = "10000"
var areaMinimum1 = "0"
//var lowerValue11 = "0"
var higherValue11 = "1000000000"
var higherValue12 = "2000000"
var lowerValue11 = "0"
var lowerValue12 = "0"

var selectedCityArray1 : [String] = []
var buySelected1 = true
var buyCityArr1 = [String]()
var rentCityArr1 = [String]()
var buyPressed = true

var searchCityName = [String]()
var searchIdName = [String]()


class SearchComericalVC: BaseViewController, SelectedItem,RangeSeekSliderDelegate {
    
    
    @IBOutlet weak var showCityListCollectionView: UICollectionView!
    @IBOutlet weak var seachCityView: UIView!
    @IBOutlet weak var seacrhCityHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var selectCityView: UIView!
    
    @IBOutlet weak var propertytype_btn1: UIButton!
    @IBOutlet weak var propertytype_btn: UIButton!
    @IBOutlet weak var btnRent: UIButton!
    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var collection_height: NSLayoutConstraint!
    
    
    @IBOutlet weak var lblRentMinimum: UILabel!
    @IBOutlet weak var search_view: UIView!
    
    @IBOutlet weak var lblLakh: UILabel!
    @IBOutlet weak var property_view: UIView!
    
    @IBOutlet weak var bedroom_view: UIView!
    
    @IBOutlet weak var bedroom_height: NSLayoutConstraint!
    
    @IBOutlet weak var bedroom_top: NSLayoutConstraint!
    
    @IBOutlet weak var area_view: UIView!
    
    @IBOutlet weak var area_height: NSLayoutConstraint!
    
    @IBOutlet weak var area_top: NSLayoutConstraint!
    
    
    @IBOutlet weak var buy_label: UILabel!
    
    @IBOutlet weak var rent_label: UILabel!
    
    @IBOutlet weak var rentSelectionLine_view: UIView!
    
    @IBOutlet weak var buySelection_view: UIView!
    
    @IBOutlet weak var sq_view: UIView!
    
    
    @IBOutlet weak var search_textfield: UITextField!
    
    @IBOutlet weak var Searchcomproperty_lbl1: UILabel!
    
    @IBOutlet weak var Searchcomproperty_lbl: UILabel!
    
    @IBOutlet weak var selectedRoomType_label1: UILabel!
    
    @IBOutlet weak var selectedRoomType_label: UILabel!
    
    @IBOutlet weak var area_slider: RangeSeekSlider!
    
    @IBOutlet weak var budget_slider: RangeSeekSlider!
    
    @IBOutlet weak var budgetMinimuPrice_label: UILabel!
    
    @IBOutlet weak var areaminimum_thousandlbl: UILabel!
    @IBOutlet weak var areamaximumthousand_lbl: UILabel!
    @IBOutlet weak var budgetMaximumPrice_label: UILabel!
    
    @IBOutlet weak var areaMinimumPrice_label: UILabel!
    @IBOutlet weak var slider_thousand: RangeSeekSlider!
    @IBOutlet weak var sliderLakh: RangeSeekSlider!
    //@IBOutlet weak var areaMaximumPrice_label: RangeSeekSlider!
    @IBOutlet weak var areaMaximumPrice_label: UILabel!
    @IBOutlet weak var search_tebleView: UITableView!
    @IBOutlet weak var city_collectionView: UICollectionView!
    @IBOutlet weak var sqt_label1: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var sqt_label: UILabel!
    @IBOutlet weak var furnished_label: UILabel!
    @IBOutlet weak var imageSelection_label1: UILabel!
    @IBOutlet weak var furnished_label1: UILabel!
    @IBOutlet weak var imageSelection_label: UILabel!
    @IBOutlet weak var floorcomlabel: UILabel!
    var objcell = SelectedCityCollectionViewCell()
    
    var rentselected = false
    
    @IBOutlet weak var floorcomlabel1: UILabel!
    var page = 1
    var sliderchkvalue = "1"
    let arr = [UserDefaults.standard.value(forKey: "cityName")]
    let arr1 = [UserDefaults.standard.value(forKey: "cityName1")]
    
    
    var areaMinimum = "0"
    
    var areaMaximum = "10000"
    var comesfromResenditial = true
    var searchBy1 : SearchBy = .commercial
    var owner_array = [String]()
    var selectedRooms = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk,Plot"
    var selctionType : FieldType = .propertyType
    
    var apartment_Array = ["All","Apartment","Service Apartment","Builder floor","Plot/Land","House/Villa","Farmhouse"]
    var commercialProperty = ["All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"]
    //         var apartment_Array2 = ["Office Space","Co-working Office", "Commercial Lands/Plots", "Hotel/Resorts", "Guest-House/Banquet-Halls", "Shop/Showroom", "Industrial land", "Agriculture/Farmland", "Factory", "Warehouse"]
    var room_Array = ["All","1 Room/Studio Apartment","1 Bhk","2 Bhk","3 Bhk","4 Bhk","5 Bhk","5+","Plot"]
    
    var floor_Array = ["All","Basement","Ground","Lower Ground","Duplex","Bungalow","1","2","3","4","5","6","7","8" ,"9","10","11","12","14","15","16","17","18","19","20+","BMT+GF"]
    var floor_Array1 = ["All","Basement","Ground","Lower Ground","Duplex","1","2","3","4","5","6","7","8" ,"9","10","11","12","14","15","16","17","18","19","20+","BMT+GF","Entire Building"]
    var furnished_Array = ["All","Furnished","Semifurnished","Unfurnished"]
    
    var imageSelection_Array = ["All","With Images"]
    
    var homeScreenModel : HomeScreenModel?
    
    var cityModel : CityModel?
    
    var link = ""
    
    var alreadySelected = ""
    var chkvalue = "2"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectCityView.layer.cornerRadius = 10
        selectCityView.layer.borderWidth = 2
        selectCityView.layer.borderColor = UIColor.darkGray.cgColor
        showCityListCollectionView.dataSource = self
        showCityListCollectionView.delegate = self
        seacrhCityHeightConstraint.isActive = true
        seacrhCityHeightConstraint.constant = 0
        
        seachCityView.layer.borderWidth = 2
        seachCityView.layer.cornerRadius = 8
        seachCityView.layer.borderColor = UIColor.darkGray.cgColor
        
        UserDefaults.standard.set(sqt_label.text, forKey: "sqdatacom")
        UserDefaults.standard.set(furnished_label.text, forKey: "furnishedcom")
        UserDefaults.standard.set(imageSelection_label.text, forKey: "imagecom")
        //   UserDefaults.standard.set(floorcomlabel1.text, forKey: "floordatacom1")  floorSelectionRent1
        //Mark: abChange
        UserDefaults.standard.set(floorcomlabel1.text, forKey: "floorSelectionRent1")
        UserDefaults.standard.set(sqt_label1.text, forKey: "sqdatacom1")
        UserDefaults.standard.set(furnished_label1.text, forKey: "furnishedcom1")
        UserDefaults.standard.set(imageSelection_label1.text, forKey: "imagecom1")
        UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
        UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
        UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
        
        UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
        UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
        UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
        UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
        UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
        viewDidData()
        
        
        selectedCityArray = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
        buyCityArr = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .purple
        viewDidData()
        //        switch searchBy1 {
        
        //case .commercial:
        
        self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Commercial Search", bgColor: .clear, barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
        rent_label.text = "LEASE COMMERCIAL"
        buy_label.text = "BUY COMMERCIAL"
        
        //        floorcomlabel.text = "Floor Preference"
        //               floorcomlabel1.text = "Floor Preference"
        
        
        
        
        if chkvalue == "2"
        {
            
            buyBtnData1()
            
        }
        
        
        else if chkvalue == "3"
        {
            
            
            //        UserDefaults.standard.value(forKey: "linerent")
            //        UserDefaults.standard.value(forKey: "btnrent")
            selectedRoomType_label1.text = UserDefaults.standard.value(forKey: "roomvalue1") as? String
            Searchcomproperty_lbl1.text = UserDefaults.standard.value(forKey: "propertyvaluecom1") as? String
            Searchcomproperty_lbl.text = UserDefaults.standard.value(forKey: "propertyvaluecom") as? String
            
            floorcomlabel.text =  UserDefaults.standard.value(forKey: "floordatacom") as? String
            floorcomlabel1.text =  UserDefaults.standard.value(forKey: "floordatacom1") as? String
            sqt_label1.text = UserDefaults.standard.value(forKey: "sqdatacom1") as? String
            furnished_label1.text = UserDefaults.standard.value(forKey: "furnishedcom1") as? String
            areaMaximum = UserDefaults.standard.value(forKey: "areaMaximumcom") as? String ?? ""
            areaMinimum = UserDefaults.standard.value(forKey: "areaMinimumcom") as? String ?? ""
            lowerValue11 = UserDefaults.standard.value(forKey: "lowerValuecom") as? String ?? ""
            higherValue11 = UserDefaults.standard.value(forKey: "higherValuecom") as? String ?? ""
            areaMaximum1 = UserDefaults.standard.value(forKey: "areaMaximumcom1") as? String ?? ""
            areaMinimum1 = UserDefaults.standard.value(forKey: "areaMinimumcom1") as? String ?? ""
            lowerValue12 = UserDefaults.standard.value(forKey: "lowerValuecom1") as? String ?? ""
            higherValue12 = UserDefaults.standard.value(forKey: "higherValuecom1") as? String ?? ""
            
            
            //            lblRentMinimum.text = "0"
            //            lblLakh.text = "20 Lacs +"
            //            areaMinimumPrice_label.text = "0"
            //            areaMaximumPrice_label.text = "10000+"
            sliderLakh.isHidden = false
            slider_thousand.isHidden = true
            budget_slider.isHidden = false
            lblLakh.isHidden = false
            areamaximumthousand_lbl.isHidden = false
            areaminimum_thousandlbl.isHidden = false
            areaMaximumPrice_label.isHidden = true
            areaMaximumPrice_label.isHidden = true
            
            lblRentMinimum.isHidden = false
            budgetMinimuPrice_label.isHidden = true
            budgetMaximumPrice_label.isHidden = true
            selectedRoomType_label1.isHidden = false
            selectedRoomType_label.isHidden = true
            Searchcomproperty_lbl1.isHidden = false
            Searchcomproperty_lbl.isHidden = true
            floorcomlabel.isHidden = true
            floorcomlabel1.isHidden = false
            sqt_label.isHidden = true
            sqt_label1.isHidden = false
            furnished_label.isHidden = true
            furnished_label1.isHidden = false
        }
        
        print("ree")
        if rentselected == true
        {
            rentBtnData()
            btnRent.titleLabel?.textColor = UIColor.green
            btnBuy.titleLabel?.textColor = UIColor.gray
            //                                 lblRentMinimum.text = "0"
            //                                 lblLakh.text = "20 Lacs +"
            //                                 areaMinimumPrice_label.text = "0"
            //                                 areaMaximumPrice_label.text = "10000+"
            areaMaximumPrice_label.isHidden = true
            areaMinimumPrice_label.isHidden = false
            lblLakh.isHidden = false
            lblRentMinimum.isHidden = false
            
            
        }
        else
        {
            buyBtnData1()
            btnRent.titleLabel?.textColor = UIColor.gray
            btnBuy.titleLabel?.textColor = UIColor.green
            //                                 areaMinimumPrice_label.text = "0"
            //                                        areaMaximumPrice_label.text = "10000+"
            //                                        budgetMinimuPrice_label.text = "0"
            //                                        budgetMaximumPrice_label.text = "100 Crore +"
            areaMaximumPrice_label.isHidden = false
            areaMinimumPrice_label.isHidden = false
            budgetMaximumPrice_label.isHidden = false
            
        }
        
    }
    func buyBtnData1(){
        //        UserDefaults.standard.value(forKey: "linebuy")
        //        UserDefaults.standard.value(forKey: "btnbuy")
        chkvalue = "2"
        
        buySelected = true
        if buySelected == true{
            selectedCityArray.removeAll()
            
            selectedCityArray = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
        }
        else{
            selectedCityArray.removeAll()
            
            selectedCityArray = UserDefaults.standard.value(forKey: "rent") as? [String] ?? []
            
        }
        budget_slider.isHidden = false
        
        sliderLakh.isHidden = true
        slider_thousand.isHidden = true
        
        
        lowerValue11 = "0"
        higherValue11 = "1000000000"
        //            areaMinimumPrice_label.text = "0"
        //            areaMaximumPrice_label.text = "10000+"
        //            budgetMinimuPrice_label.text = "0"
        //            budgetMaximumPrice_label.text = "100 Crore +"
        areaMaximumPrice_label.isHidden = false
        areaMinimumPrice_label.isHidden = false
        areamaximumthousand_lbl.isHidden = true
        areaminimum_thousandlbl.isHidden = true
        lblRentMinimum.isHidden = true
        lblLakh.isHidden = true
        budgetMinimuPrice_label.isHidden = false
        budgetMaximumPrice_label.isHidden = false
        areaminimum_thousandlbl.isHidden = true
        
        
        
        search_tebleView.reloadData()
        city_collectionView.reloadData()
        selectedRoomType_label.isHidden = false
        selectedRoomType_label1.isHidden = true
        Searchcomproperty_lbl.isHidden = false
        Searchcomproperty_lbl1.isHidden = true
        floorcomlabel.isHidden = false
        floorcomlabel1.isHidden = true
        sqt_label.isHidden = false
        sqt_label1.isHidden = true
        furnished_label.isHidden = false
        furnished_label1.isHidden = true
        imageSelection_label.isHidden = false
        imageSelection_label1.isHidden = true
        //         objcell.data_label.isHidden = false
        //        objcell.data_label1.isHidden = true
        //
        //        objcell.data_label.text =  UserDefaults.standard.value(forKey: "cityName") as? String
        //        objcell.data_label1.text =  UserDefaults.standard.value(forKey: "cityName1") as? String
        floorcomlabel.text =  UserDefaults.standard.value(forKey: "floordatacom") as? String
        floorcomlabel1.text =  UserDefaults.standard.value(forKey: "floordatacom1") as? String
        Searchcomproperty_lbl.text = UserDefaults.standard.value(forKey: "propertyvaluecom") as? String
        Searchcomproperty_lbl1.text = UserDefaults.standard.value(forKey: "propertyvaluecom1") as? String
        selectedRoomType_label.text = UserDefaults.standard.value(forKey: "roomvalue") as? String
        selectedRoomType_label1.text = UserDefaults.standard.value(forKey: "roomvalue1") as? String
        furnished_label1.text = UserDefaults.standard.value(forKey: "furnishedcom1") as? String
        furnished_label.text = UserDefaults.standard.value(forKey: "furnishedcom") as? String
        
        print(selectedRoomType_label.text as Any)
        sqt_label.text = UserDefaults.standard.value(forKey: "sqdatacom") as? String
        sqt_label1.text = UserDefaults.standard.value(forKey: "sqdatacom1") as? String
        imageSelection_label.text = UserDefaults.standard.value(forKey: "imagecom") as? String
        imageSelection_label1.text = UserDefaults.standard.value(forKey: "imagecom1") as? String
        areaMaximum = UserDefaults.standard.value(forKey: "areaMaximumcom") as? String ?? ""
        areaMinimum = UserDefaults.standard.value(forKey: "areaMinimumcom") as? String ?? ""
        lowerValue11 = UserDefaults.standard.value(forKey: "lowerValuecom") as? String ?? ""
        higherValue11 = UserDefaults.standard.value(forKey: "higherValuecom") as? String ?? ""
        areaMaximum1 = UserDefaults.standard.value(forKey: "areaMaximumcom1") as? String ?? ""
        areaMinimum1 = UserDefaults.standard.value(forKey: "areaMinimumcom1") as? String ?? ""
        lowerValue12 = UserDefaults.standard.value(forKey: "lowerValuecom1") as? String ?? ""
        higherValue12 = UserDefaults.standard.value(forKey: "higherValuecom1") as? String ?? ""
        
        propertytype_btn.isHidden = true
        propertytype_btn1.isHidden = false
        
        
        setBuyRent(buy:UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), rent: UIColor.black , buyLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1) , rentLine : UIColor.clear)
        
        // self.budgetMaximumPrice_label.text = "100 Crore +"
        switch searchBy1
        {
        case .commercial:
            link = Api.searchBuyCommercial
            
        case .residential:
            
            link = Api.searchBuyResidential
        }
        
    }
    override func viewWillLayoutSubviews() {
        
        search_view.setView(borderWidth: 2, borderColor: .darkGray, cornerRadius: 5)
        
        property_view.setView(borderWidth: 2, borderColor: .darkGray, cornerRadius: 5)
        
        bedroom_view.setView(borderWidth: 2, borderColor: .darkGray, cornerRadius: 5)
        
        sq_view.setView(borderWidth: 2, borderColor: .darkGray, cornerRadius: 5)
        
    }
    
    func viewDidData(){
        var arr : [String] = []
        if propertyaray.contains("All")
        {
            arr.append("All")
        }
        else
        {
            for i in 0..<propertyaray.count
            {
                
                arr.append(propertyaray[i])
                
            }
        }
        budget_slider.delegate = self
        sliderLakh.delegate = self
        slider_thousand.delegate = self
        area_slider.delegate = self
        sliderLakh.isHidden = true
        slider_thousand.isHidden = true
        budget_slider.isHidden = false
        lblLakh.isHidden = false
        lblRentMinimum.isHidden = false
        budgetMinimuPrice_label.isHidden = true
        budgetMaximumPrice_label.isHidden = true
        areaminimum_thousandlbl.isHidden = true
        areamaximumthousand_lbl.isHidden = true
        
        setBuyRent(buy:UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), rent: UIColor.black , buyLine :UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1) , rentLine : UIColor.clear)
        print(self.area_slider.minValue)
        print(self.area_slider.maxValue)
        if selectedCityArray.count != 0 {
            collection_height.constant = 80
            city_collectionView.isHidden = false
        }
        else
        {
            collection_height.constant = 0
            city_collectionView.isHidden = true
        }
        
        
        search_tebleView.delegate = self
        search_tebleView.dataSource = self
        city_collectionView.delegate = self
        city_collectionView.dataSource = self
        
        picker.delegate = self
        
        picker.dataSource = self
        
        picker.isHidden = true
        
        toolbar.isHidden = true
        
        search_tebleView.isHidden = true
        
        switch searchBy1 {
            
        case .commercial:
            owner_array =  ["Sq.ft","Sq.yards","Sq.meter", "Acres" , "Marla" , "Cents" , "Bigha" , "Kotha" , "Grounds" , "Hectare" ]
            sqt_label.text = "Sq.ft"
            self.bedroom_view.isHidden = true
            self.bedroom_height.constant = 0
            self.bedroom_top.constant = 0
            
            self.area_view.isHidden = false
            self.area_height.constant = 170
            self.area_top.constant = 16
            
        case .residential:
            owner_array =  [ "Sq.yards","Sq.ft" , "Sq.meter" , "Acres" , "Marla" , "Cents" , "Bigha" , "Kotha" , "Grounds" , "Hectare" ]
            sqt_label.text = "Sq.yards"
            self.area_view.isHidden = false
            self.area_height.constant = 170
            self.area_top.constant = 16
            self.bedroom_view.isHidden = false
            self.bedroom_height.constant = 100
            self.bedroom_top.constant = 16
            
        }
        
        switch searchBy1 {
            
        case .commercial:
            
            link = Api.searchBuyCommercial
            
        case .residential:
            
            link = Api.searchBuyResidential
        }
        
        
    }
    @IBAction func tap_submit(_ sender: Any)
    {
        searchProperty_API1()
    }
    
    @IBAction func tap_furnished_btn(_ sender: Any)
    {
        picker.isHidden = false
        toolbar.isHidden = false
        self.selctionType = .furnished
        picker.reloadAllComponents()
    }
    @IBAction func tap_image_btn(_ sender: Any) {
        
        picker.isHidden = false
        toolbar.isHidden = false
        self.selctionType = .image
        picker.reloadAllComponents()
        
    }
    
    @IBAction func tap_floorPreference_btn(_ sender: Any)
    {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        vc.delegate = self
        vc.comesFromBuy = buyPressed
        vc.arry = Array(arrayLiteral: floorcomlabel.text ?? "")
        vc.selctionType = .commercialPropfloor
        self.navigationController?.pushViewController(vc, animated: true)
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: false, completion: nil)
    }
    @IBAction func tap_floorPreference1_btn(_ sender: Any)
    {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        vc.delegate = self
        vc.comesFromBuy = buyPressed
        vc.arry = Array(arrayLiteral: floorcomlabel1.text ?? "")
        vc.selctionType = .commercialPropfloor
        self.navigationController?.pushViewController(vc, animated: true)
       // vc.modalPresentationStyle = .overFullScreen

//        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func raghgfd(_ sender: UIControl) {
        
        
        print("jkjk")
    }
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat)
    {
        if slider === budget_slider
        {
            if minValue>=0 && minValue < 10
            {
                budgetMinimuPrice_label.text  = "0"
                lowerValue11 = "0"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=5  && minValue < 10
            {
                budgetMinimuPrice_label.text  = "5 Lacs"
                lowerValue11 = "500000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=10  && minValue < 20
            {
                budgetMinimuPrice_label.text = "10 Lacs"
                lowerValue11 = "1000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=20  && minValue < 30
            {
                budgetMinimuPrice_label.text = "15 Lacs"
                lowerValue11 = "1500000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=30  && minValue < 40
            {
                budgetMinimuPrice_label.text = "20 Lacs"
                lowerValue11 = "2000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=40  && minValue < 50
            {
                budgetMinimuPrice_label.text = "25 Lacs"
                lowerValue11 = "2500000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=50  && minValue < 60
            {
                budgetMinimuPrice_label.text = "30 Lacs"
                lowerValue11 = "3000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=60  && minValue < 70
            {
                budgetMinimuPrice_label.text = "40 Lacs"
                lowerValue11 = "4000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=70  && minValue < 80
            {
                budgetMinimuPrice_label.text = "50 Lacs"
                lowerValue11 = "5000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=80  && minValue < 90
            {
                budgetMinimuPrice_label.text = "60 Lacs"
                lowerValue11 = "6000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=90  && minValue < 95
            {
                budgetMinimuPrice_label.text = "75 Lacs"
                lowerValue11 = "7500000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=95  && minValue < 100
            {
                budgetMinimuPrice_label.text = "1 Crore"
                lowerValue11 = "10000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=100  && minValue < 105
            {
                budgetMinimuPrice_label.text = "1.5 Crore"
                lowerValue11 = "150000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=105  && minValue < 110
            {
                budgetMinimuPrice_label.text = "2 Crore"
                lowerValue11 = "20000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
                
            }
            else if minValue>=110  && minValue < 115
            {
                budgetMinimuPrice_label.text = "2.5 Crore"
                lowerValue11 = "25000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            
            else if minValue>=115  && minValue < 120
            {
                budgetMinimuPrice_label.text = "3 Crore"
                lowerValue11 = "30000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=120  && minValue < 125
            {
                budgetMinimuPrice_label.text = "3.5 Crore"
                lowerValue11 = "35000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=125  && minValue < 130
            {
                budgetMinimuPrice_label.text = "4 Crore"
                lowerValue11 = "40000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            
            else if minValue>=130  && minValue < 135
            {
                budgetMinimuPrice_label.text = "5 Crore"
                lowerValue11 = "50000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=135  && minValue < 140
            {
                budgetMinimuPrice_label.text = "10 Crore"
                lowerValue11 = "100000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=140  && minValue < 150
            {
                budgetMinimuPrice_label.text = "20 Crore"
                lowerValue11 = "200000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            
            else if minValue>=150  && minValue < 160
            {
                budgetMinimuPrice_label.text = "30 Crore"
                lowerValue11 = "300000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            else if minValue>=160  && minValue < 170
            {
                budgetMinimuPrice_label.text = "50 Crore"
                lowerValue11 = "500000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            
            else if minValue == 170
            {
                budgetMinimuPrice_label.text = "100 Crore+"
                lowerValue11 = "1000000000"
                UserDefaults.standard.set(lowerValue11, forKey: "lowerValuecom")
                
            }
            
            
            /// max
            if maxValue>=0 && maxValue < 10
            {
                budgetMaximumPrice_label.text  = "0"
                higherValue11 = "0"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=5  && maxValue < 10
            {
                budgetMaximumPrice_label.text  = "5 Lacs"
                higherValue11 = "500000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=10  && maxValue < 20
            {
                budgetMaximumPrice_label.text = "10 Lacs"
                higherValue11 = "1000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=20  && maxValue < 30
            {
                budgetMaximumPrice_label.text = "15 Lacs"
                higherValue11 = "1500000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=30  && maxValue < 40
            {
                budgetMaximumPrice_label.text = "20 Lacs"
                higherValue11 = "2000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=40  && maxValue < 50
            {
                budgetMaximumPrice_label.text = "25 Lacs"
                higherValue11 = "2500000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=50  && maxValue < 60
            {
                budgetMaximumPrice_label.text = "30 Lacs"
                higherValue11 = "3000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=60  && maxValue < 70
            {
                budgetMaximumPrice_label.text = "40 Lacs"
                higherValue11 = "4000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=70  && maxValue < 80
            {
                budgetMaximumPrice_label.text = "50 Lacs"
                higherValue11 = "5000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=80  && maxValue < 90
            {
                budgetMaximumPrice_label.text = "60 Lacs"
                higherValue11 = "6000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=90  && maxValue < 95
            {
                budgetMaximumPrice_label.text = "75 Lacs"
                higherValue11 = "7500000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=95  && maxValue < 100
            {
                budgetMaximumPrice_label.text = "1 Crore"
                higherValue11 = "10000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=100  && maxValue < 105
            {
                budgetMaximumPrice_label.text = "1.5 Crore"
                higherValue11 = "150000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=105  && maxValue < 110
            {
                budgetMaximumPrice_label.text = "2 Crore"
                higherValue11 = "20000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=110  && maxValue < 115
            {
                budgetMaximumPrice_label.text = "2.5 Crore"
                higherValue11 = "25000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            
            else if maxValue>=115  && maxValue < 120
            {
                budgetMaximumPrice_label.text = "3 Crore"
                higherValue11 = "30000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=120  && maxValue < 125
            {
                budgetMaximumPrice_label.text = "3.5 Crore"
                higherValue11 = "35000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=125  && maxValue < 130
            {
                budgetMaximumPrice_label.text = "4 Crore"
                higherValue11 = "40000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=130  && maxValue < 135
            {
                self.budgetMaximumPrice_label.text = "5 Crore"
                higherValue11 = "50000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=135  && maxValue < 140
            {
                self.budgetMaximumPrice_label.text = "10 Crore"
                higherValue11 = "100000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=140  && maxValue < 150
            {
                self.budgetMaximumPrice_label.text = "20 Crore"
                higherValue11 = "200000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            else if maxValue>=150  && maxValue < 160
            {
                self.budgetMaximumPrice_label.text = "30 Crore"
                higherValue11 = "300000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            
            else if maxValue>=160  && maxValue < 170
            {
                self.budgetMaximumPrice_label.text = "50 Crore"
                higherValue11 = "500000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            
            
            else if (maxValue == 170)
            {
                self.budgetMaximumPrice_label.text = "100 Crore+"
                higherValue11 = "1000000000"
                UserDefaults.standard.set(higherValue11, forKey: "higherValuecom")
                
            }
            
        }
        
        else if slider === sliderLakh {
            
            if (minValue == 0) {
                lblRentMinimum.text = "0"
                lowerValue12 = "0"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue > 0 && minValue < 10) {
                lblRentMinimum.text = "10 Thousand"
                lowerValue12 = "10000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
                
            } else if (minValue >= 10 && minValue < 20) {
                lblRentMinimum.text = "20 Thousand"
                lowerValue12 = "20000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 20 && minValue < 30) {
                lblRentMinimum.text = "30 Thousand"
                lowerValue12 = "30000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 30 && minValue < 40) {
                lblRentMinimum.text = "40 Thousand"
                lowerValue12 = "40000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 40 && minValue < 50) {
                lblRentMinimum.text = "50 Thousand"
                lowerValue12 = "50000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 50 && minValue < 60) {
                lblRentMinimum.text = "60 Thousand"
                lowerValue12 = "60000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 60 && minValue < 70) {
                lblRentMinimum.text = "75 Thousand"
                lowerValue12 = "75000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 70 && minValue < 80) {
                lblRentMinimum.text = "1 Lac"
                lowerValue12 = "100000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 80 && minValue < 90) {
                lblRentMinimum.text = "1.25 Lacs"
                lowerValue12 = "125000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 90 && minValue < 95) {
                lblRentMinimum.text = "1.5 Lacs"
                lowerValue12 = "150000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 95 && minValue < 100) {
                lblRentMinimum.text = "1.75 Lacs"
                lowerValue12 = "1750000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 100 && minValue < 105) {
                lblRentMinimum.text = "2 Lacs"
                lowerValue12 = "200000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 105 && minValue < 110) {
                lblRentMinimum.text = "2.5 Lacs"
                lowerValue12 = "250000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 110 && minValue < 120) {
                lblRentMinimum.text = "3 Lacs"
                lowerValue12 = "300000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 120 && minValue < 130) {
                lblRentMinimum.text = "3.5 Lacs"
                lowerValue12 = "350000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 130 && minValue < 140) {
                lblRentMinimum.text = "4 Lacs"
                lowerValue12 = "400000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
                
            } else if (minValue >= 140 && minValue < 150) {
                lblRentMinimum.text = "4.5 Lacs"
                lowerValue12 = "450000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 150 && minValue < 155) {
                lblRentMinimum.text = "5 Lacs"
                lowerValue12 = "500000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 155 && minValue < 160) {
                lblRentMinimum.text = "7.5 Lacs"
                lowerValue12 = "750000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 160 && minValue < 170) {
                lblRentMinimum.text = "10 Lacs"
                lowerValue12 = "1000000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue >= 170 && minValue < 180) {
                lblRentMinimum.text = "15 Lacs"
                lowerValue12 = "1500000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
            } else if (minValue == 180) {
                lblRentMinimum.text = "20 Lacs+"
                lowerValue12 = "2000000"
                UserDefaults.standard.set(lowerValue12, forKey: "lowerValuecom1")
                
                
            }
            
            
            
            
            
            //MAX
            if (maxValue == 0) {
                lblLakh.text = "0"
                higherValue12 = "0"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue > 0 && sliderLakh.maxValue < 10) {
                lblLakh.text = "10 Thousand"
                higherValue12 = "10000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 10 && maxValue < 20) {
                lblLakh.text = "20 Thousand"
                higherValue12 = "20000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
                
            } else if (maxValue >= 20 && maxValue < 30) {
                lblLakh.text = "30 Thousand"
                higherValue12 = "30000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 30 && maxValue < 40) {
                lblLakh.text = "40 Thousand"
                higherValue12 = "40000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 40 && maxValue < 50) {
                lblLakh.text = "50 Thousand"
                higherValue12 = "50000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 50 && maxValue < 60) {
                lblLakh.text = "60 Thousand"
                higherValue12 = "60000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 60 && maxValue < 70) {
                lblLakh.text = "75 Thousand"
                higherValue12 = "75000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 70 && maxValue < 80) {
                lblLakh.text = "1 Lac"
                higherValue12 = "100000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 80 && maxValue < 90) {
                lblLakh.text = "1.25 Lacs"
                higherValue12 = "125000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
                
            } else if (maxValue >= 90 && maxValue < 95) {
                lblLakh.text = "1.5 Lacs"
                higherValue12 = "150000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 95 && maxValue < 100) {
                lblLakh.text = "1.75 Lacs"
                higherValue12 = "175000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 100 && maxValue < 105) {
                lblLakh.text = "2 Lacs"
                higherValue12 = "200000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 105 && maxValue < 110) {
                lblLakh.text = "2.5 Lacs"
                higherValue12 = "250000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 110 && maxValue < 120) {
                lblLakh.text = "3 Lacs"
                higherValue12 = "300000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 120 && maxValue < 130) {
                lblLakh.text = "3.5 Lacs"
                higherValue12 = "350000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 130 && maxValue < 140) {
                lblLakh.text = "4 Lacs"
                higherValue12 = "400000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 140 && maxValue < 150) {
                lblLakh.text = "4.5 Lacs"
                higherValue12 = "450000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 150 && maxValue < 155) {
                lblLakh.text = "5 Lacs"
                higherValue12 = "500000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 155 && maxValue < 160) {
                lblLakh.text = "7.5 Lacs"
                higherValue12 = "750000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 160 && maxValue < 170) {
                lblLakh.text = "10 Lacs"
                higherValue12 = "1000000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue >= 170 && maxValue < 180) {
                lblLakh.text = "15 Lacs"
                higherValue12 = "1500000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
            } else if (maxValue == 180) {
                lblLakh.text = "20 Lacs+"
                higherValue12 = "2000000"
                UserDefaults.standard.set(higherValue12, forKey: "higherValuecom1")
                
                
            }
        }
        else if slider === area_slider{
            
            
            
            if minValue>=0 && minValue < 10
            {
                areaMinimumPrice_label.text  = "0"
                areaMinimum = "0"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=10  && minValue < 20
            {
                areaMinimumPrice_label.text  = "100"
                areaMinimum = "100"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=20  && minValue < 30
            {
                areaMinimumPrice_label.text  = "150"
                areaMinimum = "150"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }

            else if minValue>=30  && minValue < 40
            {
                areaMinimumPrice_label.text  = "200"
                areaMinimum = "200"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }

            else if minValue>=40  && minValue < 50
            {
                areaMinimumPrice_label.text = "250"
                areaMinimum = "250"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=50  && minValue < 60
            {
                areaMinimumPrice_label.text = "300"
                areaMinimum = "300"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=60  && minValue < 70
            {
                areaMinimumPrice_label.text = "400"
                areaMinimum = "400"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=70  && minValue < 80
            {
                areaMinimumPrice_label.text = "500"
                areaMinimum = "500"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=80  && minValue < 90
            {
                areaMinimumPrice_label.text = "600"
                areaMinimum = "600"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=90  && minValue < 100
            {
                areaMinimumPrice_label.text = "800"
                areaMinimum = "800"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=100  && minValue < 110
            {
                areaMinimumPrice_label.text = "1000"
                areaMinimum = "1000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=110  && minValue < 120
            {
                areaMinimumPrice_label.text = "1500"
                areaMinimum = "1500"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=120  && minValue < 130
            {
                areaMinimumPrice_label.text = "2000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }else if minValue>=130  && minValue < 140
            {
                areaMinimumPrice_label.text = "2500"
                areaMinimum = "2500"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=140  && minValue < 150
            {
                areaMinimumPrice_label.text = "3000"
                areaMinimum = "3000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=150  && minValue < 160
            {
                areaMinimumPrice_label.text = "3500"
                areaMinimum = "3500"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=160  && minValue < 170
            {
                areaMinimumPrice_label.text = "4000"
                areaMinimum = "4000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=160  && minValue < 180
            {
                areaMinimumPrice_label.text = "6000"
                areaMinimum = "6000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if minValue>=180  && minValue < 190
            {
                areaMinimumPrice_label.text = "8000"
                areaMinimum = "8000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
            }
            else if (minValue == 190)
            {
                areaMinimumPrice_label.text = "10000+"
                areaMinimum = "10000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimumcom")
                
                
            }
            
            ///maxxx
            if maxValue>=0 && maxValue < 10
            {
                areaMaximumPrice_label.text  = "0"
                areaMaximum = "0"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            
            else if maxValue>=10  && maxValue < 20
            {
                areaMaximumPrice_label.text  = "100"
                areaMaximum = "100"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=20  && maxValue < 30
            {
                areaMaximumPrice_label.text  = "150"
                areaMaximum = "150"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=30  && maxValue < 40
            {
                areaMaximumPrice_label.text  = "200"
                areaMaximum = "200"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=40  && maxValue < 50
            {
                areaMaximumPrice_label.text = "250"
                areaMaximum = "250"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=50  && maxValue < 60
            {
                areaMaximumPrice_label.text = "300"
                areaMaximum = "300"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=60  && maxValue < 70
            {
                areaMaximumPrice_label.text = "400"
                areaMaximum = "400"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=70  && maxValue < 80
            {
                areaMaximumPrice_label.text = "500"
                areaMaximum = "500"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=80  && maxValue < 90
            {
                areaMaximumPrice_label.text = "600"
                areaMaximum = "600"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=90  && maxValue < 100
            {
                areaMaximumPrice_label.text = "800"
                areaMaximum = "800"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=100  && maxValue < 110
            {
                areaMaximumPrice_label.text = "1000"
                areaMaximum = "1000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=110  && maxValue < 120
            {
                areaMaximumPrice_label.text = "1500"
                areaMaximum = "1500"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=120  && maxValue < 130
            {
                areaMaximumPrice_label.text = "2000"
                areaMaximum = "2000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }else if maxValue>=130  && maxValue < 140
            {
                areaMaximumPrice_label.text = "2500"
                areaMaximum = "2500"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=140  && maxValue < 150
            {
                areaMaximumPrice_label.text = "3000"
                areaMaximum = "3000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=150  && maxValue < 160
            {
                areaMaximumPrice_label.text = "3500"
                areaMaximum = "3500"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=160  && maxValue < 170
            {
                areaMaximumPrice_label.text = "4000"
                areaMaximum = "4000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=170  && maxValue < 180
            {
                areaMaximumPrice_label.text = "6000"
                areaMaximum = "6000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if maxValue>=180  && maxValue < 190
            {
                areaMaximumPrice_label.text = "8000"
                areaMaximum = "8000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
            }
            else if (maxValue == 190)
            {
                areaMaximumPrice_label.text = "10000+"
                areaMaximum = "10000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximumcom")
                
                
            }
            
        }
        else if slider === slider_thousand{
            
            
            
            if minValue>=0 && minValue < 10
            {
                areaminimum_thousandlbl.text  = "0"
                areaMinimum = "0"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=10  && minValue < 20
            {
                areaminimum_thousandlbl.text  = "100"
                areaMinimum = "100"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=20  && minValue < 30
            {
                areaminimum_thousandlbl.text  = "150"
                areaMinimum = "150"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=30  && minValue < 40
            {
                areaminimum_thousandlbl.text  = "200"
                areaMinimum = "200"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=40  && minValue < 50
            {
                areaminimum_thousandlbl.text = "250"
                areaMinimum = "250"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=50  && minValue < 60
            {
                areaminimum_thousandlbl.text = "300"
                areaMinimum = "300"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=60  && minValue < 70
            {
                areaminimum_thousandlbl.text = "400"
                areaMinimum = "400"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=70  && minValue < 80
            {
                areaminimum_thousandlbl.text = "500"
                areaMinimum = "500"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=80  && minValue < 90
            {
                areaminimum_thousandlbl.text = "600"
                areaMinimum = "600"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=90  && minValue < 100
            {
                areaminimum_thousandlbl.text = "800"
                areaMinimum = "800"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=100  && minValue < 110
            {
                areaminimum_thousandlbl.text = "1000"
                areaMinimum = "1000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=110  && minValue < 120
            {
                areaminimum_thousandlbl.text = "1500"
                areaMinimum = "1500"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=120  && minValue < 130
            {
                areaminimum_thousandlbl.text = "2000"
                areaMinimum1 = "2000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
                
                
            }else if minValue>=130  && minValue < 140
            {
                areaminimum_thousandlbl.text = "2500"
                areaMinimum1 = "2500"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=140  && minValue < 150
            {
                areaminimum_thousandlbl.text = "3000"
                areaMinimum1 = "3000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=150  && minValue < 160
            {
                areaminimum_thousandlbl.text = "3500"
                areaMinimum1 = "3500"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=160  && minValue < 170
            {
                areaminimum_thousandlbl.text = "4000"
                areaMinimum1 = "4000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=170  && minValue < 180
            {
                areaminimum_thousandlbl.text = "6000"
                areaMinimum1 = "6000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if minValue>=180  && minValue < 190
            {
                areaminimum_thousandlbl.text = "8000"
                areaMinimum1 = "8000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
            }
            else if (minValue == 190)
            {
                areaminimum_thousandlbl.text = "10000+"
                areaMinimum1 = "10000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimumcom1")
                
                
            }
            
            ///maxxx
            if maxValue>=0 && maxValue < 10
            {
                areamaximumthousand_lbl.text  = "0"
                areaMaximum1 = "0"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=10  && maxValue < 20
            {
                areamaximumthousand_lbl.text  = "100"
                areaMaximum1 = "100"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=20  && maxValue < 30
            {
                areamaximumthousand_lbl.text  = "150"
                areaMaximum1 = "150"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=30  && maxValue < 40
            {
                areamaximumthousand_lbl.text  = "200"
                areaMaximum1 = "200"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=40  && maxValue < 50
            {
                areamaximumthousand_lbl.text = "250"
                areaMaximum1 = "250"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=50  && maxValue < 60
            {
                areamaximumthousand_lbl.text = "300"
                areaMaximum1 = "300"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=60  && maxValue < 70
            {
                areamaximumthousand_lbl.text = "400"
                areaMaximum1 = "400"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=70  && maxValue < 80
            {
                areamaximumthousand_lbl.text = "500"
                areaMaximum1 = "500"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=80  && maxValue < 90
            {
                areamaximumthousand_lbl.text = "600"
                areaMaximum1 = "600"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=90  && maxValue < 100
            {
                areamaximumthousand_lbl.text = "800"
                areaMaximum1 = "800"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=100  && maxValue < 110
            {
                areamaximumthousand_lbl.text = "1000"
                areaMaximum1 = "1000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=110  && maxValue < 120
            {
                areamaximumthousand_lbl.text = "1500"
                areaMaximum1 = "1500"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=120  && maxValue < 130
            {
                areamaximumthousand_lbl.text = "2000"
                areaMaximum1 = "2000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }else if maxValue>=130  && maxValue < 140
            {
                areamaximumthousand_lbl.text = "2500"
                areaMaximum1 = "2500"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=140  && maxValue < 150
            {
                areamaximumthousand_lbl.text = "3000"
                areaMaximum1 = "3000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=150  && maxValue < 160
            {
                areamaximumthousand_lbl.text = "3500"
                areaMaximum = "3500"
            }
            else if maxValue>=160  && maxValue < 170
            {
                areamaximumthousand_lbl.text = "4000"
                areaMaximum1 = "4000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=170  && maxValue < 180
            {
                areamaximumthousand_lbl.text = "6000"
                areaMaximum1 = "6000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if maxValue>=180  && maxValue < 190
            {
                areamaximumthousand_lbl.text = "8000"
                areaMaximum1 = "8000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
            }
            else if (maxValue == 190)
            {
                areamaximumthousand_lbl.text = "10000+"
                areaMaximum1 = "10000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximumcom1")
                
                
            }
        }
        
    }
    
    @IBAction func tap_buy_btn(_ sender: Any)
    {
        searchIdName.removeAll()
        searchCityName.removeAll()
        seacrhCityHeightConstraint.isActive = true
        seacrhCityHeightConstraint.constant = 0
        showCityListCollectionView.reloadData()
        
        buyPressed = true
        
        rentselected = false
        
        chkvalue = "2"
        buySelected = true
        if buySelected == true{
            selectedCityArray.removeAll()
            buyCityArr.removeAll()
            selectedCityArray = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
            buyCityArr = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
            if selectedCityArray.isEmpty {
                collection_height.constant = 0
                city_collectionView.isHidden = true
                
            }else{
                collection_height.constant = 80
                city_collectionView.isHidden = false
                
            }
        }
        else{
            selectedCityArray.removeAll()
            rentCityArr.removeAll()
            selectedCityArray = UserDefaults.standard.value(forKey: "rent") as? [String] ?? []
            rentCityArr = UserDefaults.standard.value(forKey: "rent") as? [String] ?? []
            if selectedCityArray.isEmpty {
                collection_height.constant = 0
                city_collectionView.isHidden = true
                
            }else{
                collection_height.constant = 80
                city_collectionView.isHidden = false
                
            }
            
        }
        //        areaMinimumPrice_label.text = "0"
        //        areaMaximumPrice_label.text = "10000+"
        //        budgetMinimuPrice_label.text = "0"
        //        budgetMaximumPrice_label.text = "100 Crore +"
        areaMaximumPrice_label.isHidden = false
        areaMinimumPrice_label.isHidden = false
        areamaximumthousand_lbl.isHidden = true
        areaminimum_thousandlbl.isHidden = true
        budgetMinimuPrice_label.isHidden = false
        budgetMaximumPrice_label.isHidden = false
        lblRentMinimum.isHidden = true
        lblLakh.isHidden = true
        sliderLakh.isHidden = true
        slider_thousand.isHidden = true
        
        search_tebleView.reloadData()
        city_collectionView.reloadData()
        selectedRoomType_label.isHidden = false
        selectedRoomType_label1.isHidden = true
        Searchcomproperty_lbl.isHidden = false
        Searchcomproperty_lbl1.isHidden = true
        floorcomlabel.isHidden = false
        floorcomlabel1.isHidden = true
        sqt_label.isHidden = false
        sqt_label1.isHidden = true
        furnished_label.isHidden = false
        furnished_label1.isHidden = true
        imageSelection_label.isHidden = false
        imageSelection_label1.isHidden = true
        //         objcell.data_label.isHidden = false
        //        objcell.data_label1.isHidden = true
        //
        //        objcell.data_label.text =  UserDefaults.standard.value(forKey: "cityName") as? String
        //        objcell.data_label1.text =  UserDefaults.standard.value(forKey: "cityName1") as? String
        floorcomlabel.text =  UserDefaults.standard.value(forKey: "floordatacom") as? String
        floorcomlabel1.text =  UserDefaults.standard.value(forKey: "floordatacom1") as? String
        Searchcomproperty_lbl.text = UserDefaults.standard.value(forKey: "propertyvaluecom") as? String
        Searchcomproperty_lbl1.text = UserDefaults.standard.value(forKey: "propertyvaluecom1") as? String
        selectedRoomType_label.text = UserDefaults.standard.value(forKey: "roomvalue") as? String
        selectedRoomType_label1.text = UserDefaults.standard.value(forKey: "roomvalue1") as? String
        furnished_label1.text = UserDefaults.standard.value(forKey: "furnishedcom1") as? String
        furnished_label.text = UserDefaults.standard.value(forKey: "furnishedcom") as? String
        
        print(selectedRoomType_label.text as Any)
        sqt_label.text = UserDefaults.standard.value(forKey: "sqdatacom") as? String
        sqt_label1.text = UserDefaults.standard.value(forKey: "sqdatacom1") as? String
        imageSelection_label.text = UserDefaults.standard.value(forKey: "imagecom") as? String
        imageSelection_label1.text = UserDefaults.standard.value(forKey: "imagecom1") as? String
        
        propertytype_btn.isHidden = true
        propertytype_btn1.isHidden = false
        
        
        setBuyRent(buy:UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), rent: UIColor.black , buyLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1) , rentLine : UIColor.clear)
        budget_slider.isHidden = false
        
        //        lowerValue = "0"
        //        higherValue = "1000000000"
        // self.budgetMaximumPrice_label.text = "100 Crore +"
        switch searchBy1
        {
        case .commercial:
            link = Api.searchBuyCommercial
            
        case .residential:
            
            link = Api.searchBuyResidential
        }
        
    }
    
    @IBAction func tap_rent_btn(_ sender: Any) {
        
        searchIdName.removeAll()
        searchCityName.removeAll()
        seacrhCityHeightConstraint.isActive = true
        seacrhCityHeightConstraint.constant = 0
        showCityListCollectionView.reloadData()
        
        
        rentselected = true
        buyPressed = false
        
        rentBtnData()
    }
    func rentBtnData(){
        
        chkvalue = "3"
        buySelected = false
        // UserDefaults.standard.set(rentSelectionLine_view, forKey: "linerent")
        
        if buySelected == true{
            selectedCityArray.removeAll()
            buyCityArr.removeAll()
            selectedCityArray = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
            buyCityArr = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
            if selectedCityArray.isEmpty {
                collection_height.constant = 0
                city_collectionView.isHidden = true
                
            }else{
                collection_height.constant = 80
                city_collectionView.isHidden = false
                
            }
        }
        else{
            selectedCityArray.removeAll()
            rentCityArr.removeAll()
            selectedCityArray = UserDefaults.standard.value(forKey: "rent") as? [String] ?? []
            rentCityArr = UserDefaults.standard.value(forKey: "rent") as? [String] ?? []
            if selectedCityArray.isEmpty {
                collection_height.constant = 0
                city_collectionView.isHidden = true
                
            }else{
                collection_height.constant = 80
                city_collectionView.isHidden = false
                
            }
            
        }
        
        //        lblRentMinimum.text = "0"
        //            lblLakh.text = "20 Lacs +"
        //                lowerValue = "0"
        //                higherValue = "2000000"
        search_tebleView.reloadData()
        city_collectionView.reloadData()
        selectedRoomType_label.isHidden = true
        selectedRoomType_label1.isHidden = false
        Searchcomproperty_lbl.isHidden = true
        Searchcomproperty_lbl1.isHidden = false
        sqt_label.isHidden = true
        sqt_label1.isHidden = false
        floorcomlabel.isHidden = true
        floorcomlabel1.isHidden = false
        furnished_label.isHidden = true
        furnished_label1.isHidden = false
        imageSelection_label.isHidden = true
        imageSelection_label1.isHidden = false
        floorcomlabel.text =  UserDefaults.standard.value(forKey: "floordatacom") as? String
        floorcomlabel1.text = UserDefaults.standard.value(forKey: "floordatacom1") as? String
        Searchcomproperty_lbl.text = UserDefaults.standard.value(forKey: "propertyvaluecom") as? String
        Searchcomproperty_lbl1.text = UserDefaults.standard.value(forKey: "propertyvaluecom1") as? String
        selectedRoomType_label.text = UserDefaults.standard.value(forKey: "roomvalue") as? String
        selectedRoomType_label1.text = UserDefaults.standard.value(forKey: "roomvalue1") as? String
        sqt_label.text = UserDefaults.standard.value(forKey: "sqdatacom") as? String
        sqt_label1.text = UserDefaults.standard.value(forKey: "sqdatacom1") as? String
        furnished_label1.text = UserDefaults.standard.value(forKey: "furnishedcom1") as? String
        furnished_label.text = UserDefaults.standard.value(forKey: "furnishedcom") as? String
        imageSelection_label.text = UserDefaults.standard.value(forKey: "imagecom") as? String
        imageSelection_label1.text = UserDefaults.standard.value(forKey: "imagecom1") as? String
        print(selectedRoomType_label1.text as Any)
        //        objcell.data_label.isHidden = true
        //        objcell.data_label1.isHidden = false
        //        objcell.data_label.text =  UserDefaults.standard.value(forKey: "cityName") as? String
        //        objcell.data_label1.text =  UserDefaults.standard.value(forKey: "cityName1") as? String
        propertytype_btn.isHidden = false
        propertytype_btn1.isHidden = true
        budget_slider.isHidden = true
        sliderLakh.isHidden = false
        areaMaximumPrice_label.isHidden = true
        areaMinimumPrice_label.isHidden = true
        areamaximumthousand_lbl.isHidden = false
        areaminimum_thousandlbl.isHidden = false
        slider_thousand.isHidden = false
        lblRentMinimum.isHidden = false
        areaminimum_thousandlbl.isHidden = false
        budgetMinimuPrice_label.isHidden = true
        budgetMaximumPrice_label.isHidden = true
        lblLakh.isHidden = false
        lowerValue1 = "0"
        higherValue12 = "2000000"
        
        setBuyRent(buy: UIColor.black, rent:UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1),buyLine : UIColor.clear , rentLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1))
        
        
        // budgetMaximumPrice_label.text = "20 Lacs +"
        switch searchBy1
        {
        case .commercial:
            link = Api.searchRentCommercial
            
        case .residential:
            
            link = Api.searchRentResidential
        }
    }
    
    func setBuyRent(buy : UIColor , rent : UIColor, buyLine : UIColor ,rentLine : UIColor ) {
        rentSelectionLine_view.backgroundColor = rentLine
        rent_label.textColor = rent
        buy_label.textColor = buy
        buySelection_view.backgroundColor = buyLine
    }
    
    
    @IBAction func searchEditingChange(_ sender: Any) {
        search_tebleView.isHidden = false
        getSearchField_API()
    }
    @IBAction func tap_propertyType_btn1(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        
        vc.delegate = self
        
        switch searchBy1 {
            
        case .commercial:
            vc.comesFromBuy = buyPressed
            vc.arry = Array(arrayLiteral:Searchcomproperty_lbl1.text ?? "")
            vc.selctionType = .commercialProp
            
            
            
            //   vc.selctionType = .commercialPropfloor
            
        case .residential:
            vc.selctionType = .propertyType
            //   vc.selctionType = .floor
            
            
        }
        
        self.navigationController?.pushViewController(vc, animated: true)

        
      //  self.present(vc, animated: false, completion: nil)
        
    }
    @IBAction func tap_propertyType_btn(_ sender: Any) {
 
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        
        vc.delegate = self
        
        switch searchBy1 {
            
        case .commercial:
            vc.comesFromBuy = buyPressed
            vc.arry = Array(arrayLiteral: Searchcomproperty_lbl.text ?? "")
            vc.selctionType = .commercialProp
            
            
        case .residential:
            vc.selctionType = .propertyType
        }
        
        self.navigationController?.pushViewController(vc, animated: true)

        
       // self.present(vc, animated: false, completion: nil)
        
    }
    
    @IBAction func tap_roomType_btn(_ sender: Any) {
  
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        
        vc.delegate = self
        vc.selctionType = .bedRoom
        
        self.navigationController?.pushViewController(vc, animated: true)

       // self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func tap_sqFeet_label(_ sender: Any) {
        
        picker.isHidden = false
        toolbar.isHidden = false
        
        self.selctionType = .sqFeet
        
        picker.reloadAllComponents()
    }
    
    @IBAction func tap_cancel_btn(_ sender: Any) {
        
        picker.isHidden = true
        toolbar.isHidden = true
    }
    
    @IBAction func tap_done_btn(_ sender: Any) {
        
        picker.isHidden = true
        toolbar.isHidden = true
        
    }
    //MARK: city action btn
    @IBAction func cityActionBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CityListViewController") as! CityListViewController
        vc.modalPresentationStyle = .overFullScreen
          vc.modalTransitionStyle = .crossDissolve
        vc.passcityName = self
        self.present(vc, animated: true)
    }
    //  ========
    func selectItem(value: String, index : Int) {
        
        switch index {
            
        case 0:
            print("value")
            //            if chkvalue == "1"
            //            {
            //                let replaced = value.replacingOccurrences(of:" ", with:"")
            //                Searchcomproperty_lbl.text = replaced
            //                UserDefaults.standard.set(Searchcomproperty_lbl.text, forKey: "propertyvaluecomcom")
            //
            //            }
            //            else if chkvalue == "2"
            //            {
            //                let replaced = value.replacingOccurrences(of:" ", with:"")
            //                Searchcomproperty_lbl1.text = replaced
            //                print(Searchcomproperty_lbl1.text as Any)
            //              //  UserDefaults.standard.set(Searchcomproperty_lbl1.text, forKey: "propertyvaluecomcom1")
            //
            //            }
            
            
            
            
        case 1:
            //            let trimmedString = value.replacingOccurrences(of: " ", with: "")
            
            // let result = trimmedString.replacingOccurrences(of: "", with: "Bhk")
            if chkvalue == "2"
            {
                let replaced = value.replacingOccurrences(of:" ",with:"")
                let replacedvalue = replaced.replacingOccurrences(of:"Bhk",with:" Bhk")
                if replacedvalue == "U" || replacedvalue == "All"{
                    selectedRooms = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk"
                    
                    selectedRoomType_label.text = selectedRooms
                    UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue")
                    
                }else if replacedvalue == ""{
                    selectedRooms = ""
                    UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue")
                    
                    selectedRoomType_label.text = selectedRooms
                    
                }
                else
                {
                    selectedRoomType_label.text = replacedvalue
                    UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue")
                    selectedRooms = replacedvalue
                }
                print(self.selectedRoomType_label.text!)
            }
            else if chkvalue == "1"
            {
                let replaced = value.replacingOccurrences(of:" ",with:"")
                let replacedvalue = replaced.replacingOccurrences(of:"Bhk",with:" Bhk")
                if replacedvalue == "U" || replacedvalue == "All"{
                    selectedRooms = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk"
                    
                    selectedRoomType_label.text! = selectedRooms
                    UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue")
                    
                }else if replacedvalue == ""{
                    selectedRooms = ""
                    UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue")
                    
                    selectedRoomType_label.text = selectedRooms
                    
                }
                else
                {
                    selectedRoomType_label.text = replacedvalue
                    UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue")
                    selectedRooms = replacedvalue
                }
                print(self.selectedRoomType_label.text!)
            }
            
            else  if chkvalue == "3"
            {
                let replaced = value.replacingOccurrences(of:" ",with:"")
                let replacedvalue = replaced.replacingOccurrences(of:"Bhk",with:" Bhk")
                if replacedvalue == "U" || replacedvalue == "All"{
                    selectedRooms = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk"
                    selectedRoomType_label1.text = selectedRooms
                    UserDefaults.standard.set(selectedRoomType_label1.text, forKey: "roomvalue1")
                }else if replacedvalue == ""{
                    selectedRooms = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk"
                    selectedRoomType_label1.text = selectedRooms
                    UserDefaults.standard.set(selectedRoomType_label1.text, forKey: "roomvalue1")
                    
                }
                else
                {
                    selectedRoomType_label1.text = replacedvalue
                    UserDefaults.standard.set(selectedRoomType_label1.text, forKey: "roomvalue1")
                    selectedRooms = replacedvalue
                }
                print(self.selectedRoomType_label1.text)
            }
            
            
        case 2:
            
            print("")
            
        case 3:
            print("")
            
        case 4:
            if chkvalue == "2"
            {
                var replaced = value.replacingOccurrences(of:", ",with:",")
                if replaced == "U" || replaced == "All"{
                    replaced = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                    Searchcomproperty_lbl.text = replaced
                    UserDefaults.standard.set(Searchcomproperty_lbl.text, forKey: "propertyvaluecom")
                    
                }
                else if replaced == ""{
                    comProperty = ""
                    Searchcomproperty_lbl.text = replaced
                    UserDefaults.standard.set(Searchcomproperty_lbl.text, forKey: "propertyvaluecom")
                    
                }else{
                    Searchcomproperty_lbl.text = replaced
                    selectedRooms = replaced
                    UserDefaults.standard.set(Searchcomproperty_lbl.text, forKey: "propertyvaluecom")
                    
                }
            }
            else if chkvalue == "3"
            {
                var replaced = value.replacingOccurrences(of:", ",with:",")
                if replaced == "U" || replaced == "All"{
                    replaced = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                    Searchcomproperty_lbl1.text = replaced
                    UserDefaults.standard.set(Searchcomproperty_lbl1.text, forKey: "propertyvaluecom1")
                    
                }
                else if replaced == ""{
                    replaced = ""
                    Searchcomproperty_lbl1.text = replaced
                    UserDefaults.standard.set(Searchcomproperty_lbl1.text, forKey: "propertyvaluecom1")
                    
                }else{
                    Searchcomproperty_lbl1.text = replaced
                    selectedRooms = replaced
                    UserDefaults.standard.set(Searchcomproperty_lbl1.text, forKey: "propertyvaluecom1")
                    
                }
            }
            
            
        case 5:
            floorcomlabel.text = value
            //let replaced = value.replacingOccurrences(of: " ", with: "")
            if chkvalue == "2"
            {
                
                var replaced = value.replacingOccurrences(of:", ",with:",")
                if replaced == "U" || replaced == "All"
                //|| replaced == "Floor Preference"
                {
                    //            if floor_label.text!.contains("All")
                    //            {
                    replaced = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,Duplex,Entire Building,BMT+GF"
                    floorcomlabel.text = replaced
                    UserDefaults.standard.set(floorcomlabel.text, forKey: "floordatacom")
                }
                else if replaced == ""
                {
                    
                    replaced = ""
                    UserDefaults.standard.set(floorcomlabel.text, forKey: "floordatacom")
                    floorcomlabel.text = replaced
                    
                    
                    
                }
                else{
                    //floorji = replaced
                    floorcomlabel.text = replaced
                    UserDefaults.standard.set(floorcomlabel.text, forKey: "floordatacom")
                    //            floor_label.text! = replaced.trimSpace()
                    //            floorji = replaced
                }
                print(self.floorcomlabel.text!)
                
            }
            
            else if chkvalue == "3"
            {
                
                var replaced = value.replacingOccurrences(of:", ",with:",")
                if replaced == "U" || replaced == "All" 
                {
                    //            if floor_label.text!.contains("All")
                    //            {
                    replaced = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,BMT+GF,Duplex,Entire Building"
                    floorcomlabel1.text! = replaced
                    UserDefaults.standard.set(floorcomlabel1.text, forKey: "floordatacom1")
                    
                }
                else if replaced == ""
                {
                    replaced = ""
                    floorcomlabel1.text = replaced
                    UserDefaults.standard.set(floorcomlabel1.text, forKey: "floordatacom1")
                    
                }
                else{
                    //floorji = replaced
                    floorcomlabel1.text  = replaced
                    UserDefaults.standard.set(floorcomlabel1.text, forKey: "floordatacom1")
                    //                    floor_label1.text! = floorji.trimSpace()
                    //                    floorji = replaced
                }
                print(self.floorcomlabel1.text!)
                
            }
        default:
            
            print("")
            
        }
        
    }
    
    
    func getSearchField_API() {
        
//        let myIntArrSafe = searchIdName.map { Int($0) ?? 0 }
//        print(myIntArrSafe)
        print(searchIdName.joined(separator: ","))
//        let x12 = Array(set(searchIdName))

        let x = searchIdName.joined(separator: ",")
   
        let param : [String:Any] = [ "keyword" :  self.search_textfield.text!,"city_id":x ]
        
        print(param)
        
        ApiManager.apiPost(url:  Api.getCity, param: param, ref: self) { (json, error) in
            
            if error != nil{
                
                print(error?.localizedDescription ?? "")
            }
            else
            {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    self.cityModel = try JSONDecoder().decode(CityModel.self, from: data)
                    
                    if (self.cityModel?.code ?? "") == "200" {
                        
                        self.search_tebleView.reloadData()
                    }
                    else {
                        
                        if (self.cityModel?.msg ?? "") != "ok" {
                            
                            self.presentAlert(msg: (self.cityModel?.msg ?? ""))
                        }
                        
                        
                    }
                    
                }catch  {
                    
                    print("err \(error)")
                    
                }
            }
            
        }
        
    }
    func searchProperty_API1()
    {
        
        var param : [String:Any] = [:]
        
        switch searchBy1 {
        case .residential:
            
            var propertyCom = (Searchcomproperty_lbl.text ?? "")
            if propertyCom ==  "Your Property type" || propertyCom ==  "All"{
                propertyCom = ""
            }
            
            
            var room_in_bhk = (Searchcomproperty_lbl.text ?? "")
            
            if propertyCom == ""
            {
                propertyCom = commercialProperty.joined(separator: ",").trimSpace()
            }
            else
            {
                propertyCom = Searchcomproperty_lbl.text!.trimSpace()
            }
            
            
            if room_in_bhk == ""
            {
                
                room_in_bhk = room_Array.joined(separator: ",")
            }
            
            else
            {
                room_in_bhk = self.selectedRoomType_label.text!
                
            }
            
            
            
            if room == "All"
            {
                room = furnished_Array .joined(separator: ",").trimSpace()
                
            }
            else
            {
                room = self.furnished_label.text!.trimSpace()
            }
            
            
            
            
            if imagesearch == "All"
            {
                imagesearch = imageSelection_Array .joined(separator: ",")
                
            }
            else
            {
                imagesearch = self.imageSelection_label.text!
            }
            
            print(floor)
            
            
            
            
            
            
            let string = selectedCityArray
            let string1 = string.joined(separator: ",")
            
            
            let city = string1.trimSpace()
            
            
            print(param)
            
            
        case .commercial:
            var property = (Searchcomproperty_lbl.text ?? "")
            var furnished = (furnished_label.text ?? "")
            var floor = (floorcomlabel.text ?? "")
            var room_in_bhk = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk"
            
            
            
            
            if chkvalue == "2"
            {
                if property ==  "Your Property type" || property ==  "All" ||  property == ""
                {
                    property = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                }
                if room_in_bhk ==  "Select Bedroom" || room_in_bhk ==  "All"  || room_in_bhk == ""{
                    room_in_bhk = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk"
                }
                if furnished == "All" || furnished ==  ""{
                    furnished = "All,Furnished,Semifurnished,Unfurnished"
                }
                
                if floor == "Floor Preference" || floor == "All" || floor == ""
                {
                    floor = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,Duplex,Entire Building,BMT+GF"
                }
                if imagesearch == "" || imagesearch == "All"
                {
                    imagesearch = "All,With Images"
                    
                    imageSelection_label.text = imagesearch
                    
                    
                    
                    //let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    
                    
                }
                if areaMaximum == ""
                {
                    areaMaximum = "10000"
                }
                else
                {
                    areaMaximum = UserDefaults.standard.value(forKey: "areaMaximumcom") as? String ?? ""
                    
                }
                if areaMinimum == "" || areaMinimum1 == ""
                {
                    areaMinimum = "0"
                    areaMinimum1 = "0"
                    
                }
                else
                
                {
                    areaMinimum = UserDefaults.standard.value(forKey: "areaMinimumcom") as?
                    String ?? ""
                    areaMinimum1 = UserDefaults.standard.value(forKey: "areaMinimumcom1") as? String ?? ""
                    
                }
                if lowerValue11 == "" || lowerValue12 == ""
                {
                    lowerValue11 = "0"
                    lowerValue12 = "0"
                }
                else
                {
                    lowerValue11 = UserDefaults.standard.value(forKey: "lowerValuecom") as? String ?? ""
                    lowerValue12 = UserDefaults.standard.value(forKey: "lowerValuecom1") as? String ?? ""
                    
                }
                if higherValue11 == "" || higherValue12  == ""
                {
                    higherValue11 = "1000000000"
                    higherValue12 = "2000000"
                    
                }
                else
                
                {
                    higherValue11 = UserDefaults.standard.value(forKey: "higherValuecom") as? String ?? ""
                    higherValue12 = UserDefaults.standard.value(forKey: "higherValuecom1") as? String ?? ""
                    
                }
            }
            
            
            else  if chkvalue == "3"
            {
                property = (Searchcomproperty_lbl1.text ?? "")
                
                if property ==  "Your Property type" || property ==  "All" || property ==  ""{
                    property = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                }
                room_in_bhk = (selectedRoomType_label1.text ?? "")
                if room_in_bhk ==  "Select Bedroom" || room_in_bhk ==  "All" || room_in_bhk == ""
                {
                    room_in_bhk = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk"
                }
                furnished = (furnished_label1.text ?? "")
                
                if furnished == "All"{
                    furnished = "All,Furnished,Semifurnished,Unfurnished"
                }
                
                floor = (floorcomlabel1.text ?? "")
                
                if floor == "Floor Preference" || floor == "All" || floor == ""
                    
                {
                    floor = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,BMT+GF,Duplex,Entire Building"
                }
            }
            
            if imagesearch == "" || imagesearch == "All"
            {
                imagesearch = "All,With Images"
                
                
                imageSelection_label.text = imagesearch
                
                
                //let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                
                
            }
            if areaMaximum == "" || areaMaximum1 == ""
            {
                areaMaximum = "10000"
                areaMaximum1 = "10000"
            }
            else
            {
                areaMaximum = UserDefaults.standard.value(forKey: "areaMaximumcom") as? String ?? ""
                areaMaximum1 = UserDefaults.standard.value(forKey: "areaMaximumcom1") as? String ?? ""
                
            }
            if areaMinimum == "" || areaMaximum1 == ""
            {
                areaMinimum = "0"
                areaMinimum1 = "0"
                
            }
            else
            
            {
                areaMinimum = UserDefaults.standard.value(forKey: "areaMinimumcom") as? String ?? ""
                areaMinimum1 = UserDefaults.standard.value(forKey: "areaMinimumcom1") as? String ?? ""
            }
            if lowerValue11 == "" || lowerValue12 == ""
            {
                lowerValue11 = "0"
                lowerValue12 = "0"
                
            }
            else
            {
                lowerValue11 = UserDefaults.standard.value(forKey: "lowerValuecom") as? String ?? ""
                lowerValue12 = UserDefaults.standard.value(forKey: "lowerValuecom1") as? String ?? ""
                
            }
            if higherValue11 == "" || higherValue12 == ""
            {
                higherValue11 = "1000000000"
                
                higherValue12 = "2000000"
            }
            else
            
            {
                higherValue11 = UserDefaults.standard.value(forKey: "higherValuecom") as? String ?? ""
                higherValue12 = UserDefaults.standard.value(forKey: "higherValuecom1") as? String ?? ""
            }
            
            
            
            
            let string = buyCityArr
            let string1 = string.joined(separator: ",")
            
            
            
            
            if chkvalue == "2"
            {
                let city = string1
                let trimmedString = city.trimmingCharacters(in:.whitespaces)
                
                if city == ""
                {
                    let alert = UIAlertController(title: "", message: "Please Enter city", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true)
                }
                
                param = ["key":"5642vcb546gfnbvb7r6ewc211365v13122",
                         "userid": Singleton.sharedInstance.loginModel?.first?.data?.id ?? "",
                         "city":trimmedString,
                         "p1":lowerValue11,
                         "p2":higherValue11,
                         "property_type": property,
                         //                "property_type": UserDefaults.standard.value(forKey: "propertyvaluecomcom") ?? "",
                         "room_in_bhk":room_in_bhk,
                         "house_unit":UserDefaults.standard.value(forKey: "sqdatacom") ?? "",
                         "a1":areaMinimum,
                         "a2":areaMaximum,
                         "room_type":furnished,
                         "image_search":imagesearch,
                         "floor":floor,
                         "search":"",
                         "page":"null"]
            }
            else if chkvalue == "3"
            {
                let string = rentCityArr
                let string1 = string.joined(separator: ",")
                
                
                let city = string1
                if city == ""
                {
                    let alert = UIAlertController(title: "", message: "Please Enter city", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true)
                }
                
                
                let trimmedString = city.trimmingCharacters(in:.whitespaces)
                param = ["key":"5642vcb546gfnbvb7r6ewc211365v13122",
                         "userid": Singleton.sharedInstance.loginModel?.first?.data?.id ?? "",
                         "city":trimmedString,
                         "p1":lowerValue12,
                         "p2":higherValue12,
                         "property_type": property,
                         "room_in_bhk":room_in_bhk,
                         "house_unit":UserDefaults.standard.value(forKey: "sqdatacom1") ?? "",
                         "a1":areaMinimum1,
                         "a2":areaMaximum1,
                         "room_type":furnished,
                         "image_search":imagesearch,
                         "floor":floor,
                         "search":"",
                         "page":"null"]
            }
            
        }
        
        
        print(param)
        
        ApiManager.apiPostFilter(url: link, param: param) { (json, error) in
            
            if error != nil{
                print(json)
                print(error?.localizedDescription ?? "")
                
            }else {
                
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                    
                    if (self.homeScreenModel?.first?.code ?? "") == "200" {
                        
                        
                        //  DispatchQueue.main.async {
                        
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
                        
                        vc.homeScreenModel = self.homeScreenModel
                        
                        vc.comeFrom = .searchData
                        
                        vc.param = param
                        
                        vc.searchLink = self.link
                        
                        self.navigationController?.pushViewController(vc, animated: true)
                        //     }
                        
                        
                    }else{
                        
                        
                        self.presentAlert(msg: "Record not found")
                    }
                    
                    
                }catch  {
                    
                    print("err \(error)")
                    
                }
            }
            
        }
        
    }
    
    
    
}
extension SearchComericalVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cityModel?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = search_tebleView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        if self.cityModel?.data?.count ?? 0 > 0  {
            let trimmedString = self.cityModel?.data?[indexPath.row].cityName ?? "".trimmingCharacters(in:.whitespaces)
            cell.data_label.text = trimmedString
        }
        
        if buySelected == true{
            selectedCityArray.removeAll()
            
            selectedCityArray = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
        }
        else{
            selectedCityArray.removeAll()
            
            selectedCityArray = UserDefaults.standard.value(forKey: "rent") as? [String] ?? []
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var city = ""
        if self.cityModel?.data?.count ?? 0 > 0  {
            city = self.cityModel?.data?[indexPath.row].cityName ?? ""
            print(city)
            if buySelected == true
            {
                selectedCityArray.removeAll()
                buyCityArr.append(city)
                //  UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
                
                selectedCityArray = buyCityArr
                UserDefaults.standard.set(selectedCityArray, forKey: "buy")
                if !selectedCityArray.contains(city) {
                    
                    selectedCityArray.append(city)
                    //  UserDefaults.standard.set(selectedCityArray, forKey: "cityName")
                    
                }
            }
            else
            {
                selectedCityArray.removeAll()
                rentCityArr.append(city)
                
                
                selectedCityArray = rentCityArr
                UserDefaults.standard.set(selectedCityArray, forKey: "rent")
                if !selectedCityArray.contains(city) {
                    
                    selectedCityArray.append(city)
                    //   UserDefaults.standard.set(selectedCityArray, forKey: "cityName1")
                    
                }
            }
        }
        
        
        
        
        search_textfield.text = ""
        
        
        collection_height.constant = 80
        city_collectionView.isHidden = false
        
        search_tebleView.isHidden = true
        
        city_collectionView.reloadData()
        
        
    }
    
}

extension String {
    
    func trimAllSpace1() -> String {
        return components(separatedBy: .whitespacesAndNewlines).joined()
    }
    
    func trimSpace1() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
extension SearchComericalVC : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if  collectionView == showCityListCollectionView{
            return searchCityName.count
        }
        else {
        return selectedCityArray.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if  collectionView == showCityListCollectionView{
            let cityCell = showCityListCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCommercialCityCollectionViewCell", for: indexPath) as! SearchCommercialCityCollectionViewCell
            cityCell.labelName.text = searchCityName[indexPath.row]
            cityCell.delete_btn.addTarget(self, action: #selector(tap_deletBtn), for: .touchUpInside)
            cityCell.delete_btn.tag = indexPath.row
            
            return cityCell
        }
        else{
        let cell = city_collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedCityCollectionViewCell", for: indexPath) as! SelectedCityCollectionViewCell
        objcell = cell
        if buySelected == true
        {
            
            cell.data_label.isHidden = false
            cell.data_label.text = selectedCityArray[indexPath.row]
            cell.data_label1.isHidden = true
            
        }
        else
        {
            cell.data_label1.isHidden = false
            cell.data_label1.text = selectedCityArray[indexPath.row]
            cell.data_label.isHidden = true
        }
        //
        cell.cross_btn.addTarget(self, action: #selector(tap_cross_btn), for: .touchUpInside)
        cell.cross_btn.tag = indexPath.row
        return cell
            
        }
 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

      if collectionView.numberOfItems(inSection: section) == 1 {

           let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

          return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: city_collectionView.frame.width - flowLayout.itemSize.width)

      }

      return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

  }
    
    @objc func tap_deletBtn(sender:UIButton){
        let index = sender.tag
        searchCityName.remove(at:index)
        searchIdName.remove(at:index)
        
        if searchCityName.count != 0 {
            seacrhCityHeightConstraint.isActive = true
            seacrhCityHeightConstraint.constant = 100
        }
        else{
            seacrhCityHeightConstraint.isActive = true
            seacrhCityHeightConstraint.constant = 0
        }

        self.showCityListCollectionView.reloadData()
    }
        
    
    
    @objc func tap_cross_btn(sender : UIButton) {
        
        if buySelected == true{
            selectedCityArray.remove(at: sender.tag)
            if buyCityArr.count > 0{
                buyCityArr.remove(at: sender.tag)
            }
            
            UserDefaults.standard.set(selectedCityArray, forKey: "buy")
            selectedCityArray = UserDefaults.standard.value(forKey: "buy") as? [String] ?? []
            
            if selectedCityArray.isEmpty {
                buyCityArr.removeAll()
                collection_height.constant = 0
                city_collectionView.isHidden = true
                
            }else{
                collection_height.constant = 80
                city_collectionView.isHidden = false
                
            }
        }
        else{
            selectedCityArray.remove(at: sender.tag)
            if rentCityArr.count > 0{
                rentCityArr.remove(at: sender.tag)
            }
            
            UserDefaults.standard.set(selectedCityArray, forKey: "rent")
            selectedCityArray = UserDefaults.standard.value(forKey: "rent") as? [String] ?? []
            
            if selectedCityArray.isEmpty {
                rentCityArr.removeAll()
                collection_height.constant = 0
                city_collectionView.isHidden = true
            }else{
                collection_height.constant = 80
                city_collectionView.isHidden = false
            }
            
        }
        
        
        city_collectionView.reloadData()
        
    }
    
}


//MARK: extenion for get city Name

extension SearchComericalVC:PasscityName{
    func passcityAddress(cityName: [String], cityId: [String]) {
        searchCityName.removeAll()
        searchIdName.removeAll()
        let uniqcityName = Array(Set(cityName))
        print(uniqcityName)
        let uniqcityId = Array(Set(cityId))

        searchCityName.append(contentsOf: uniqcityName)
        searchIdName.append(contentsOf: uniqcityId)
        
        if cityName.count != 0 {
            seacrhCityHeightConstraint.isActive = true
            seacrhCityHeightConstraint.constant = 100
        }
        else{
            seacrhCityHeightConstraint.isActive = true
            seacrhCityHeightConstraint.constant = 0
        }

        self.showCityListCollectionView.reloadData()
    }
    
    
}

extension SearchComericalVC : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch selctionType {
            
        case .bedRoom:
            
            return room_Array.count
            
            
        case .propertyType:
            
            return apartment_Array.count
            
        case .sqFeet:
            
            return owner_array.count
            
        case .floor:
            
            return floor_Array.count
            
        case .furnished:
            
            return furnished_Array.count
            
        case .image:
            
            return imageSelection_Array.count
            
        case .commercialProp:
            
            return commercialProperty.count
            
        case .commercialPropfloor:
            return floor_Array1.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        switch selctionType {
            
        case .bedRoom:
            
            return room_Array[row]
            
            
        case .propertyType:
            
            return apartment_Array[row]
            
        case .sqFeet:
            
            return owner_array[row]
            
        case .floor:
            
            return floor_Array[row]
            
        case .furnished:
            
            return furnished_Array[row]
            
        case .image:
            
            return imageSelection_Array[row]
            
        case .commercialProp:
            
            return commercialProperty[row]
        case .commercialPropfloor:
            return floor_Array1[row]
        }
        
        
        
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        switch selctionType {
            
        case .bedRoom:
            //  let trimmedString = string1.trimmingCharacters(in:.whitespaces)
            
            selectedRoomType_label.text! = room_Array[row]
            
            break
        case .propertyType:
            
            Searchcomproperty_lbl.text! = apartment_Array[row]
            break
            
        case .sqFeet:
            let string = owner_array
            let string1 = string.joined(separator: " ,")
            
            if chkvalue == "2"
            {
                if owner_array[row].contains("Sq.yards")
                {
                    
                    sqfeet = "Sq.yards"
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    sqt_label.text = trimmedString
                    
                    
                    
                    
                }
                else
                {
                    sqfeet = owner_array[row]
                    
                    //                  owner_array =  ["Sq.ft","Sq.yards","Sq.meter", "Acres" , "Marla" , "Cents" , "Bigha" , "Kotha" , "Grounds" , "Hectare" ]
                    sqt_label.text = owner_array[row]
                    
                    
                }
                sqt_label.text = owner_array[row]
                
                UserDefaults.standard.set(sqt_label.text, forKey: "sqdatacom")
            }
            else if chkvalue == "1"
            {
                if owner_array[row].contains("Sq.yards")
                {
                    
                    sqfeet = "Sq.yards"
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    sqt_label.text = trimmedString
                    
                    
                    
                    
                }
                else
                {
                    sqfeet = owner_array[row]
                    
                    //                  owner_array =  ["Sq.ft","Sq.yards","Sq.meter", "Acres" , "Marla" , "Cents" , "Bigha" , "Kotha" , "Grounds" , "Hectare" ]
                    sqt_label.text = owner_array[row]
                    
                    
                }
                sqt_label.text = owner_array[row]
                
                UserDefaults.standard.set(sqt_label.text, forKey: "sqdatacom")
            }
            else  if chkvalue == "3"
            {
                if owner_array[row].contains("Sq.yards")
                {
                    
                    sqfeet =  "Sq.yards"
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    sqt_label1.text = trimmedString
                    
                    UserDefaults.standard.set(sqt_label1.text, forKey: "sqdatacom1")
                    
                    
                    
                }
                else
                {
                    sqfeet = owner_array[row]
                    
                    //                  owner_array =  ["Sq.ft","Sq.yards","Sq.meter", "Acres" , "Marla" , "Cents" , "Bigha" , "Kotha" , "Grounds" , "Hectare" ]
                    sqt_label1.text = owner_array[row]
                    
                    
                }
                sqt_label1.text = owner_array[row]
                
                UserDefaults.standard.set(sqt_label1.text, forKey: "sqdatacom1")
            }
            
            
            
            break
            
        case .floor:
            //        floor_label.text! = floor_Array[row]
            if chkvalue == "2"
            {
                floorcomlabel.text! = floor_Array[row]
                UserDefaults.standard.set(floorcomlabel.text, forKey: "floordatacom")
            }
            else if chkvalue == "3"
            {
                floorcomlabel1.text! = floor_Array1[row]
                UserDefaults.standard.set(floorcomlabel1.text, forKey: "floordatacom1")
            }
            
            
            // if floor_Array[row].contains("Floor Preference")
            //            {
            //                floorji = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,Duplex,Bungalow"
            //                  floor_label.text = floor_Array .joined(separator: ",").trimSpace()
            //            }
            //            else
            //
            //            {
            //                floorji = floor_Array[row]
            //                UserDefaults.standard.set(floor_label.text, forKey: "flortext")
            //                floor_label.text = floor_Array[row]
            //                print(floor_label.text as Any)
            //
            //
            //            }
            break
            
            
            
        case .furnished:
            let string = furnished_Array
            if chkvalue == "2"
            {
                
                let string1 = string.joined(separator: " ,")
                
                print(furnished_Array[row].contains("All"))
                
                if furnished_Array[row].contains("All")
                {
                    room = "All"
                    //  let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    furnished_label.text = trimmedString
                    
                    print(furnished_label.text ?? "")
                }
                else
                {
                    room = furnished_Array[row]
                    furnished_label.text = furnished_Array[row]
                    //                        var imagesearch = "All"
                    //                                          var floor = "Floor Preference"
                    //                                          var p2 = "10000000000"
                    print(furnished_label.text as Any)
                    
                }
                furnished_label.text = furnished_Array[row]
                UserDefaults.standard.set(furnished_label.text, forKey: "furnishedcom")
                
            }
            else if chkvalue == "1"
            {
                
                let string1 = string.joined(separator: " ,")
                
                print(furnished_Array[row].contains("All"))
                
                if furnished_Array[row].contains("All")
                {
                    room = "All"
                    //  let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    furnished_label.text = trimmedString
                    
                    print(furnished_label.text ?? "")
                }
                else
                {
                    room = furnished_Array[row]
                    furnished_label.text = furnished_Array[row]
                    //                        var imagesearch = "All"
                    //                                          var floor = "Floor Preference"
                    //                                          var p2 = "10000000000"
                    print(furnished_label.text as Any)
                    
                }
                furnished_label.text = furnished_Array[row]
                UserDefaults.standard.set(furnished_label.text, forKey: "furnishedcom")
                
            }
            else  if chkvalue == "3"
            {
                let string1 = string.joined(separator: " ,")
                
                print(furnished_Array[row].contains("All"))
                
                if furnished_Array[row].contains("All")
                {
                    room = "All"
                    //  let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    furnished_label1.text = trimmedString
                    
                    print(furnished_label1.text ?? "")
                }
                else
                {
                    room = furnished_Array[row]
                    furnished_label1.text = furnished_Array[row]
                    //                        var imagesearch = "All"
                    //                                          var floor = "Floor Preference"
                    //                                          var p2 = "10000000000"
                    print(furnished_label.text as Any)
                    
                }
                furnished_label1.text = furnished_Array[row]
                UserDefaults.standard.set(furnished_label1.text, forKey: "furnishedcom1")
                
            }
            break
            
            
            
        case .image:
            //let res = imageSelection_Array.reduce("") { $0 + $1 }
            //   let res = imageSelection_Array.reduce("") { $0 + $1 }
            let string = imageSelection_Array
            let string1 = string.joined(separator: " ,")
            
            print(imageSelection_Array[row].contains("All"))
            if chkvalue == "2"
            {
                
                
                if imageSelection_Array[row].contains("All")
                {
                    imagesearch = "All,With Images"
                    
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    //let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    
                    imageSelection_label.text = trimmedString
                    
                    
                    print(imageSelection_label.text ?? "")
                }
                else
                {
                    imagesearch = imageSelection_Array[row]
                    
                    imageSelection_label.text = imageSelection_Array[row]
                    print(imageSelection_label.text as Any)
                    
                }
                UserDefaults.standard.set(imageSelection_label.text, forKey: "imagecom")
                
            }
            else if chkvalue == "3"
            {
                if imageSelection_Array[row].contains("All")
                {
                    imagesearch = "All,With Images"
                    
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    //let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    
                    imageSelection_label1.text = trimmedString
                    
                    
                    print(imageSelection_label.text ?? "")
                }
                else
                {
                    imagesearch = imageSelection_Array[row]
                    
                    imageSelection_label1.text = imageSelection_Array[row]
                    print(imageSelection_label1.text as Any)
                    
                }
                UserDefaults.standard.set(imageSelection_label1.text, forKey: "imagecom1")
                
            }
            
            
        case .commercialProp:
            if chkvalue == "2"
            {
                let string = commercialProperty
                let string1 = string.joined(separator: ",")
                
                print(commercialProperty[row].contains("All"))
                if commercialProperty[row].contains("All")
                {
                    comProperty = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                    
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    //let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    
                    Searchcomproperty_lbl.text = trimmedString
                    
                    print(Searchcomproperty_lbl.text ?? "")
                    UserDefaults.standard.set(Searchcomproperty_lbl.text, forKey: "propertyvaluecom")
                    
                }
                
                else
                {
                    comProperty = self.commercialProperty[row]
                    
                    self.Searchcomproperty_lbl.text = self.commercialProperty[row]
                    print(self.Searchcomproperty_lbl.text as Any)
                    UserDefaults.standard.set(Searchcomproperty_lbl.text, forKey: "propertyvaluecom")
                    
                    
                }
                UserDefaults.standard.set(Searchcomproperty_lbl.text, forKey: "propertyvaluecom")
            }
            else   if chkvalue == "3"
            {
                let string = commercialProperty
                let string1 = string.joined(separator: ",")
                
                print(commercialProperty[row].contains("All"))
                if commercialProperty[row].contains("All")
                {
                    comProperty = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                    
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    //let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    
                    Searchcomproperty_lbl1.text = trimmedString
                    
                    print(Searchcomproperty_lbl.text ?? "")
                    UserDefaults.standard.set(Searchcomproperty_lbl1.text, forKey: "propertyvaluecom1")
                    
                }
                
                else
                {
                    comProperty = self.commercialProperty[row]
                    
                    self.Searchcomproperty_lbl.text = self.commercialProperty[row]
                    print(self.Searchcomproperty_lbl.text as Any)
                    UserDefaults.standard.set(Searchcomproperty_lbl1.text, forKey: "propertyvaluecom1")
                    
                    
                }
                UserDefaults.standard.set(Searchcomproperty_lbl1.text, forKey: "propertyvaluecom1")
            }
            
            break
            
            
        case .commercialPropfloor:
            if chkvalue == "2"
            {
                floorcomlabel.text! = floor_Array[row]
                UserDefaults.standard.set(floorcomlabel.text, forKey: "floordatacom")
            }
            else if chkvalue == "3"
            {
                floorcomlabel1.text! = floor_Array1[row]
                UserDefaults.standard.set(floorcomlabel1.text, forKey: "floordatacom1")
            }
            
        }
        
        
    }
    
}
