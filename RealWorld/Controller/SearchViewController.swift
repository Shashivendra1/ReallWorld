//
//  SearchViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 11/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
import RangeSeekSlider

enum SearchBy {
    case residential
    case commercial
}
var lowerValue = "0"
var lowerValue1 = "0"

var higherValue = "1000000000"
var higherValue1 = "2000000"

var imagesearch = "All"
var sqfeet = "Sq.yards"
var floorji = ""
var room = "All"
var comProperty = "All"
var p2 = "1000000000"
var selectedCityArray : [String] = []
var buySelected = true
var buyCityArr = [String]()
var rentCityArr = [String]()


class SearchViewController: BaseViewController, SelectedItem,RangeSeekSliderDelegate {
    
    
    @IBOutlet weak var selectCityViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectCityUiView: UIView!
    @IBOutlet weak var propertytype_btn1: UIButton!
    @IBOutlet weak var propertytype_btn: UIButton!
    @IBOutlet weak var btnRent: UIButton!
    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var collection_height: NSLayoutConstraint!
    
    @IBOutlet weak var cityUiView: UIView!
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
    
    @IBOutlet weak var selectedPropertyType_label1: UILabel!
    
    @IBOutlet weak var selectedPropertyType_label: UILabel!
    
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
    @IBOutlet weak var floor_label: UILabel!
    var objcell = SelectedCityCollectionViewCell()
    
    @IBOutlet weak var floor_btn: UIButton!
    var rentselected = false
    
    @IBOutlet weak var floorbtn1: UIButton!
    @IBOutlet weak var floor_label1: UILabel!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    
    var searchCityName = [String]()
    var searchIdName = [String]()

    var page = 1
    var sliderchkvalue = "1"
    let arr = [UserDefaults.standard.value(forKey: "cityName")]
    let arr1 = [UserDefaults.standard.value(forKey: "cityName1")]
    
    var buyPressed = true
    var areaMinimum = "0"
    var areaMaximum = "10000"
    var areaMinimum1 = "0"
    var areaMaximum1 = "10000"
    var comesfromResenditial = true
    var searchBy : SearchBy = .residential
    var owner_array = [String]()
    var selectedRooms = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk,Plot"
    var selctionType : FieldType = .propertyType
    
    var apartment_Array = ["All","Apartment","Service Apartment","Builder floor","Plot/Land","House/Villa","Farmhouse"]
    var commercialProperty = ["All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"]
    var apartment_Array2 = ["Office Space","Co-working Office", "Commercial Lands/Plots", "Hotel/Resorts", "Guest-House/Banquet-Halls", "Shop/Showroom", "Industrial land", "Agriculture/Farmland", "Factory", "Warehouse"]
    var room_Array = ["All","1 Room/Studio Apartment","1 Bhk","2 Bhk","3 Bhk","4 Bhk","5 Bhk","5+","Plot"]
    
    var floor_Array = ["All","Basement","Ground","Lower Ground","Duplex","Bungalow","1","2","3","4","5","6","7","8" ,"9","10","11","12","14","15","16","17","18","19","20+","BMT+GF"]
    var floor_Array1 = ["All","Basement","Ground","Lower Ground","Duplex","Bungalow","1","2","3","4","5","6","7","8" ,"9","10","11","12","14","15","16","17","18","19","20+","BMT+GF","Entire Building1"]
    var furnished_Array = ["All","Furnished","Semifurnished"]
    
    var imageSelection_Array = ["All","With Images"]
    
    var homeScreenModel : HomeScreenModel?
    
    var cityModel : CityModel?
    
    var link = ""
    
    var alreadySelected = ""
    var chkvalue = "2"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityUiView.layer.cornerRadius = 10
        cityUiView.layer.borderWidth = 2
        cityUiView.layer.borderColor = UIColor.darkGray.cgColor
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        selectCityViewHeightConstraint.isActive = true
        selectCityViewHeightConstraint.constant = 0
        selectCityUiView.layer.borderWidth = 2
        selectCityUiView.layer.cornerRadius = 8
        selectCityUiView.layer.borderColor = UIColor.darkGray.cgColor
        
 
        UserDefaults.standard.set(sqt_label.text, forKey: "sqdata")
        UserDefaults.standard.set(furnished_label.text, forKey: "furnished")
        UserDefaults.standard.set(imageSelection_label.text, forKey: "image")
        UserDefaults.standard.set(sqt_label1.text, forKey: "sqdata1")
        UserDefaults.standard.set(furnished_label1.text, forKey: "furnished1")
        UserDefaults.standard.set(imageSelection_label1.text, forKey: "image1")
        UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
        UserDefaults.standard.set(higherValue, forKey: "higherValue")
        UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
        UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
        UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
        UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
        UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
        UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
        
        floor_label.text = "Floor Preference"
    
        viewDidData()
        sliderLakh.isHidden = true
        slider_thousand.isHidden = true
        budget_slider.isHidden = false
        lblLakh.isHidden = true
        areamaximumthousand_lbl.isHidden = true
        lblRentMinimum.isHidden = true
        areaminimum_thousandlbl.isHidden = true
        
        selectedCityArray = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
        buyCityArr = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
        //selectedCityArray = UserDefaults.standard.value(forKey: "rentcom") as? [String] ?? []
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .purple
        
        viewDidData()
        if rentselected == true
        {
            rentBtnData()
 
            btnRent.titleLabel?.textColor = UIColor.green
            btnBuy.titleLabel?.textColor = UIColor.gray
            
        }
        else
        {
            buyBtnData()

            btnRent.titleLabel?.textColor = UIColor.gray
            btnBuy.titleLabel?.textColor = UIColor.green
            
        }
   
        if chkvalue == "2"
        {
            buyBtnData()
            
        }
        else if chkvalue == "3"
        {
            selectedRoomType_label.text = UserDefaults.standard.value(forKey: "roomvalue") as? String
            
            selectedRoomType_label1.text = UserDefaults.standard.value(forKey: "roomvalue1") as? String
            selectedPropertyType_label1.text = UserDefaults.standard.value(forKey: "propertyvalue1") as? String
            selectedPropertyType_label.text = UserDefaults.standard.value(forKey: "propertyvalue") as? String
            
            floor_label.text =  UserDefaults.standard.value(forKey: "floordata") as? String
            floor_label1.text =  UserDefaults.standard.value(forKey: "floordata1") as? String
            sqt_label1.text = UserDefaults.standard.value(forKey: "sqdata1") as? String
            furnished_label1.text = UserDefaults.standard.value(forKey: "furnished1") as? String
            areaMaximum = UserDefaults.standard.value(forKey: "areaMaximum") as? String ?? ""
            areaMinimum = UserDefaults.standard.value(forKey: "areaMinimum") as? String ?? ""
            lowerValue = UserDefaults.standard.value(forKey: "lowerValue") as? String ?? ""
            higherValue = UserDefaults.standard.value(forKey: "higherValue") as? String ?? ""
            areaMaximum1 = UserDefaults.standard.value(forKey: "areaMaximum1") as? String ?? ""
            areaMinimum1 = UserDefaults.standard.value(forKey: "areaMinimum1") as? String ?? ""
            lowerValue1 = UserDefaults.standard.value(forKey: "lowerValue1") as? String ?? ""
            higherValue1 = UserDefaults.standard.value(forKey: "higherValue1") as? String ?? ""
            
            
            selectedRoomType_label1.isHidden = false
            selectedRoomType_label.isHidden = true
            selectedPropertyType_label1.isHidden = false
            selectedPropertyType_label.isHidden = true
            floor_label.isHidden = true
            floor_label1.isHidden = false
            sqt_label.isHidden = true
            sqt_label1.isHidden = false
            furnished_label.isHidden = true
            furnished_label1.isHidden = false
            budgetMaximumPrice_label.isHidden = true
            sliderLakh.isHidden = false
            budgetMinimuPrice_label.isHidden = true
            lblRentMinimum.isHidden = false
            
        }
        
        
        
        switch searchBy {
            
        case .commercial:
            
            self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Commercial Search", bgColor: .clear, barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            rent_label.text = "LEASE COMMERCIAL"
            buy_label.text = "BUY COMMERCIAL"
            
        case .residential:
            rent_label.text = "RENT RESINDENTIAL"
            buy_label.text = "BUY RESIDENTIAL"
            self.addNavigationBar(leftBar: .Back, titleType: .Normal, title: "Residential Search", bgColor: .clear, barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            
        }
        
    }
    func buyBtnData(){

        chkvalue = "2"
        
        buySelected = true
        if buySelected == true{
            selectedCityArray.removeAll()
            
            selectedCityArray = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
        }
        else{
            selectedCityArray.removeAll()
            
            selectedCityArray = UserDefaults.standard.value(forKey: "rentcom") as? [String] ?? []
            
        }
        areaMaximumPrice_label.isHidden = false
        areaMinimumPrice_label.isHidden = false
        areamaximumthousand_lbl.isHidden = true
        areaminimum_thousandlbl.isHidden = true
        search_tebleView.reloadData()
        city_collectionView.reloadData()
        selectedRoomType_label.isHidden = false
        selectedRoomType_label1.isHidden = true
        selectedPropertyType_label.isHidden = false
        selectedPropertyType_label1.isHidden = true
        floor_label.isHidden = false
        floor_label1.isHidden = true
        sqt_label.isHidden = false
        sqt_label1.isHidden = true
        furnished_label.isHidden = false
        furnished_label1.isHidden = true
        imageSelection_label.isHidden = false
        imageSelection_label1.isHidden = true

        floor_label.text =  UserDefaults.standard.value(forKey: "floordata") as? String
        floor_label1.text =  UserDefaults.standard.value(forKey: "floordata1") as? String
        selectedPropertyType_label.text = UserDefaults.standard.value(forKey: "propertyvalue") as? String
        selectedPropertyType_label1.text = UserDefaults.standard.value(forKey: "propertyvalue1") as? String
        selectedRoomType_label.text = UserDefaults.standard.value(forKey: "roomvalue") as? String
        selectedRoomType_label1.text = UserDefaults.standard.value(forKey: "roomvalue1") as? String
        furnished_label1.text = UserDefaults.standard.value(forKey: "furnished1") as? String
        furnished_label.text = UserDefaults.standard.value(forKey: "furnished") as? String
        
        print(selectedRoomType_label.text as Any)
        sqt_label.text = UserDefaults.standard.value(forKey: "sqdata") as? String
        sqt_label1.text = UserDefaults.standard.value(forKey: "sqdata1") as? String
        imageSelection_label.text = UserDefaults.standard.value(forKey: "image") as? String
        imageSelection_label1.text = UserDefaults.standard.value(forKey: "image1") as? String
        areaMaximum = UserDefaults.standard.value(forKey: "areaMaximum") as? String ?? ""
        areaMinimum = UserDefaults.standard.value(forKey: "areaMinimum") as? String ?? ""
        lowerValue = UserDefaults.standard.value(forKey: "lowerValue") as? String ?? ""
        higherValue = UserDefaults.standard.value(forKey: "higherValue") as? String ?? ""
        areaMaximum1 = UserDefaults.standard.value(forKey: "areaMaximum1") as? String ?? ""
        areaMinimum1 = UserDefaults.standard.value(forKey: "areaMinimum") as? String ?? ""
        lowerValue1 = UserDefaults.standard.value(forKey: "lowerValue1") as? String ?? ""
        higherValue1 = UserDefaults.standard.value(forKey: "higherValue1") as? String ?? ""
        
        propertytype_btn.isHidden = true
        propertytype_btn1.isHidden = false
        floor_btn.isHidden = true
        floorbtn1.isHidden = false
        
        setBuyRent(buy:UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), rent: UIColor.black , buyLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1) , rentLine : UIColor.clear)
        budget_slider.isHidden = false
        sliderLakh.isHidden = true
        slider_thousand.isHidden = true
        
        lblRentMinimum.isHidden = true
        areaminimum_thousandlbl.isHidden = true
        budgetMinimuPrice_label.isHidden = false
        budgetMaximumPrice_label.isHidden = false
        lblLakh.isHidden = true

        switch searchBy
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
        lblLakh.isHidden = true
        areamaximumthousand_lbl.isHidden = true
        
        lblRentMinimum.isHidden = true
        areaminimum_thousandlbl.isHidden = true
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
        
        switch searchBy {
            
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
        
        switch searchBy {
            
        case .commercial:
            
            link = Api.searchBuyCommercial
            
        case .residential:
            
            link = Api.searchBuyResidential
        }
        
        //        budgetMinimuPrice_label.isHidden = false
        //        budgetMaximumPrice_label.isHidden = false
    }
    
    //MARK:- Button Action
    
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
    
    @IBAction func tap_floorPreference_btn1(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        vc.delegate = self
        vc.comesFromBuy = buyPressed
        vc.arry = Array(arrayLiteral: floor_label1.text ?? "")
        vc.selctionType = .floor
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tap_floorPreference_btn(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        vc.delegate = self
        vc.comesFromBuy = buyPressed
        vc.arry = Array(arrayLiteral: floor_label.text ?? "")
        vc.selctionType = .floor
        self.navigationController?.pushViewController(vc, animated: true)
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
                lowerValue = "0"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=5  && minValue < 10
            {
                budgetMinimuPrice_label.text  = "5 Lacs"
                lowerValue = "500000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=10  && minValue < 20
            {
                budgetMinimuPrice_label.text = "10 Lacs"
                lowerValue = "1000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=20  && minValue < 30
            {
                budgetMinimuPrice_label.text = "15 Lacs"
                lowerValue = "1500000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=30  && minValue < 40
            {
                budgetMinimuPrice_label.text = "20 Lacs"
                lowerValue = "2000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=40  && minValue < 50
            {
                budgetMinimuPrice_label.text = "25 Lacs"
                lowerValue = "2500000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=50  && minValue < 60
            {
                budgetMinimuPrice_label.text = "30 Lacs"
                lowerValue = "3000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=60  && minValue < 70
            {
                budgetMinimuPrice_label.text = "40 Lacs"
                lowerValue = "4000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=70  && minValue < 80
            {
                budgetMinimuPrice_label.text = "50 Lacs"
                lowerValue = "5000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=80  && minValue < 90
            {
                budgetMinimuPrice_label.text = "60 Lacs"
                lowerValue = "6000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=90  && minValue < 95
            {
                budgetMinimuPrice_label.text = "75 Lacs"
                lowerValue = "7500000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=95  && minValue < 100
            {
                budgetMinimuPrice_label.text = "1 Crore"
                lowerValue = "10000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=100  && minValue < 105
            {
                budgetMinimuPrice_label.text = "1.5 Crore"
                lowerValue = "150000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=105  && minValue < 110
            {
                budgetMinimuPrice_label.text = "2 Crore"
                lowerValue = "20000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
                
            }
            else if minValue>=110  && minValue < 115
            {
                budgetMinimuPrice_label.text = "2.5 Crore"
                lowerValue = "25000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            
            else if minValue>=115  && minValue < 120
            {
                budgetMinimuPrice_label.text = "3 Crore"
                lowerValue = "30000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=120  && minValue < 125
            {
                budgetMinimuPrice_label.text = "3.5 Crore"
                lowerValue = "35000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=125  && minValue < 130
            {
                budgetMinimuPrice_label.text = "4 Crore"
                lowerValue = "40000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            
            else if minValue>=130  && minValue < 135
            {
                budgetMinimuPrice_label.text = "5 Crore"
                lowerValue = "50000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=135  && minValue < 140
            {
                budgetMinimuPrice_label.text = "10 Crore"
                lowerValue = "100000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=140  && minValue < 150
            {
                budgetMinimuPrice_label.text = "20 Crore"
                lowerValue = "200000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            
            else if minValue>=150  && minValue < 160
            {
                budgetMinimuPrice_label.text = "30 Crore"
                lowerValue = "300000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            else if minValue>=160  && minValue < 170
            {
                budgetMinimuPrice_label.text = "50 Crore"
                lowerValue = "500000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            
            else if minValue == 170
            {
                budgetMinimuPrice_label.text = "100 Crore+"
                lowerValue = "1000000000"
                UserDefaults.standard.set(lowerValue, forKey: "lowerValue")
                
            }
            
            
            /// max
            if maxValue>=0 && maxValue < 10
            {
                budgetMaximumPrice_label.text  = "0"
                higherValue = "0"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=5  && maxValue < 10
            {
                budgetMaximumPrice_label.text  = "5 Lacs"
                higherValue = "500000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=10  && maxValue < 20
            {
                budgetMaximumPrice_label.text = "10 Lacs"
                higherValue = "1000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=20  && maxValue < 30
            {
                budgetMaximumPrice_label.text = "15 Lacs"
                higherValue = "1500000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=30  && maxValue < 40
            {
                budgetMaximumPrice_label.text = "20 Lacs"
                higherValue = "2000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=40  && maxValue < 50
            {
                budgetMaximumPrice_label.text = "25 Lacs"
                higherValue = "2500000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=50  && maxValue < 60
            {
                budgetMaximumPrice_label.text = "30 Lacs"
                higherValue = "3000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=60  && maxValue < 70
            {
                budgetMaximumPrice_label.text = "40 Lacs"
                higherValue = "4000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=70  && maxValue < 80
            {
                budgetMaximumPrice_label.text = "50 Lacs"
                higherValue = "5000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=80  && maxValue < 90
            {
                budgetMaximumPrice_label.text = "60 Lacs"
                higherValue = "6000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=90  && maxValue < 95
            {
                budgetMaximumPrice_label.text = "75 Lacs"
                higherValue = "7500000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=95  && maxValue < 100
            {
                budgetMaximumPrice_label.text = "1 Crore"
                higherValue = "10000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=100  && maxValue < 105
            {
                budgetMaximumPrice_label.text = "1.5 Crore"
                higherValue = "15000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=105  && maxValue < 110
            {
                budgetMaximumPrice_label.text = "2 Crore"
                higherValue = "20000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=110  && maxValue < 115
            {
                budgetMaximumPrice_label.text = "2.5 Crore"
                higherValue = "25000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            
            else if maxValue>=115  && maxValue < 120
            {
                budgetMaximumPrice_label.text = "3 Crore"
                higherValue = "30000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=120  && maxValue < 125
            {
                budgetMaximumPrice_label.text = "3.5 Crore"
                higherValue = "35000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=125  && maxValue < 130
            {
                budgetMaximumPrice_label.text = "4 Crore"
                higherValue = "40000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=130  && maxValue < 135
            {
                self.budgetMaximumPrice_label.text = "5 Crore"
                higherValue = "50000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=135  && maxValue < 140
            {
                self.budgetMaximumPrice_label.text = "10 Crore"
                higherValue = "100000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=140  && maxValue < 150
            {
                self.budgetMaximumPrice_label.text = "20 Crore"
                higherValue = "200000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            else if maxValue>=150  && maxValue < 160
            {
                self.budgetMaximumPrice_label.text = "30 Crore"
                higherValue = "300000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            
            else if maxValue>=160  && maxValue < 170
            {
                self.budgetMaximumPrice_label.text = "50 Crore"
                higherValue = "500000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            
            
            else if (maxValue == 170)
            {
                self.budgetMaximumPrice_label.text = "100 Crore+"
                higherValue = "1000000000"
                UserDefaults.standard.set(higherValue, forKey: "higherValue")
                
            }
            
        }
        
        else if slider === sliderLakh {
            
            if (minValue == 0) {
                lblRentMinimum.text = "0"
                lowerValue1 = "0"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue > 0 && minValue < 10) {
                lblRentMinimum.text = "10 Thousand"
                lowerValue1 = "10000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
                
            } else if (minValue >= 10 && minValue < 20) {
                lblRentMinimum.text = "20 Thousand"
                lowerValue1 = "20000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 20 && minValue < 30) {
                lblRentMinimum.text = "30 Thousand"
                lowerValue1 = "30000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 30 && minValue < 40) {
                lblRentMinimum.text = "40 Thousand"
                lowerValue1 = "40000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 40 && minValue < 50) {
                lblRentMinimum.text = "50 Thousand"
                lowerValue1 = "50000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 50 && minValue < 60) {
                lblRentMinimum.text = "60 Thousand"
                lowerValue1 = "60000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 60 && minValue < 70) {
                lblRentMinimum.text = "75 Thousand"
                lowerValue1 = "75000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 70 && minValue < 80) {
                lblRentMinimum.text = "1 Lac"
                lowerValue1 = "100000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 80 && minValue < 90) {
                lblRentMinimum.text = "1.25 Lacs"
                lowerValue1 = "125000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 90 && minValue < 95) {
                lblRentMinimum.text = "1.5 Lacs"
                lowerValue1 = "150000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 95 && minValue < 100) {
                lblRentMinimum.text = "1.75 Lacs"
                lowerValue1 = "1750000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 100 && minValue < 105) {
                lblRentMinimum.text = "2 Lacs"
                lowerValue1 = "200000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 105 && minValue < 110) {
                lblRentMinimum.text = "2.5 Lacs"
                lowerValue1 = "250000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 110 && minValue < 120) {
                lblRentMinimum.text = "3 Lacs"
                lowerValue1 = "300000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 120 && minValue < 130) {
                lblRentMinimum.text = "3.5 Lacs"
                lowerValue1 = "350000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 130 && minValue < 140) {
                lblRentMinimum.text = "4 Lacs"
                lowerValue1 = "400000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
                
            } else if (minValue >= 140 && minValue < 150) {
                lblRentMinimum.text = "4.5 Lacs"
                lowerValue1 = "450000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 150 && minValue < 155) {
                lblRentMinimum.text = "5 Lacs"
                lowerValue1 = "500000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 155 && minValue < 160) {
                lblRentMinimum.text = "7.5 Lacs"
                lowerValue1 = "750000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 160 && minValue < 170) {
                lblRentMinimum.text = "10 Lacs"
                lowerValue1 = "1000000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue >= 170 && minValue < 180) {
                lblRentMinimum.text = "15 Lacs"
                lowerValue1 = "1500000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
            } else if (minValue == 180) {
                lblRentMinimum.text = "20 Lacs+"
                lowerValue1 = "2000000"
                UserDefaults.standard.set(lowerValue1, forKey: "lowerValue1")
                
                
            }
            
            
            
            
            
            //MAX
            if (maxValue == 0) {
                lblLakh.text = "0"
                higherValue1 = "0"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue > 0 && sliderLakh.maxValue < 10) {
                lblLakh.text = "10 Thousand"
                higherValue1 = "10000"
            } else if (maxValue >= 10 && maxValue < 20) {
                lblLakh.text = "20 Thousand"
                higherValue1 = "20000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
                
            } else if (maxValue >= 20 && maxValue < 30) {
                lblLakh.text = "30 Thousand"
                higherValue1 = "30000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 30 && maxValue < 40) {
                lblLakh.text = "40 Thousand"
                higherValue1 = "40000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 40 && maxValue < 50) {
                lblLakh.text = "50 Thousand"
                higherValue1 = "50000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 50 && maxValue < 60) {
                lblLakh.text = "60 Thousand"
                higherValue1 = "60000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 60 && maxValue < 70) {
                lblLakh.text = "75 Thousand"
                higherValue1 = "75000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 70 && maxValue < 80) {
                lblLakh.text = "1 Lac"
                higherValue1 = "100000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 80 && maxValue < 90) {
                lblLakh.text = "1.25 Lacs"
                higherValue1 = "125000"
                
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 90 && maxValue < 95) {
                lblLakh.text = "1.5 Lacs"
                higherValue1 = "125000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 95 && maxValue < 100) {
                lblLakh.text = "1.75 Lacs"
                higherValue1 = "175000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 100 && maxValue < 105) {
                lblLakh.text = "2 Lacs"
                higherValue1 = "200000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 105 && maxValue < 110) {
                lblLakh.text = "2.5 Lacs"
                higherValue1 = "250000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 110 && maxValue < 120) {
                lblLakh.text = "3 Lacs"
                higherValue1 = "300000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 120 && maxValue < 130) {
                lblLakh.text = "3.5 Lacs"
                higherValue1 = "350000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 130 && maxValue < 140) {
                lblLakh.text = "4 Lacs"
                higherValue1 = "400000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 140 && maxValue < 150) {
                lblLakh.text = "4.5 Lacs"
                higherValue1 = "450000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 150 && maxValue < 155) {
                lblLakh.text = "5 Lacs"
                higherValue1 = "500000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 155 && maxValue < 160) {
                lblLakh.text = "7.5 Lacs"
                higherValue1 = "750000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 160 && maxValue < 170) {
                lblLakh.text = "10 Lacs"
                higherValue1 = "1000000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue >= 170 && maxValue < 180) {
                lblLakh.text = "15 Lacs"
                higherValue1 = "1500000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
            } else if (maxValue == 180) {
                lblLakh.text = "20 Lacs+"
                higherValue1 = "2000000"
                UserDefaults.standard.set(higherValue1, forKey: "higherValue1")
                
                
            }
        }
        else if slider === area_slider{
            
            
            
            if minValue>=0 && minValue < 10
            {
                areaMinimumPrice_label.text  = "0"
                areaMinimum = "0"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=10  && minValue < 20
            {
                areaMinimumPrice_label.text  = "100"
                areaMinimum = "100"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=20  && minValue < 30
            {
                areaMinimumPrice_label.text = "150"
                areaMinimum = "150"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=30  && minValue < 40
            {
                areaMinimumPrice_label.text = "200"
                areaMinimum = "200"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=40  && minValue < 50
            {
                areaMinimumPrice_label.text = "250"
                areaMinimum = "250"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=50  && minValue < 60
            {
                areaMinimumPrice_label.text = "300"
                areaMinimum = "300"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=60  && minValue < 70
            {
                areaMinimumPrice_label.text = "400"
                areaMinimum = "400"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=70  && minValue < 80
            {
                areaMinimumPrice_label.text = "500"
                areaMinimum = "500"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=80  && minValue < 90
            {
                areaMinimumPrice_label.text = "600"
                areaMinimum = "600"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=90  && minValue < 100
            {
                areaMinimumPrice_label.text = "800"
                areaMinimum = "800"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=100  && minValue < 110
            {
                areaMinimumPrice_label.text = "1000"
                areaMinimum = "1000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=110  && minValue < 120
            {
                areaMinimumPrice_label.text = "1500"
                areaMinimum = "1500"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=120  && minValue < 130
            {
                areaMinimumPrice_label.text = "2000"
                areaMinimum = "2000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }else if minValue>=130  && minValue < 140
            {
                areaMinimumPrice_label.text = "2500"
                areaMinimum = "2500"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=140  && minValue < 150
            {
                areaMinimumPrice_label.text = "3000"
                areaMinimum = "3000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=150  && minValue < 160
            {
                areaMinimumPrice_label.text = "3500"
                areaMinimum = "3500"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=160  && minValue < 170
            {
                areaMinimumPrice_label.text = "4000"
                areaMinimum = "4000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=170  && minValue < 180
            {
                areaMinimumPrice_label.text = "6000"
                areaMinimum = "6000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if minValue>=180  && minValue < 190
            {
                areaMinimumPrice_label.text = "8000"
                areaMinimum = "8000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
            }
            else if (minValue == 190)
            {
                areaMinimumPrice_label.text = "10000+"
                areaMinimum = "10000"
                UserDefaults.standard.set(areaMinimum, forKey: "areaMinimum")
                
                
            }
            
            ///maxxx
            if maxValue>=0 && maxValue < 10
            {
                areaMaximumPrice_label.text  = "0"
                areaMaximum = "0"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=10  && maxValue < 20
            {
                areaMaximumPrice_label.text  = "100"
                areaMaximum = "100"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=20  && maxValue < 30
            {
                areaMaximumPrice_label.text = "1500"
                areaMaximum = "150"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=30  && maxValue < 40
            {
                areaMaximumPrice_label.text = "200"
                areaMaximum = "200"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=40  && maxValue < 50
            {
                areaMaximumPrice_label.text = "250"
                areaMaximum = "250"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=50  && maxValue < 60
            {
                areaMaximumPrice_label.text = "300"
                areaMaximum = "300"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=60  && maxValue < 70
            {
                areaMaximumPrice_label.text = "400"
                areaMaximum = "400"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=70  && maxValue < 80
            {
                areaMaximumPrice_label.text = "500"
                areaMaximum = "500"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=80  && maxValue < 90
            {
                areaMaximumPrice_label.text = "600"
                areaMaximum = "600"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=90  && maxValue < 100
            {
                areaMaximumPrice_label.text = "800"
                areaMaximum = "800"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=100  && maxValue < 110
            {
                areaMaximumPrice_label.text = "1000"
                areaMaximum = "1000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=110  && maxValue < 120
            {
                areaMaximumPrice_label.text = "1500"
                areaMaximum = "1500"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=120  && maxValue < 130
            {
                areaMaximumPrice_label.text = "2000"
                areaMaximum = "2000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }else if maxValue>=130  && maxValue < 140
            {
                areaMaximumPrice_label.text = "2500"
                areaMaximum = "2500"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=140  && maxValue < 150
            {
                areaMaximumPrice_label.text = "3000"
                areaMaximum = "3000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=150  && maxValue < 160
            {
                areaMaximumPrice_label.text = "3500"
                areaMaximum = "3500"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=160  && maxValue < 170
            {
                areaMaximumPrice_label.text = "4000"
                areaMaximum = "4000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=170  && maxValue < 180
            {
                areaMaximumPrice_label.text = "6000"
                areaMaximum = "6000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if maxValue>=180  && maxValue < 190
            {
                areaMaximumPrice_label.text = "8000"
                areaMaximum = "8000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
            }
            else if (maxValue == 190)
            {
                areaMaximumPrice_label.text = "10000+"
                areaMaximum = "10000"
                UserDefaults.standard.set(areaMaximum, forKey: "areaMaximum")
                
                
            }
            
        }
        else if slider === slider_thousand{
            
            
            
            if minValue>=0 && minValue < 10
            {
                areaminimum_thousandlbl.text  = "0"
                areaMinimum1 = "0"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=10  && minValue < 20
            {
                areaminimum_thousandlbl.text  = "100"
                areaMinimum1 = "100"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=20  && minValue < 30
            {
                areaminimum_thousandlbl.text = "150"
                areaMinimum1 = "150"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            } else if minValue>=30  && minValue < 40
            {
                areaminimum_thousandlbl.text = "200"
                areaMinimum1 = "200"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=40  && minValue < 50
            {
                areaminimum_thousandlbl.text = "250"
                areaMinimum1 = "250"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=50  && minValue < 60
            {
                areaminimum_thousandlbl.text = "300"
                areaMinimum1 = "300"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=60  && minValue < 70
            {
                areaminimum_thousandlbl.text = "400"
                areaMinimum1 = "400"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=70  && minValue < 80
            {
                areaminimum_thousandlbl.text = "500"
                areaMinimum1 = "500"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=80  && minValue < 90
            {
                areaminimum_thousandlbl.text = "600"
                areaMinimum1 = "600"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=90  && minValue < 100
            {
                areaminimum_thousandlbl.text = "800"
                areaMinimum1 = "800"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=100  && minValue < 110
            {
                areaminimum_thousandlbl.text = "1000"
                areaMinimum1 = "1000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=110  && minValue < 120
            {
                areaminimum_thousandlbl.text = "1500"
                areaMinimum1 = "1500"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=120  && minValue < 130
            {
                areaminimum_thousandlbl.text = "2000"
                areaMinimum1 = "2000"
                
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }else if minValue>=130  && minValue < 140
            {
                areaminimum_thousandlbl.text = "2500"
                areaMinimum1 = "2500"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=140  && minValue < 150
            {
                areaminimum_thousandlbl.text = "3000"
                areaMinimum1 = "3000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=150  && minValue < 160
            {
                areaminimum_thousandlbl.text = "3500"
                areaMinimum1 = "3500"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=160  && minValue < 170
            {
                areaminimum_thousandlbl.text = "4000"
                areaMinimum1 = "4000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=170  && minValue < 180
            {
                areaminimum_thousandlbl.text = "6000"
                areaMinimum1 = "6000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if minValue>=180  && minValue < 190
            {
                areaminimum_thousandlbl.text = "8000"
                areaMinimum1 = "8000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
            }
            else if (minValue == 190)
            {
                areaminimum_thousandlbl.text = "10000+"
                areaMinimum1 = "10000"
                UserDefaults.standard.set(areaMinimum1, forKey: "areaMinimum1")
                
                
            }
            
            ///maxxx
            ///
            if maxValue>=0 && maxValue < 10
            {
                areamaximumthousand_lbl.text  = "0"
                areaMaximum1 = "0"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=10  && maxValue < 20
            {
                areamaximumthousand_lbl.text  = "100"
                areaMaximum1 = "100"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=20  && maxValue < 30
            {
                areamaximumthousand_lbl.text  = "150"
                areaMaximum1 = "150"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=30  && maxValue < 40
            {
                areamaximumthousand_lbl.text  = "200"
                areaMaximum1 = "200"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=40  && maxValue < 50
            {
                areamaximumthousand_lbl.text = "250"
                areaMaximum1 = "250"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=50  && maxValue < 60
            {
                areamaximumthousand_lbl.text = "300"
                areaMaximum1 = "300"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=60  && maxValue < 70
            {
                areamaximumthousand_lbl.text = "400"
                areaMaximum1 = "400"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=70  && maxValue < 80
            {
                areamaximumthousand_lbl.text = "500"
                areaMaximum1 = "500"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=80  && maxValue < 90
            {
                areamaximumthousand_lbl.text = "600"
                areaMaximum1 = "600"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=90  && maxValue < 100
            {
                areamaximumthousand_lbl.text = "800"
                areaMaximum1 = "800"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=100  && maxValue < 110
            {
                areamaximumthousand_lbl.text = "1000"
                areaMaximum1 = "1000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=110  && maxValue < 120
            {
                areamaximumthousand_lbl.text = "1500"
                areaMaximum1 = "1500"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=120  && maxValue < 130
            {
                areamaximumthousand_lbl.text = "2000"
                areaMaximum1 = "2000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }else if maxValue>=130  && maxValue < 140
            {
                areamaximumthousand_lbl.text = "2500"
                areaMaximum1 = "2500"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=140  && maxValue < 150
            {
                areamaximumthousand_lbl.text = "3000"
                areaMaximum1 = "3000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=150  && maxValue < 160
            {
                areamaximumthousand_lbl.text = "3500"
                areaMaximum1 = "3500"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=160  && maxValue < 170
            {
                areamaximumthousand_lbl.text = "4000"
                areaMaximum1 = "4000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=170  && maxValue < 180
            {
                areamaximumthousand_lbl.text = "6000"
                areaMaximum1 = "6000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if maxValue>=180  && maxValue < 190
            {
                areamaximumthousand_lbl.text = "8000"
                areaMaximum1 = "8000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
            }
            else if (maxValue == 190)
            {
                areamaximumthousand_lbl.text = "10000+"
                areaMaximum1 = "10000"
                UserDefaults.standard.set(areaMaximum1, forKey: "areaMaximum1")
                
                
            }
            
        }
        
    }
    
    
    @IBAction func tap_buy_btn(_ sender: Any)
    {
        searchIdName.removeAll()
        searchCityName.removeAll()
        selectCityViewHeightConstraint.isActive = true
        selectCityViewHeightConstraint.constant = 0
        cityCollectionView.reloadData()

        buyPressed = true
        rentselected = false

        chkvalue = "2"
        buySelected = true
        if buySelected == true{
            selectedCityArray.removeAll()
            buyCityArr.removeAll()
            selectedCityArray = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
            buyCityArr = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
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
            selectedCityArray = UserDefaults.standard.value(forKey: "rentcom") as? [String] ?? []
            rentCityArr = UserDefaults.standard.value(forKey: "rentcom") as? [String] ?? []
            if selectedCityArray.isEmpty {
                collection_height.constant = 0
                city_collectionView.isHidden = true
                
            }else{
                collection_height.constant = 80
                city_collectionView.isHidden = false
                
            }
            
        }
        areaMaximumPrice_label.isHidden = false
        areaMinimumPrice_label.isHidden = false
        areamaximumthousand_lbl.isHidden = true
        areaminimum_thousandlbl.isHidden = true
        search_tebleView.reloadData()
        city_collectionView.reloadData()
        selectedRoomType_label.isHidden = false
        selectedRoomType_label1.isHidden = true
        selectedPropertyType_label.isHidden = false
        selectedPropertyType_label1.isHidden = true
        floor_label.isHidden = false
        floor_label1.isHidden = true
        sqt_label.isHidden = false
        sqt_label1.isHidden = true
        furnished_label.isHidden = false
        furnished_label1.isHidden = true
        imageSelection_label.isHidden = false
        imageSelection_label1.isHidden = true
  
        floor_label.text =  UserDefaults.standard.value(forKey: "floordata") as? String
        floor_label1.text =  UserDefaults.standard.value(forKey: "floordata1") as? String
        selectedPropertyType_label.text = UserDefaults.standard.value(forKey: "propertyvalue") as? String
        selectedPropertyType_label1.text = UserDefaults.standard.value(forKey: "propertyvalue1") as? String
        selectedRoomType_label.text = UserDefaults.standard.value(forKey: "roomvalue") as? String
        selectedRoomType_label1.text = UserDefaults.standard.value(forKey: "roomvalue1") as? String
        furnished_label1.text = UserDefaults.standard.value(forKey: "furnished1") as? String
        furnished_label.text = UserDefaults.standard.value(forKey: "furnished") as? String
        print(selectedRoomType_label.text as Any)
        sqt_label.text = UserDefaults.standard.value(forKey: "sqdata") as? String
        sqt_label1.text = UserDefaults.standard.value(forKey: "sqdata1") as? String
        imageSelection_label.text = UserDefaults.standard.value(forKey: "image") as? String
        propertytype_btn.isHidden = true
        propertytype_btn1.isHidden = false
        floor_btn.isHidden = true
        floorbtn1.isHidden = false
        
        
        setBuyRent(buy:UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1), rent: UIColor.black , buyLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1) , rentLine : UIColor.clear)
        budget_slider.isHidden = false
        sliderLakh.isHidden = true
        slider_thousand.isHidden = true
        
        lblRentMinimum.isHidden = true
        areaminimum_thousandlbl.isHidden = true
        budgetMinimuPrice_label.isHidden = false
        budgetMaximumPrice_label.isHidden = false
        lblLakh.isHidden = true
        //        lowerValue = "0"
        //        higherValue = "1000000000"
        // self.budgetMaximumPrice_label.text = "100 Crore +"
        switch searchBy
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
        selectCityViewHeightConstraint.isActive = true
        selectCityViewHeightConstraint.constant = 0
        cityCollectionView.reloadData()
        
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
            selectedCityArray = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
            buyCityArr = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
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
            selectedCityArray = UserDefaults.standard.value(forKey: "rentcom") as? [String] ?? []
            rentCityArr = UserDefaults.standard.value(forKey: "rentcom") as? [String] ?? []
            if selectedCityArray.isEmpty {
                collection_height.constant = 0
                city_collectionView.isHidden = true
                
            }else{
                collection_height.constant = 80
                city_collectionView.isHidden = false
                
            }
            
        }
        areaMaximumPrice_label.isHidden = true
        areaMinimumPrice_label.isHidden = true
        areamaximumthousand_lbl.isHidden = false
        areaminimum_thousandlbl.isHidden = false
        search_tebleView.reloadData()
        city_collectionView.reloadData()
        selectedRoomType_label.isHidden = true
        selectedRoomType_label1.isHidden = false
        selectedPropertyType_label.isHidden = true
        selectedPropertyType_label1.isHidden = false
        sqt_label.isHidden = true
        sqt_label1.isHidden = false
        floor_label.isHidden = true
        floor_label1.isHidden = false
        furnished_label.isHidden = true
        furnished_label1.isHidden = false
        imageSelection_label.isHidden = true
        imageSelection_label1.isHidden = false
        floor_label.isHidden = true
        floor_label1.isHidden = false
        
        floor_label.text =  UserDefaults.standard.value(forKey: "floordata") as? String
        floor_label1.text = UserDefaults.standard.value(forKey: "floordata1") as? String
        selectedPropertyType_label.text = UserDefaults.standard.value(forKey: "propertyvalue") as? String
        selectedPropertyType_label1.text = UserDefaults.standard.value(forKey: "propertyvalue1") as? String
        selectedRoomType_label.text = UserDefaults.standard.value(forKey: "roomvalue") as? String
        selectedRoomType_label1.text = UserDefaults.standard.value(forKey: "roomvalue1") as? String
        sqt_label.text = UserDefaults.standard.value(forKey: "sqdata") as? String
        sqt_label1.text = UserDefaults.standard.value(forKey: "sqdata1") as? String
        furnished_label1.text = UserDefaults.standard.value(forKey: "furnished1") as? String
        furnished_label.text = UserDefaults.standard.value(forKey: "furnished") as? String
        imageSelection_label.text = UserDefaults.standard.value(forKey: "image") as? String
        imageSelection_label1.text = UserDefaults.standard.value(forKey: "image1") as? String
        
        
        print(selectedRoomType_label1.text as Any)
        //        objcell.data_label.isHidden = true
        //        objcell.data_label1.isHidden = false
        //        objcell.data_label.text =  UserDefaults.standard.value(forKey: "cityName") as? String
        //        objcell.data_label1.text =  UserDefaults.standard.value(forKey: "cityName1") as? String
        propertytype_btn.isHidden = false
        propertytype_btn1.isHidden = true
        floor_btn.isHidden = false
        floorbtn1.isHidden = true
        
        budget_slider.isHidden = true
        sliderLakh.isHidden = false
        slider_thousand.isHidden = false
        lblRentMinimum.isHidden = false
        areaminimum_thousandlbl.isHidden = false
        budgetMinimuPrice_label.isHidden = true
        budgetMaximumPrice_label.isHidden = true
        lblLakh.isHidden = false
        areamaximumthousand_lbl.isHidden = false
        
        lowerValue = "0"
        higherValue = "2000000"
        
        setBuyRent(buy: UIColor.black, rent:UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1),buyLine : UIColor.clear , rentLine : UIColor(red: 46/255, green: 108/255, blue: 100/255, alpha: 1))
        
        
        // budgetMaximumPrice_label.text = "20 Lacs +"
        switch searchBy
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
        
        switch searchBy {
            
        case .commercial:
            vc.selctionType = .commercialProp
        case .residential:
            vc.comesFromBuy = buyPressed
            vc.arry = Array(arrayLiteral:selectedPropertyType_label1.text ?? "")
            
            
            vc.selctionType = .propertyType
        }
        
        self.navigationController?.pushViewController(vc, animated: true)

        
       // self.present(vc, animated: false, completion: nil)
        
    }
    
    @IBAction func tap_propertyType_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        
        vc.delegate = self
        
        switch searchBy {
            
        case .commercial:
            vc.selctionType = .commercialProp
            
        case .residential:
            vc.comesFromBuy = buyPressed
            vc.arry = Array(arrayLiteral:selectedPropertyType_label.text ?? "")
            
            vc.selctionType = .propertyType
        }
        self.navigationController?.pushViewController(vc, animated: true)

       // self.present(vc, animated: false, completion: nil)
        
    }
    
    @IBAction func tap_roomtype_btn1(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        
        vc.delegate = self
        vc.comesFromBuy = buyPressed
        vc.arry = Array(arrayLiteral: selectedRoomType_label1.text ?? "")
        vc.selctionType = .bedRoom
        self.navigationController?.pushViewController(vc, animated: true)

       // self.present(vc, animated: false, completion: nil)
    }
    @IBAction func tap_roomType_btn(_ sender: Any) {
        

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        
        vc.delegate = self
        vc.comesFromBuy = buyPressed
        vc.arry = Array(arrayLiteral: selectedRoomType_label.text ?? "")
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
    
    
    func selectItem(value: String, index : Int) {
        
        switch index {
            
        case 0:
            //            if chkvalue == "1"
            //            {
            //                let replaced = value.replacingOccurrences(of:" ", with:"")
            //                selectedPropertyType_label.text = replaced
            //                UserDefaults.standard.set(selectedPropertyType_label.text, forKey: "propertyvalue")
            //
            //            }
            //            else if chkvalue == "2"
            //            {
            //                let replaced = value.replacingOccurrences(of:" ", with:"")
            //                selectedPropertyType_label1.text = replaced
            //                print(selectedPropertyType_label1.text as Any)
            //              //  UserDefaults.standard.set(selectedPropertyType_label1.text, forKey: "propertyvalue1")
            //
            //            }
            if chkvalue == "2"
            {
                
                var replacedvalue = value.replacingOccurrences(of:", ",with:",")
                if replacedvalue == "U" || replacedvalue == "All"{
                    replacedvalue = "All,Apartment,Service Apartment,Builder floor,Plot/Land,House/Villa,Farmhouse"
                    
                    
                    selectedPropertyType_label.text = replacedvalue
                    UserDefaults.standard.set(selectedPropertyType_label.text, forKey: "propertyvalue")
                }else if replacedvalue == ""{
                    
                    selectedPropertyType_label.text = replacedvalue
                    replacedvalue = ""
                    
                    UserDefaults.standard.set(selectedPropertyType_label.text, forKey: "propertyvalue")
                    selectedPropertyType_label.text = replacedvalue
                    
                    
                }
                else
                {
                    
                    selectedPropertyType_label.text = replacedvalue
                    
                    UserDefaults.standard.set(selectedPropertyType_label.text, forKey: "propertyvalue")
                }
            }
            
            
            else  if chkvalue == "3"
            {
                
                var replacedvalue = value.replacingOccurrences(of:", ",with:",")
                if replacedvalue == "U" || replacedvalue == "All"{
                    replacedvalue = "All,Apartment,Service Apartment,Builder floor,Plot/Land,House/Villa,Farmhouse"
                    
                    selectedPropertyType_label1.text = replacedvalue
                    UserDefaults.standard.set(selectedPropertyType_label.text, forKey: "propertyvalue1")
                }
                
                else if replacedvalue == ""{
                    selectedPropertyType_label1.text = replacedvalue
                    
                    replacedvalue = ""
                    
                    UserDefaults.standard.set(selectedPropertyType_label1.text, forKey: "propertyvalue1")
                    selectedPropertyType_label1.text = replacedvalue
                    
                }
                else
                {
                    selectedPropertyType_label1.text = replacedvalue
                    UserDefaults.standard.set(selectedPropertyType_label1.text, forKey: "propertyvalue1")
                }
            }
            
            
            
            
        case 1:
            //            let trimmedString = value.replacingOccurrences(of: " ", with: "")
            
            // let result = trimmedString.replacingOccurrences(of: "", with: "Bhk")
            if chkvalue == "2"
            {
                let replaced = value.replacingOccurrences(of:" ",with:"")
                var replacedvalue = replaced.replacingOccurrences(of:"Bhk",with:" Bhk")
                if replacedvalue == "U" || replacedvalue == "All"{
                    replacedvalue = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk,Plot"
                    
                    selectedRoomType_label.text = replacedvalue
                    UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue")
                    print(UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue"))
                }else if replacedvalue == ""{
                    selectedRoomType_label.text = replacedvalue
                    
                    replacedvalue = ""
                    UserDefaults.standard.set(selectedRoomType_label.text, forKey: "roomvalue")
                    
                    selectedRoomType_label.text = replacedvalue
                    
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
                    selectedRooms = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk,Plot"
                    
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
                var replacedvalue = replaced.replacingOccurrences(of:"Bhk",with:" Bhk")
                if replacedvalue == "U" || replacedvalue == "All"{
                    replacedvalue = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk,Plot"
                    UserDefaults.standard.set(selectedRoomType_label1.text, forKey: "roomvalue1")
                    selectedRoomType_label1.text = selectedRooms
                    
                }else if replacedvalue == ""{
                    selectedRoomType_label1.text = replacedvalue
                    
                    replacedvalue = ""
                    UserDefaults.standard.set(selectedRoomType_label1.text, forKey: "roomvalue1")
                    selectedRoomType_label1.text = replacedvalue
                    
                    
                }
                else
                {
                    selectedRoomType_label1.text = replacedvalue
                    UserDefaults.standard.set(selectedRoomType_label1.text, forKey: "roomvalue1")
                }
                print(self.selectedRoomType_label1.text as Any)
            }
            
            
        case 2:
            
            print("")
            
        case 3:
            floor_label.text = value
            //let replaced = value.replacingOccurrences(of: " ", with: "")
            if chkvalue == "2"
            {
                
                var replaced = value.replacingOccurrences(of:", ",with:",")
                if replaced == "U" || replaced == "All"
                {
                    //            if floor_label.text!.contains("All")
                    //            {
                    replaced = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,Duplex,Bungalow,BMT+GF"
                    floor_label.text = replaced
                    UserDefaults.standard.set(floor_label.text, forKey: "floordata")
                }
                else if replaced == ""
                {
                    floor_label.text = replaced
                    
                    replaced = ""
                    UserDefaults.standard.set(floor_label.text, forKey: "floordata")
                    floor_label.text = replaced
                    
                    
                    
                    
                    
                }
                else{
                    //floorji = replaced
                    floor_label.text = replaced
                    UserDefaults.standard.set(floor_label.text, forKey: "floordata")
                    //            floor_label.text! = replaced.trimSpace()
                    //            floorji = replaced
                }
                print(self.floor_label.text!)
                
            }
            
            else if chkvalue == "3"
            {
                
                var replaced = value.replacingOccurrences(of:", ",with:",")
                if replaced == "U" || replaced == "All"
                {
                    //            if floor_label.text!.contains("All")
                    //            {
                    replaced = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,Duplex,Bungalow,BMT+GF"
                    floor_label1.text = replaced
                    UserDefaults.standard.set(floor_label1.text, forKey: "floordata1")
                    
                }
                else if replaced == ""
                {
                    floor_label1.text = replaced
                    
                    replaced = ""
                    UserDefaults.standard.set(floor_label1.text, forKey: "floordata1")
                    floor_label1.text = replaced
                    
                }
                else{
                    //floorji = replaced
                    floor_label1.text  = replaced
                    UserDefaults.standard.set(floor_label1.text, forKey: "floordata1")
                    //                    floor_label1.text! = floorji.trimSpace()
                    //                    floorji = replaced
                }
                print(self.floor_label1.text!)
                
            }
        case 4:
            let replaced = value.replacingOccurrences(of:" ",with:"")
            let replacedvalue = replaced.replacingOccurrences(of:"Bhk",with:" Bhk")
            if replacedvalue == "U" || replacedvalue == "All"{
                comProperty = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                selectedPropertyType_label.text! = comProperty.trimSpace()
            }
            else if replacedvalue == ""{
                comProperty = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                selectedPropertyType_label.text! = comProperty.trimSpace()
            }else{
                selectedPropertyType_label.text! = replacedvalue.trimSpace()
                selectedRooms = replacedvalue
            }
            
            print(self.selectedPropertyType_label.text!)
        default:
            
            print("")
            
        }
        
    }
    
    func getSearchField_API() {
        
        let x = searchIdName.joined(separator: ",")
   
        let param : [String:Any] = [ "keyword" :self.search_textfield.text!,"city_id":x ]
        
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
        
        switch searchBy
        {
        case .commercial:
            var propertyCom = (selectedPropertyType_label.text ?? "")
            if propertyCom ==  "Your Property type" || propertyCom ==  "All"{
                propertyCom = ""
            }
            
            
            
            if propertyCom == ""
            {
                propertyCom = commercialProperty.joined(separator: ",").trimSpace()
            }
            else
            {
                propertyCom = selectedPropertyType_label.text!.trimSpace()
            }
            
            var room_in_bhk = (self.selectedRoomType_label.text ?? "")
            if room_in_bhk ==  "Select Bedroom" || propertyCom ==  "All"{
                room_in_bhk = ""
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
                
            }
            else
            {
                imagesearch = self.imageSelection_label.text!
            }
            
            print(floor)
    
            
            let string = selectedCityArray
            let string1 = string.joined(separator: ",")
            
            
            let city = string1.trimSpace()
            
            
            
            let trimmedString = city.trimmingCharacters(in:.whitespaces)
            param = ["key":"5642vcb546gfnbvb7r6ewc211365v13122",
                     "userid": Singleton.sharedInstance.loginModel?.first?.data?.id ?? "",
                     "city":trimmedString,
                     "p1":lowerValue,
                     "p2":higherValue,
                     "property_type": [UserDefaults.standard.value(forKey: "propertyvalue")],
                     "room_in_bhk":[UserDefaults.standard.value(forKey: "roomvalue")],
                     "house_unit":[UserDefaults.standard.value(forKey: "sqdata")],
                     "a1":areaMinimum,
                     "a2":areaMaximum,
                     "room_type":[UserDefaults.standard.value(forKey: "furnished")],
                     "image_search":[UserDefaults.standard.value(forKey: "image")],
                     "floor":[UserDefaults.standard.value(forKey: "floordata")],
                     "search":"",
                     "page":"null"]
            

            print(param)
            
            
            
        case .residential:
            var property = (selectedPropertyType_label.text ?? "")
            var room_in_bhk = (selectedRoomType_label.text ?? "")
            var furnished = (furnished_label.text ?? "")
            var floor = (floor_label.text ?? "")
    
            
            
            if chkvalue == "2"
            {
                if property ==  "Your Property type" || property ==  "All" ||  property == ""
                {
                    
                    property = "All,Apartment,Service Apartment,Builder floor,Plot/Land,House/Villa,Farmhouse"
                }
                if room_in_bhk ==  "Select Bedroom" || room_in_bhk ==  "All"  || room_in_bhk == ""{
                    room_in_bhk = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk,Plot"
                }
                if furnished == "All" || furnished ==  ""{
                    furnished = "All,Furnished,Semifurnished"
                }
                
                if floor == "Floor Preference" || floor == "All" || floor == ""
                {
                    floor = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,Duplex,Bungalow,BMT+GF"
                }
                if imagesearch == "" || imagesearch == "All"
                {
                    imagesearch = "All"
                    
                    imageSelection_label.text = imagesearch
                    
                    
                    
                    //let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                    
                    
                }
                if areaMaximum == "" || areaMaximum1 == ""
                {
                    areaMaximum = "10000"
                    areaMinimum1 = "10000"
                    
                }
                else
                {
                    areaMaximum = UserDefaults.standard.value(forKey: "areaMaximum") as? String ?? ""
                    areaMaximum1 = UserDefaults.standard.value(forKey: "areaMaximum1") as? String ?? ""
                    
                }
                if areaMinimum == "" || areaMinimum1 == ""
                {
                    areaMinimum = "0"
                    areaMinimum1 = "0"
                }
                else
                
                {
                    areaMinimum = UserDefaults.standard.value(forKey: "areaMinimum") as? String ?? ""
                    areaMinimum1 = UserDefaults.standard.value(forKey: "areaMinimum1") as? String ?? ""
                }
                if lowerValue == "" || lowerValue == ""
                {
                    lowerValue = "0"
                    lowerValue1 = "0"
                    
                }
                else
                {
                    lowerValue = UserDefaults.standard.value(forKey: "lowerValue") as? String ?? ""
                    lowerValue1 = UserDefaults.standard.value(forKey: "lowerValue1") as? String ?? ""
                    
                }
                if higherValue == "" || higherValue1 == ""
                {
                    higherValue = "1000000000"
                    higherValue1 = "2000000"
                    
                }
                else
                
                {
                    higherValue = UserDefaults.standard.value(forKey: "higherValue") as? String ?? ""
                    higherValue1 = UserDefaults.standard.value(forKey: "higherValue1") as? String ?? ""
                }
            }
            
            
            else  if chkvalue == "3"
            {
                property = (selectedPropertyType_label1.text ?? "")
                
                if property ==  "Your Property type" || property ==  "All" || property ==  ""{
                    property = "All,Apartment,Service Apartment,Builder floor,Plot/Land,House/Villa,Farmhouse"
                    
                    
                }
                room_in_bhk = (selectedRoomType_label1.text ?? "")
                if room_in_bhk ==  "Select Bedroom" || room_in_bhk ==  "All" || room_in_bhk == ""
                {
                    room_in_bhk = "All,1 Room/Studio Apartment,1 Bhk,2 Bhk,3 Bhk,4 Bhk,5 Bhk,5+ Bhk,Plot"
                }
                furnished = (furnished_label1.text ?? "")
                
                if furnished == "All"{
                    furnished = "All,Furnished,Semifurnished"
                }
                
                floor = (floor_label1.text ?? "")
                
                if floor == "Floor Preference" || floor == "All" || floor == ""
                    
                {
                    floor = "All,Basement,Ground,Lower Ground,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20+,Duplex,Bungalow,BMT+GF"
                }
            }
            
            
            if imagesearch == "" || imagesearch == "All"
            {
                imagesearch = "All"//,With Images"
                
                
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
                areaMaximum = UserDefaults.standard.value(forKey: "areaMaximum") as? String ?? ""
                areaMaximum1 = UserDefaults.standard.value(forKey: "areaMaximum1") as? String ?? ""
                
            }
            if areaMinimum == "" || areaMinimum1 == ""
            {
                areaMinimum = "0"
                areaMinimum1 = "0"
                
            }
            else
            
            {
                areaMinimum = UserDefaults.standard.value(forKey: "areaMinimum") as? String ?? ""
                areaMinimum1 = UserDefaults.standard.value(forKey: "areaMinimum1") as? String ?? ""
            }
            if lowerValue == "" || lowerValue1 == ""
            {
                lowerValue = "0"
                lowerValue1 = "0"
                
            }
            else
            {
                lowerValue = UserDefaults.standard.value(forKey: "lowerValue") as? String ?? ""
                lowerValue1 = UserDefaults.standard.value(forKey: "lowerValue1") as? String ?? ""
                
            }
            if higherValue == "" || higherValue1 == ""
            {
                higherValue = "1000000000"
                higherValue1 = "2000000"
                
            }
            else
            
            {
                higherValue = UserDefaults.standard.value(forKey: "higherValue") as? String ?? ""
                higherValue1 = UserDefaults.standard.value(forKey: "higherValue1") as? String ?? ""
            }
            
            
            let string = buyCityArr
            let string1 = string.joined(separator: ",")
            
            
            let city = string1
            let trimmedString = city.trimmingCharacters(in:.whitespaces)
            
            
            
            if chkvalue == "2"
            {
                if city == ""
                {
                    let alert = UIAlertController(title: "", message: "Please Enter city", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true)
                }
                param = ["key":"5642vcb546gfnbvb7r6ewc211365v13122",
                         "userid": Singleton.sharedInstance.loginModel?.first?.data?.id ?? "",
                         "city":trimmedString,
                         "p1":lowerValue,
                         "p2":higherValue,
                         "property_type":property,
                         //                "property_type": UserDefaults.standard.value(forKey: "propertyvalue") ?? "",
                         "room_in_bhk":room_in_bhk,
                         "house_unit":UserDefaults.standard.value(forKey: "sqdata") ?? "",
                         "a1":areaMinimum,
                         "a2":areaMaximum,
                         "room_type":furnished,
                         "image_search":imageSelection_label.text!,//imagesearch,
                         "floor":floor,
                         "search":"",
                         "page":"null"]
                //MARK: buy case
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
                         "p1":lowerValue1,
                         "p2":higherValue1,
                         "property_type":property,
                         "room_in_bhk":room_in_bhk,
                         "house_unit":UserDefaults.standard.value(forKey: "sqdata1") ?? "",
                         "a1":areaMinimum1,
                         "a2":areaMaximum1,
                         "room_type":furnished,
                         "image_search": imageSelection_label1.text!, //imageSelection_Array,
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
                        print(vc.param)
                        
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
//MARK: open city list
    @IBAction func cityPopUpActionBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CityListViewController") as! CityListViewController
        vc.modalPresentationStyle = .overFullScreen
          vc.modalTransitionStyle = .crossDissolve
        vc.passcityName = self
        self.present(vc, animated: true)
  
    }
    
    
}
extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cityModel?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = search_tebleView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        if self.cityModel?.data?.count ?? 0 > 0  {
            let trimmedString = self.cityModel?.data?[indexPath.row].cityName ?? "".trimmingCharacters(in:.whitespaces)
            cell.data_label.text = trimmedString
        }
        
        if buySelected == true
        {
            selectedCityArray.removeAll()
            
            selectedCityArray = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
        }
        else
        {
            selectedCityArray.removeAll()
            
            selectedCityArray = UserDefaults.standard.value(forKey: "rentcom") as? [String] ?? []
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
                //  UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
                
                selectedCityArray = buyCityArr
                UserDefaults.standard.set(selectedCityArray, forKey: "buycom")
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
                UserDefaults.standard.set(selectedCityArray, forKey: "rentcom")
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
    
    func trimAllSpace() -> String {
        return components(separatedBy: .whitespacesAndNewlines).joined()
    }
    
    func trimSpace() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if  collectionView == cityCollectionView{
            return searchCityName.count
        }
        else{
        return selectedCityArray.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  collectionView == cityCollectionView{
            let cityCell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: "SeachCityCollectionViewCell", for: indexPath) as! SeachCityCollectionViewCell
            cityCell.labelName.text = searchCityName[indexPath.row]
            cityCell.delete_btn.addTarget(self, action: #selector(tap_deletBtn), for: .touchUpInside)
            cityCell.delete_btn.tag = indexPath.row
            return cityCell
        }
        else {
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
            selectCityViewHeightConstraint.isActive = true
            selectCityViewHeightConstraint.constant = 100
        }
        else{
            selectCityViewHeightConstraint.isActive = true
            selectCityViewHeightConstraint.constant = 0
        }

        self.cityCollectionView.reloadData()
    }
    
    
    @objc func tap_cross_btn(sender : UIButton) {
        
        if buySelected == true{
            selectedCityArray.remove(at: sender.tag)
            if buyCityArr.count > 0{
                buyCityArr.remove(at: sender.tag)
            }
            
            UserDefaults.standard.set(selectedCityArray, forKey: "buycom")
            selectedCityArray = UserDefaults.standard.value(forKey: "buycom") as? [String] ?? []
            
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
            
            UserDefaults.standard.set(selectedCityArray, forKey: "rentcom")
            selectedCityArray = UserDefaults.standard.value(forKey: "rentcom") as? [String] ?? []
            
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

extension SearchViewController:PasscityName{
    func passcityAddress(cityName: [String], cityId: [String]) {
        
        searchCityName.removeAll()
        searchIdName.removeAll()
        
        let uniqcityName = Array(Set(cityName))
        let uniqcityId = Array(Set(cityId))

        searchCityName.append(contentsOf: uniqcityName)
        searchIdName.append(contentsOf: uniqcityId)

        if cityName.count != 0 {
            selectCityViewHeightConstraint.isActive = true
            selectCityViewHeightConstraint.constant = 100
        }
        else{
            selectCityViewHeightConstraint.isActive = true
            selectCityViewHeightConstraint.constant = 0
        }

        self.cityCollectionView.reloadData()
    }
    
    
}

extension SearchViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
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
            
            selectedPropertyType_label.text! = apartment_Array[row]
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
                    
                    sqt_label.text = owner_array[row]
                    
                    
                }
                sqt_label.text = owner_array[row]
                
                UserDefaults.standard.set(sqt_label.text, forKey: "sqdata")
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
                    
                    sqt_label.text = owner_array[row]
                    
                    
                }
                sqt_label.text = owner_array[row]
                
                UserDefaults.standard.set(sqt_label.text, forKey: "sqdata")
            }
            else  if chkvalue == "3"
            {
                if owner_array[row].contains("Sq.yards")
                {
                    
                    sqfeet =  "Sq.yards"
                    let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                    
                    sqt_label1.text = trimmedString
                    
                    UserDefaults.standard.set(sqt_label1.text, forKey: "sqdata1")
                    
                    
                    
                }
                else
                {
                    sqfeet = owner_array[row]
                    
                    
                    sqt_label1.text = owner_array[row]
                    
                    
                }
                sqt_label1.text = owner_array[row]
                
                UserDefaults.standard.set(sqt_label1.text, forKey: "sqdata1")
            }
            
            
            
            break
            
        case .floor:
            //        floor_label.text! = floor_Array[row]
            floor_label.text! = floor_Array[row]
            
            
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

                    print(furnished_label.text as Any)
                    
                }
                furnished_label.text = furnished_Array[row]
                UserDefaults.standard.set(furnished_label.text, forKey: "furnished")
                
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
                    
                }
                furnished_label.text = furnished_Array[row]
                UserDefaults.standard.set(furnished_label.text, forKey: "furnished")
                
            }
            else  if chkvalue == "3"
            {
                let string1 = string.joined(separator: " ,")
                
                print(furnished_Array[row].contains("All"))
                
                if furnished_Array[row].contains("All")
                {
                    room = "All"
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
                UserDefaults.standard.set(furnished_label1.text, forKey: "furnished1")
                
            }
            break
            
            
            
        case .image:
            //let res = imageSelection_Array.reduce("") { $0 + $1 }
            //   let res = imageSelection_Array.reduce("") { $0 + $1 }
            let string = imageSelection_Array
            let string1 = string.joined(separator: " ,")
            
         //   print(imageSelection_Array[row].contains("All"))
            if chkvalue == "2"
            {
                
                
                if imageSelection_Array[row].contains("All")
                {
                    imagesearch = "All"//,With Images"

                    imagesearch = imageSelection_Array[row]
                    
                    imageSelection_label.text = imageSelection_Array[row]
                    
                }
                else
                {
                    imagesearch = imageSelection_Array[row]
                    
                    imageSelection_label.text = imageSelection_Array[row]
                    print(imageSelection_label.text as Any)
                    
                }
                UserDefaults.standard.set(imageSelection_label.text, forKey: "image")
                
            }
            else if chkvalue == "3"
            {
                if imageSelection_Array[row].contains("All")
                {
                    imagesearch = "All"//,With Images"
                    imagesearch = imageSelection_Array[row]
                    
                    imageSelection_label1.text = imageSelection_Array[row]
                    print(imageSelection_label1.text as Any)
                    
                }
                else
                {
                    imagesearch = imageSelection_Array[row]
                    
                    imageSelection_label1.text = imageSelection_Array[row]
                    print(imageSelection_label1.text as Any)
                    
                }
                UserDefaults.standard.set(imageSelection_label1.text, forKey: "image1")
                
            }
            
            
        case .commercialProp:
            let string = commercialProperty
            let string1 = string.joined(separator: ",")
            
            print(commercialProperty[row].contains("All"))
            if commercialProperty[row].contains("All")
            {
                comProperty = "All,Office Space,Co-working Office,Commercial Lands/Plots,Hotel/Resorts,Guest-House/Banquet-Halls,Shop/Showroom,Industrial land,Agriculture/Farmland,Factory,Warehouse"
                
                let trimmedString = string1.replacingOccurrences(of: " ", with: "")
                
                //let trimmedString = string1.trimmingCharacters(in:.whitespaces)
                
                selectedPropertyType_label.text = trimmedString
                
                print(selectedPropertyType_label.text ?? "")
            }
            else
            {
                comProperty = commercialProperty[row]
                
                selectedPropertyType_label.text = commercialProperty[row]
                print(selectedPropertyType_label.text as Any)
                
            }
            
            break
            
            
        case .commercialPropfloor:
            floor_label.text = floor_Array1[row]
            
        }
        
        
    }
}

//MARK: show city List
