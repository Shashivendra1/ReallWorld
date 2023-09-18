//
//  HomeScreenViewController.swift
//  RealWorld
//
//  Created by SAT PAL on 03/06/20.
//  Copyright © 2020 ArthTech Solutions. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation

var comesFromCommented = false
var home = false
enum ComeFrom {
    case home
    case weekly
    case monthly
    case user
    case search
    case homeSearch
    case filter
    case favourite
    case searchData
    case commentedScreen
}

class HomeScreenViewController: BaseViewController,CLLocationManagerDelegate {
 
    var long = 0.0
    var lati = 0.0
    var longitude = ""
    var latitude = ""
    var chkphone = ""
    var phonenumberWhatsApp = ""
    var propertyId1 = ""
    var checked = false
    var is_check = false
    var like:Bool = false
    var rentstatus:Bool = false
    var phonearr : [String] = []
    var refreshControl = UIRefreshControl()
    var senderTag = 0
    var bannerImageData = [String]()
    //  var pageNo = 0
    //  @IBOutlet weak var viewTotal: UIStackView!
    @IBOutlet weak var soldout_lbl: UILabel!
    @IBOutlet weak var selectMonth: UIButton!
    @IBOutlet weak var sale_viewlbl: UILabel!
    @IBOutlet weak var phonetable_view: UITableView!
    @IBOutlet weak var list_tableView: UITableView!
    @IBOutlet weak var lblTotalProperties: UILabel!
    
    @IBOutlet weak var sale_view: UIView!
    @IBOutlet weak var slider_imageView: UICollectionView!
    
    @IBOutlet weak var tableHeaderView: UIView!
    
    @IBOutlet weak var phone_view: UIView!
    @IBOutlet weak var requestCallBack_view: UIView!
    @IBOutlet weak var post_btn: UIButton!
    
    @IBOutlet weak var sort_view: UIView!
    
    @IBOutlet weak var bottom_view: UIView!
    //@IBOutlet weak var lblNoDataFound: UILabel!
    
    
    var itemView = NavigationSearch()
    
    var documentInteractionController:UIDocumentInteractionController!
    
    var callModel: [CallBackModel1]?
    var bannerModel : BannerImageModel?
    //    var homeScreendata : HomeScreenModel1?
    
    
    @IBOutlet weak var selectnumberlbl: UILabel!
    var homeScreenModel : HomeScreenModel?
    
    var comeFrom = ComeFrom.home
    
    var page =  1
    
    var timer : Timer?
    
    var saveHeader = UIView()
    
    var param : [String:Any] = [:]
    
    var sort = "A to Z"
    var postId = Int()
    var searchLink = ""
    var dictonary:NSDictionary?
    
    var homeCell : HomeScreenTableViewCell?
    
    @IBOutlet weak var sideMenuSearchFull_view: UIView!
    
    
    @IBOutlet weak var sideMenuSearchSort_view: UIStackView!
    
    @IBOutlet weak var sideMenuSearchFilter_view: UIStackView!
    
    var locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    var currentLocation: CLLocation?
    @IBOutlet weak var searchResult_view: SetView!
    
    @IBOutlet weak var searchResult_label: UILabel!
    var chkvalue = true
    var isDataLoading:Bool=false
    
    var offset:Int=0 //pageNo*limit
    var didEndReached:Bool=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SDImageCache.shared.clearMemory()
        SDImageCache.shared.clearDisk()
        phone_view.isHidden = true
        //  picker_view.isHidden = true
        phonetable_view.isHidden = true
        selectnumberlbl.isHidden = true
        phone_view.layer.cornerRadius = 6
        sale_view.layer.cornerRadius = 6
        sale_view.isHidden = true
        lblTotalProperties.isHidden = false
        sort_view.isHidden = true
        searchResult_view.isHidden = false
        sideMenuSearchFull_view.isHidden = true
        // chkvalue = true
        list_tableView.delegate = self
        list_tableView.dataSource = self
        phonetable_view.delegate = self
        phonetable_view.dataSource = self
        
      
        slider_imageView.delegate = self
        slider_imageView.dataSource = self
        setTableHeader()
        let currentLocation : CLLocation!
//        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways {
//
//            currentLocation = locationManager.location
//
//            self.lati = currentLocation.coordinate.latitude
//            self.long = currentLocation.coordinate.longitude
//        }
        self.view.endEditing(true)
        viewWillApperDataCallInDidLoad()
        //  pull to refresh
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        list_tableView.addSubview(refreshControl)
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .Search, center_type: .None, titleColor: .white)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backgroundColor = .purple
        
        if comeFrom == .searchData{
            bottom_view.isHidden = true
            sort_view.isHidden = true
            
            title = "Search"
            
            list_tableView.tableHeaderView = nil
            self.addNavigationBar1(leftBar: .CustomBack, titleType: .Normal, title: "Search", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            //bottom_view.isHidden = false
            //  sort_view.isHidden = false
            // getProperty_API()
        }
        else if comesFromCommented == true{
            self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "Home", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .Search, center_type: .None, titleColor: .white)
            getProperty_API()
        }
        else if comeFrom == .homeSearch{
            bottom_view.isHidden = true
            sort_view.isHidden = true
            title = "Search"
            
            list_tableView.tableHeaderView = nil
            self.addNavigationBar1(leftBar: .CustomBack, titleType: .Normal, title: "Search", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            //bottom_view.isHidden = false
            //  sort_view.isHidden = false
            // getProperty_API()
        }
        else if self.comeFrom == .user {
            
            bottom_view.isHidden = true
            self.searchResult_view.isHidden = true
            
            
            self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "User Property", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .Search, center_type: .None, titleColor: .white)
            
            //  list_tableView.reloadData()
            
        }
        else if self.comeFrom == .favourite {
            
            bottom_view.isHidden = true
            self.searchResult_view.isHidden = true
            
            self.post_btn.isHidden = true
            //self.slider_imageView.isHidden = true
            
            list_tableView.tableHeaderView = nil
            self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "Favourite Properties", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            
            //  list_tableView.reloadData()
            
        }
        else{
            list_tableView.tableHeaderView = tableHeaderView
            bottom_view.isHidden = true
            
            //  list_tableView.reloadData()
            
            self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "Home", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .Search, center_type: .None, titleColor: .white)
        }
        
    }
    @objc func refresh(_ sender: AnyObject) {
        
        page = page + 1
        
        self.getProperty_API(true)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.comeFrom == .searchData {
            if scrollView.contentOffset.y > 0 {
                let currentPoint = CGPoint(x: self.view.frame.width - 100, y: 100.0 + scrollView.contentOffset.y)
                let index = list_tableView.indexPathForRow(at: currentPoint)?.row ?? 0
                let data = "Search: \(self.homeScreenModel?.first?.total_count ?? 0)/  Current Position: \(index+1)"
                self.searchResult_label.text = data
            }
        }
        if self.comeFrom == .homeSearch {
            if scrollView.contentOffset.y > 0 {
                let currentPoint = CGPoint(x: self.view.frame.width - 100, y: 100.0 + scrollView.contentOffset.y)
                let index = list_tableView.indexPathForRow(at: currentPoint)?.row ?? 0
                let data = "Search: \(self.homeScreenModel?.first?.data?.count ?? 0)/ Current Position: \(index+1)"
                
                self.searchResult_label.text = data
            }
        }
        
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        print("scrollViewDidEndDragging")
        //    page = page + 1
        //
        //    self.getProperty_API(true)
        if self.comeFrom == .searchData
        {
            if ((list_tableView.contentOffset.y + list_tableView.frame.size.height) >= list_tableView.contentSize.height)
            {
                if !isDataLoading{
                    // isDataLoading = true
                    self.page=self.page+1
                    
                    param.updateValue(page, forKey: "page")
                    print(param)
                    //list_tableView.reloadData()
                    
                    
                    self.searchProperty_API()
                    
                    
                }
            }
        }
        else if self.comeFrom == .home
        {
            if ((list_tableView.contentOffset.y + list_tableView.frame.size.height) >= list_tableView.contentSize.height)
            {
                if !isDataLoading{
  
                    self.page=self.page+1
                    
                    self.getProperty_API(true)
                    
                }
            }
            
            
            
            
        }
        else if self.comeFrom == .homeSearch
        {
            if ((list_tableView.contentOffset.y + list_tableView.frame.size.height) >= list_tableView.contentSize.height)
            {
                if !isDataLoading{

                    self.page=self.page+1
                    
                    getSearchResult_Api()
                    
                }
            }
            
            
            
        }
    }
    func searchProperty_API() {
        
        ApiManager.apiPostFilter(url: searchLink, param: param) { (json, error) in
            
            if error != nil{
                
                print(error?.localizedDescription ?? "")
                
            }else {
                
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    //self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                    
                    if (self.homeScreenModel?.first?.code ?? "") == "200" {
                        
                        let model = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                        print(model)
                        
                        
                        for index in 0..<(model.first?.data?.count ?? 0) {
                            
                            self.homeScreenModel?[0].data!.append((model.first?.data![index])! )
                        }

                        DispatchQueue.main.async {
                            self.list_tableView.reloadData()

                        }
                        
                        
                    }else{
                        
                        
                        self.presentAlert(msg: "Record not found")
                    }
                    
                    
                }catch  {
                    
                    print("err \(error)")
                    
                }
            }
            
        }
    }
    
    
    
    @IBAction func phone_okbtn(_ sender: Any) {
        phone_view.isHidden = true
        
    }
    
    @IBAction func btnResponseAction(_ sender: Any) {
        
    }
    @IBAction func nobtn(_ sender: Any) {
        sale_view.isHidden = true
        
    }
    
    @IBAction func yes_btn(_ sender: Any) {
        sale_view.isHidden = false
        print((sender as AnyObject).tag as Any)
        
        let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.list_tableView)
        let IndexPath = self.list_tableView.indexPathForRow(at: buttonPosition)
        
        let cell = self.list_tableView.cellForRow(at: IndexPath!) as! HomeScreenTableViewCell
        print(cell)
        
        let id = (self.homeScreenModel?.first?.data?[(sender as AnyObject).tag].id)
        print(id as Any)
        
        
        switch id {
            
        case .bool(let _):
            print("bool")
            
        case .int(let val):
            
            self.rented_property(propertyId : String(val),sender :(sender as AnyObject) as! UIButton)
            
        case .string(let val):
            self.rented_property(propertyId : String(val),sender :sender as! UIButton)
            
            
        case .none:
            
            print("none")
        }
        
    }
    @objc func rent_btn(sender : UIButton) {
        print(sender.tag)
        senderTag = sender.tag
        let buttonPosition = sender.convert(CGPoint.zero, to: self.list_tableView)
        let IndexPath = self.list_tableView.indexPathForRow(at: buttonPosition)
        
        let cell = self.list_tableView.cellForRow(at: IndexPath!) as! HomeScreenTableViewCell
        print(cell)
        if cell.rent_lbl.text == "Rent"
        {
            sale_viewlbl.text = "Rent"
            soldout_lbl.text = "Rent out?"
        }
        else if cell.rent_lbl.text == "sale"
        {
            sale_viewlbl.text = "sale"
            soldout_lbl.text = "sold out?"
        }
        if self.comeFrom == .home
        {
            if (self.homeScreenModel?.first?.data?[sender.tag].ios_rented_status ?? 0) == 1
            {
                
                cell.rent_image.image = UIImage(named: "rent_out")
                cell.rent_lbl.text = "Rent out"
                cell.rent_lbl.textColor = UIColor.red
                
                cell.rent_imageView.image = UIImage(named: "rent")
                sale_view.isHidden = true
                //            cell.rent_image .image =[UIImage image]
                //            cell.rent_image.setImage(UIImage(named: "rent_out"), for: .normal)
                
            }
            else {
                self.homeScreenModel?[0].data?[sender.tag].ios_rented_status = 1
                cell.rent_image.image = UIImage(named: "rent_blue")
                // cell.rent_lbl.text = "Rent"
                cell.rent_lbl.textColor = UIColor.black
                
                cell.rent_imageView.image = UIImage(named: "rent")
                
                sale_view.isHidden = false
                
                //cell.rent_btn.setImage(UIImage(named: "rent_blue"), for: .normal)
                
            }
        }
        
        else if (self.homeScreenModel?.first?.data?[sender.tag].rentedStatus ?? 0) == 1
                    
        {
            cell.rent_image.image = UIImage(named: "rent_out")
            cell.rent_lbl.text = "Rent out"
            cell.rent_lbl.textColor = UIColor.red
            
            cell.rent_imageView.image = UIImage(named: "rent")
            sale_view.isHidden = true
            //            cell.rent_image .image =[UIImage image]
            //            cell.rent_image.setImage(UIImage(named: "rent_out"), for: .normal)
            
        }
        else {
            self.homeScreenModel?[0].data?[sender.tag].rentedStatus = 1
            cell.rent_image.image = UIImage(named: "rent_blue")
            // cell.rent_lbl.text = "Rent"
            cell.rent_lbl.textColor = UIColor.black
            
            cell.rent_imageView.image = UIImage(named: "rent")
            
            sale_view.isHidden = false
   
        }
         
    }
    func rented_property(propertyId : String,sender :UIButton)
    {
        let proId = "\(String(describing: self.homeScreenModel?.first?.data?[senderTag].id) )"
        let resultProperID = proId.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        print(resultProperID)
        let param : [String:Any] = [ "userid" : (Singleton.sharedInstance.loginModel?.first?.data?.id ?? "") , "property_id" : resultProperID ]
        
        print(param)
        
        ApiManager.apiPost(url:Api.property_rented, param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                }
                
                do
                {
                    
                    self.callModel = try JSONDecoder().decode([CallBackModel1].self, from: data)
                    print(self.callModel?[0].msg ?? "")
                    //  let cell = self.list_tableView.cellForRow(at: [sender.tag]) as! HomeScreenTableViewCell
                    if (self.callModel?[0].msg ?? "" ) == "Rented send sucessfully!"
                    {
                        print(self.callModel?[0].msg ?? "")
                        //        //                                rent.setImage(UIImage(named: "play.png"), forState: UIControlState.Normal)
                        self.sale_view.isHidden = true
                        //
                        //                                                            print(cell)
                        self.homeCell?.rent_image.image = UIImage(named: "rent_out")
                        self.homeCell?.rent_lbl.text = "Sold Out"
                        
                        
                        self.list_tableView .reloadData()
                        
                        
                        
                    }
                    else  if (self.callModel?[0].msg ?? "" ) == "already Send"
                    {
                        //  self.list_tableView .reloadData()
                        self.homeCell?.rent_image.image = UIImage(named: "rent_blue")
                        self.homeCell?.rent_lbl.text = "Sale"
                        self.sale_view .isHidden = true
                        self.list_tableView .reloadData()
                    }
                    
                    
                    
                }
                
                catch  {
                    print("err \(error)")
                }
            }
            
        }
    }
    func viewWillApperDataCallInDidLoad() {
        phone_view.isHidden = true
        //  picker_view.isHidden = true
        phonetable_view.isHidden = true
        
        selectnumberlbl.isHidden = true
        if  self.comeFrom != .filter && self.comeFrom != .searchData{
            
            
            //    if self.comeFrom != .search && self.comeFrom != .filter {
            
            getProperty_API()
            //  list_tableView.reloadData()
            
            self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "Home", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .Search, center_type: .None, titleColor: .white)
            
        }
        if self.comeFrom == .home {
            
            self.requestCallBack_view.isHidden = false
            self.post_btn.isHidden = false
            self.bottom_view.isHidden = true
            self.searchResult_view.isHidden = true
            
   
        }
        if self.comeFrom == .homeSearch {
            //self.sort_view.isHidden = false
            bottom_view.isHidden = false
            title = "Search"
            self.searchResult_view.isHidden = true
            
            bottom_view.isHidden = false
            self.requestCallBack_view.isHidden = true
            self.post_btn.isHidden = true
            self.slider_imageView.isHidden = true
            list_tableView.tableHeaderView = nil
            self.addNavigationBar1(leftBar: .CustomBack, titleType: .Normal, title: "Search", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            var data1 = ""
            if (self.homeScreenModel?.first?.total_count ?? 0) == 0
            {
                data1 = "No Data Found"
            }
            else{
                data1 = "Search: \(self.homeScreenModel?.first?.total_count ?? 0)/  Current Position: \(1)"
            }
            
            self.searchResult_label.text = data1
            
            //  list_tableView.reloadData()
            
        }
        if self.comeFrom == .searchData {
            //self.sort_view.isHidden = false
            bottom_view.isHidden = false
            title = "Search"
            bottom_view.isHidden = false
            self.requestCallBack_view.isHidden = true
            self.post_btn.isHidden = true
            self.slider_imageView.isHidden = true
            list_tableView.tableHeaderView = nil
            self.addNavigationBar1(leftBar: .CustomBack, titleType: .Normal, title: "Search", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            var data1 = ""
            if (self.homeScreenModel?.first?.total_count ?? 0) == 0
            {
                data1 = "No Data Found"
            }
            else{
                data1 = "Search: \(self.homeScreenModel?.first?.total_count ?? 0)/  Current Position: \(1)"
            }
            
            self.searchResult_label.text = data1
            
            //  list_tableView.reloadData()
            
        }
        if self.comeFrom == .favourite {
            
            bottom_view.isHidden = false
            self.requestCallBack_view.isHidden = true
            self.post_btn.isHidden = true
            self.slider_imageView.isHidden = true
            
            list_tableView.tableHeaderView = nil
            
            self.addNavigationBar(leftBar: .CustomBack, titleType: .Normal, title: "favourite", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: NavRightSide.None, center_type: .None, titleColor: .white)
            //            self.addNavigationBar(leftBar: .CustomBack, titleType: .Normal, title: "favourite", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            //  list_tableView.reloadData()
            
        }
        
        if self.comeFrom == .search
        {
            bottom_view.isHidden = false
            title = "Search"
            list_tableView.tableHeaderView = nil
            self.addNavigationBar1(leftBar: .CustomBack, titleType: .Normal, title: "Search", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            self.requestCallBack_view.isHidden = true
            self.post_btn.isHidden = true
            
            // list_tableView.reloadData()
            
        }
        if self.comeFrom == .searchData {
            
            bottom_view.isHidden = false
            self.requestCallBack_view.isHidden = true
            self.post_btn.isHidden = true
            self.slider_imageView.isHidden = true
            // sl
            title = "Search"
            list_tableView.tableHeaderView = nil
            self.addNavigationBar1(leftBar: .CustomBack, titleType: .Normal, title: "Search", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
            lblTotalProperties.isHidden = true
            
            DispatchQueue.main.async {
                self.list_tableView.reloadData()

            }
            
        }
        if self.comeFrom == .user {
            
            bottom_view.isHidden = false
            self.searchResult_view.isHidden = true
            
            self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "User Property", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .Search, center_type: .None, titleColor: .white)
            
            
            bottom_view.isHidden = true
            self.requestCallBack_view.isHidden = false
            
            //  list_tableView.reloadData()
            
        }
        else if comeFrom != .searchData {
            list_tableView.tableHeaderView = nil
            bottom_view.isHidden = false
            //  list_tableView.reloadData()
            
            self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "Search", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .Search, center_type: .None, titleColor: .white)
        }
    }
    
    override func viewWillLayoutSubviews() {
        
        post_btn.layer.cornerRadius = 10
        
        requestCallBack_view.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    @IBAction func tap_sortBybottom_btn(_ sender: Any) {
        
        self.sideMenuSearchFilter_view.isHidden = true
        self.sideMenuSearchSort_view.isHidden = false
        
        if sideMenuSearchFull_view.isHidden {
            
            sideMenuSearchFull_view.isHidden = false
        }
        else {
            
            sideMenuSearchFull_view.isHidden = true
        }
    }
    
    @IBAction func tap_filterbyBottom_btn(_ sender: Any) {
        
        self.sideMenuSearchSort_view.isHidden = true
        self.sideMenuSearchFilter_view.isHidden = false
        
        if sideMenuSearchFull_view.isHidden {
            
            sideMenuSearchFull_view.isHidden = false
        }
        else {
            
            sideMenuSearchFull_view.isHidden = true
        }
    }
    
    @IBAction func tap_bottomFilter_btn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func tap_sort_button() {
        
        sort_view.isHidden = false
    }
    
    @IBAction func tap_bottomAtoZ_btn(_ sender: Any) {
        
        self.param.updateValue("A to Z", forKey: "search")
        
        self.sideMenuSearch_Api()
        
        sideMenuSearchFull_view.isHidden = true
    }
    
    @IBAction func tap_bottomZtoA_btn(_ sender: Any) {
        
        self.param.updateValue("Z to A", forKey: "search")
        
        self.sideMenuSearch_Api()
        
        sideMenuSearchFull_view.isHidden = true
    }
    
    @IBAction func tap_bottomLowToHight(_ sender: Any) {
        
        self.param.updateValue("low to high", forKey: "search")
        
        self.sideMenuSearch_Api()
        sideMenuSearchFull_view.isHidden = true
    }
    
    @IBAction func tap_bottomHightToLow_btn(_ sender: Any) {
        
        self.param.updateValue("high to low", forKey: "search")
        
        self.sideMenuSearch_Api()
        sideMenuSearchFull_view.isHidden = true
    }
    
    @IBAction func tap_OldestToLatest(_ sender: Any) {
       // self.sort = "asc"
        self.param.updateValue("asc", forKey: "search")
        
        self.sideMenuSearch_Api()
        sideMenuSearchFull_view.isHidden = true
    }
    
    @IBAction func tapLatestTOoldest(_ sender: Any) {
        //self.sort = "desc"
        self.param.updateValue("desc", forKey: "search")
        
        self.sideMenuSearch_Api()
        sideMenuSearchFull_view.isHidden = true
    }
    
    @IBAction func tapSelectMonth(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopCalenderVC") as! PopCalenderVC
        vc.passDate = self
        self.navigationController?.pushViewController(vc, animated: true)    }
    
  
    
    //MARK: Filter Search
    
    @IBAction func tap_aToZ_btn(_ sender: Any) {
        
        self.sort = "A to Z"
        
        self.sort_view.isHidden = true
        
        self.getSearchResult_Api()
    }
    
    @IBAction func tap_ztoA_btn(_ sender: Any) {
        
        self.sort = "Z to A"
        
        self.sort_view.isHidden = true
        
        self.getSearchResult_Api()
    }
    
    @IBAction func tap_lowToHigh_btn(_ sender: Any) {
        
        self.sort = "Low to High"
        
        self.sort_view.isHidden = true
        
        self.getSearchResult_Api()
        
    }
    
    @IBAction func tap_highToLow_btn(_ sender: Any) {
        
        self.sort = "High to Low"
        
        self.sort_view.isHidden = true
        
        self.getSearchResult_Api()
    }
    

    
    override func tap_back_button() {
        
        self.searchResult_view.isHidden = true
        self.navigationItem.titleView = nil
        
        list_tableView.tableHeaderView = saveHeader
        
        self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "ReallWorld", bgColor: .clear, barTintColor: .navigationColor() , right: .Search, center_type: .None, titleColor: .white)
        
        comeFrom = .home
        
        self.setTableHeader()
        
        self.page = 0
        
        self.getProperty_API()
        
     //   self.navigationController?.popViewController(animated: true)
  
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
        timer?.invalidate()
        timer = nil
    }
    
    
    //MARK:- Function
    
    func setTableHeader() {

        
        self.getBanner_API()
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector( scrollAutomatically), userInfo: nil, repeats: true)
    }
    
    //MARK:- Button Action
    
    override func tap_search_button() {
        
        self.saveHeader = list_tableView.tableHeaderView ?? UIView()
        
        self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "", bgColor: .clear, barTintColor: .navigationColor(), right: .Cross, center_type: .None, titleColor: .white)
        
        itemView = Bundle.main.loadNibNamed("NavigationSearch", owner: nil, options: nil)![0] as! NavigationSearch
        
        itemView.search_textfield.addTarget(self, action: #selector(endEditing), for: .editingDidEnd)
        
        itemView.search_textfield.setPlaceholderColor()
        
        let view1 = UIView(frame: CGRect(x: 80, y: 0, width: 220, height: 40))
        
        view1.addSubview(itemView)
        
        self.navigationItem.titleView = view1
 
    }
    
    @objc func endEditing() {
        
        comeFrom = .homeSearch
        
        self.addNavigationBar(leftBar: .CustomBack, titleType: .Normal, title: "", bgColor: .clear, barTintColor: .navigationColor(), right: .None, center_type: .None, titleColor: .white)
        
        self.getSearchResult_Api()
    }
    
    override func tap_cross_button() {
        
        self.navigationItem.titleView = nil
        
        list_tableView.tableHeaderView = saveHeader
        
        self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "ReallWorld", bgColor: .clear, barTintColor: .navigationColor() , right: .Search, center_type: .None, titleColor: .white)
        
        comeFrom = .home
        
        self.setTableHeader()
        
        self.page = 0
        
        self.getProperty_API()
    }
    
    override func tap_filter_button() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        
        vc.delegate = self
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tap_post_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostYourPreferencesViewController") as! PostYourPreferencesViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func tap_requestCallBack_btn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
        
        vc.comeFrom = .CallBack
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        
        //    print("Scroll")
        if let coll  =  slider_imageView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < ((bannerModel?.first?.data?.count ?? 0) - 1) ){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row )! + 1 , section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1! , at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                
            }
        }
        
    }
   
    func favouriteUnFavourite_API(propertyId : String,sender :UIButton) {
        
        let param : [String:Any] = [ "user_id" : (Singleton.sharedInstance.loginModel?.first?.data?.id ?? "") , "property_id" : propertyId , "status" : "1" ]
        
        print(param)
        
        ApiManager.apiGetWithoutBaseWithKey(url: "\(Api.base_url_fav)\(Api.favourite)", param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                }
                
                do
                {
                    
                    self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                    
                    if (self.homeScreenModel?.first?.message ?? "") == "favourite Property" {
                        
                    }
                    
                    //  self.callModel = try JSONDecoder().decode([CallBackModel1].self, from: data)
                    print(self.homeScreenModel)
   
                    
                }
                
                catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    func UnFavourite_API(propertyId : String,sender:UIButton) {
        print("\(sender.tag)")
        
        let param : [String:Any] = [ "user_id" : (Singleton.sharedInstance.loginModel?.first?.data?.id ?? "") , "property_id" : propertyId , "status" : "0" ]
        
        print(param)
        
        ApiManager.apiGetWithoutBaseWithKey(url: "\(Api.base_url_fav)\(Api.Unfavritproperty)", param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                }
                
                do
                {
                    print(self.homeScreenModel?.first?.message ?? "")
                    //                    self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                    //                      if (self.homeScreenModel?.first?.message ?? "") == "Unfavourite Property" {
                    //                    }
                    
                    let callModel = try JSONDecoder().decode(CallBackModel1.self, from: data)
                    if callModel.message == "Unfavourite Property" {
                        print(self.homeScreenModel?.count as Any)
                        if self.comeFrom == .favourite  || self.comeFrom == .searchData{
                            var model = self.homeScreenModel?.first?.data
                            model?.remove(at: sender.tag)
                            self.homeScreenModel?[0].data = model
                            
                            DispatchQueue.main.async {
                                self.list_tableView.reloadData()

                            }
                            
                        }
                    }
                    else {
                        
                    }
   
                }
                
                catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
    
    /*
     func filter_API(param : [String:Any]) {
     
     var param = param
     
     param.updateValue((Singleton.sharedInstance.loginModel?.first?.data?.id ?? ""), forKey: "userid")
     
     param.updateValue(String(page), forKey: "page")
     
     
     
     print(param)
     
     ApiManager.apiPost(url:  Api.getProperties, param: param, ref: self) { (json, error) in
     
     if error != nil{
     print(error?.localizedDescription ?? "")
     }else {
     guard let data = json else {
     print("error")
     return
     
     }
     do {
     
     
     //    if isAdd
     {
     
     let model = try JSONDecoder().decode(HomeScreenModel.self, from: data)
     
     for index in 0..<(model.first?.data?.count ?? 0) {
     
     self.homeScreenModel?[0].data!.append((model.first?.data![index])! )
     }
     
     
     
     }else {
     
     self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
     
     }
     
     //  self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
     
     if (self.homeScreenModel?.first?.code ?? "") == "200" {
     
     
     DispatchQueue.main.async {
     
     self.list_tableView.reloadData()
     }
     
     
     }else{
     
     
     self.presentAlert(msg: "Record not found")
     }
     
     }catch  {
     print("err \(error)")
     }
     }
     
     }
     
     }
     */
    
    func getFavritproperty(_ isAdd : Bool = false) {
        
        
        
        let param : [String:Any] = [ "userid" : Singleton.sharedInstance.loginModel?.first?.data?.id ?? "","page": String(page) ]
        
        
        ApiManager.apiPostWithoutBase(url: "\(Api.getfav)", param: param, ref: self) {
            (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    self.addNavigationBar(leftBar: .CustomBack, titleType: .Normal, title: "Favourite Properties", bgColor: .clear, barTintColor: .navigationColor(),right: .None, center_type: .None, titleColor: .white)
                    
                    
                    if isAdd {
                        
                        let model = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                        
                        for index in 0..<(model.first?.data?.count ?? 0) {
                            if self.page == 1 {
                                self.homeScreenModel?[0].data!.append((model.first?.data![index])! )
                            } else {
                                self.homeScreenModel?[0].data!.append((model.first?.data![index])! )
                            }
                            
                        }
                        
                        
                        
                    }else {
                        
                        self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                        print(self.homeScreenModel as Any)
                        
                        DispatchQueue.main.async {
                            self.list_tableView.reloadData()

                        }
                        
                    }
                    
                    
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
    
    func getSearchResult_Api() {
        
        
        let keyword = (itemView.search_textfield.text ?? "")
        
        let param : [String:Any] = [ "userid" : Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" , "search" : keyword , "orderby" : "","page": String(page) ]
        
        ApiManager.apiPostWithoutBase(url: "\(Api.homeSearch)", param: param, ref: self) {
            (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    
                    self.addNavigationBar(leftBar: .CustomBack, titleType: .Normal, title: "", bgColor: .clear, barTintColor: .navigationColor(), right: .Sort, center_type: .None, titleColor: .white)
                    
                    self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                    if ((self.homeScreenModel?.isEmpty) == nil)
                    {
                        
                    }
                    else
                    {
                        DispatchQueue.main.async {
                            //self.list_tableView.tableHeaderView = nil
                            self.list_tableView.reloadData()
                            //}
                            
                            //    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            var data1 = ""
                            if (self.homeScreenModel?.first?.data?.count ?? 0) != 0 {
                                if (self.homeScreenModel?.first?.data?.count ?? 0) == 0
                                {
                                    data1 = "No Data Found"
                                }
                                else{
                                    data1 = "Search: \(self.homeScreenModel?.first?.data?.count ?? 0)/  Current Position: \(1)"
                                }
                                
                                
                                // data = "Search: \(self.homeScreenModel?.first?.data?.count ?? 0)"
                                
                                self.searchResult_view.isHidden = false
                                self.lblTotalProperties.isHidden = true
                                self.searchResult_label.text = data1
                                self.requestCallBack_view.isHidden = true
                                self.post_btn.isHidden = true
                                self.list_tableView.tableHeaderView = nil
                                
                            }
                            
                            
                        }
                        
                        self.setTableHeader()
                        
                    }
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
    
    func getBanner_API() {
        
        let param : [String:Any] = [  : ]
        
        print(param)
        
        ApiManager.apiPost(url:  Api.getbannerImage, param: param, ref: self) { (json, error) in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    self.bannerModel = try JSONDecoder().decode(BannerImageModel.self, from: data)
                    
                    
                    if self.slider_imageView != nil {
                        self.slider_imageView.reloadData()
                    }
                    
                    
                    
                }catch  {
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
    
    func sideMenuSearch_Api() {
        
        
        ApiManager.apiPostFilter(url: searchLink, param: param) { (json, error) in
            
            if error != nil{
                
                print(error?.localizedDescription ?? "")
                
            }else {
                
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                    
                    if (self.homeScreenModel?.first?.code ?? "") == "200" {
                        
                        
                        DispatchQueue.main.async {
                            
                            self.list_tableView.reloadData()
                        }
                        
                        
                    }else{
                        
                        
                        self.presentAlert(msg: "Record not found")
                    }
                    
                    
                }catch  {
                    
                    print("err \(error)")
                    
                }
            }
            
        }
        
    }
    
    
    func getProperty_API(_ isAdd : Bool = false) {
        
        var link = ""
        
        var param : [String:Any] = [ "userid" : Singleton.sharedInstance.loginModel?.first?.data?.id ?? "" , "page" : String(page)]
        
        switch comeFrom {
        case .home:
            //viewTotal.isHidden = true
            link = Api.getProperties
            
        case .monthly:
            link = Api.getMonthlyProperties
            
        case .user:
            // viewTotal.isHidden = false
            link = Api.getUserProperties
            
        case .weekly:
            
            link = Api.getWeeklyProperties
            
        case .search :
            
            link = Api.getProperties
            
        case .homeSearch:
            
            // self.getSearchResult_Api()
            return
        case .filter:
            
            link = Api.getProperties
            param = self.param
            
            self.param.updateValue(String(page), forKey: "page")
            break
            
            //  return
            
        case .favourite:
            self.getFavritproperty(false)
            break
            
            
            //          link = "http://reallworld.com/api/getFavritproperty"
            //            print(link)
            
        case .searchData:
            link = Api.getProperties
            
            param = self.param
            
            
            //  self.param.updateValue(String(page), forKey: "page")
        case .commentedScreen:
            link = Api.getProperties
            
        }
        
        
        print(param)
        home = true
        ApiManager.apiPost(url:  link, param: param, ref: self) { (json, error) in
            
            if error != nil{
                
                print(error?.localizedDescription ?? "")
            }else {
                guard let data = json else {
                    print("error")
                    return
                    
                }
                do {
                    
                    
                    if isAdd {
                        
                        let model = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                        print(model)
                        
                        for index in 0..<(model.first?.data?.count ?? 0) {
                            
                            self.homeScreenModel?[0].data!.append((model.first?.data![index])! )
                        }
                        
                        
                        
                    }else {
                        
                        self.homeScreenModel = try JSONDecoder().decode(HomeScreenModel.self, from: data)
                        print(self.homeScreenModel!)
                        self.list_tableView.tableHeaderView = self.tableHeaderView
                    }
                    
                    if self.comeFrom == .weekly
                    {
                        
                        DispatchQueue.main.async {
                            let data = "Total Weekly Properties: \(self.homeScreenModel?.first?.data?.count ?? 0)"
                            
                            
                            self.searchResult_view.isHidden = false
                            self.lblTotalProperties.isHidden = true
                            
                            //  self.searchResult_view.isHidden = true
                            self.searchResult_label.text = data
                        }
                        
                        
                    }
                    if self.comeFrom ==  ComeFrom.home
                    {
                        
                        self.bottom_view.isHidden = false
                        self.list_tableView.tableHeaderView = self.tableHeaderView
                        if comesFromCommented == true{
                            if let indexPaths = self.list_tableView.indexPathsForVisibleRows {
                                comesFromCommented = false
                                self.list_tableView.reloadRows(at: indexPaths, with: .none)
                            } else {
                                DispatchQueue.main.async {
                                    self.list_tableView.reloadData()

                                }
                                
                            }
                        }
                        
                        
                        // self.list_tableView.reloadData()
                    }
                    
                    if self.comeFrom == .search
                    {
                        self.addNavigationBar1(leftBar: .CustomBack, titleType: .Normal, title: "Search", bgColor: .clear, barTintColor: .navigationColor(),right: .None, center_type: .None, titleColor: .white)
                        DispatchQueue.main.async {
                            //                            let data = "Total Weekly: \(self.homeScreenModel?.first?.data?.count ?? 0)"
                            //                            print(data)
                            //
                            //self.list_tableView.tableHeaderView = self.tableHeaderView
                            self.searchResult_view.isHidden = false
                            self.lblTotalProperties.isHidden = true
                            if comesFromCommented == true{
                                if let indexPaths = self.list_tableView.indexPathsForVisibleRows {
                                    comesFromCommented = false
                                    self.list_tableView.reloadRows(at: indexPaths, with: .none)
                                } else {
                                    //   self.list_tableView.reloadData()
                                }
                            }
                            //self.searchResult_label.text = data
                        }
                        
                        
                    } else if self.comeFrom == .searchData
                    {
                        self.addNavigationBar1(leftBar: .CustomBack, titleType: .Normal, title: "Search", bgColor: .clear, barTintColor: .navigationColor(),right: .None, center_type: .None, titleColor: .white)
                        //   DispatchQueue.main.async {
                        let data = "Total Weekly: \(self.homeScreenModel?.first?.data?.count ?? 0)"
                        //                            print(data)
                        self.list_tableView.tableHeaderView = nil
                        self.searchResult_label.text = data
                        self.searchResult_view.isHidden = false
                        
                        if comesFromCommented == true{
                            if let indexPaths = self.list_tableView.indexPathsForVisibleRows {
                                comesFromCommented = false
                                self.list_tableView.reloadRows(at: indexPaths, with: .none)
                            } else {
                                // self.list_tableView.reloadData()
                            }
                        }
                        //if self.page == 1 {
                        let data1 = "Search: \(self.homeScreenModel?.first?.total_count ?? 0)/  Current Position: \(1)"
                        self.searchResult_label.text = data1
                        //}
                        
                        
                        DispatchQueue.main.async {
                            self.list_tableView.reloadData()

                        }
                        
                    }
                    else if self.comeFrom == .user {
                        
                        self.bottom_view.isHidden = true
                        self.searchResult_view.isHidden = true
                        
                        
                        self.addNavigationBar(leftBar: .SideBar, titleType: .Normal, title: "User Property", bgColor: .navigationColor(), barTintColor: .navigationColor(), right: .Search, center_type: .None, titleColor: .white)
                        
                        //   self.list_tableView.reloadData()
                        
                    }
                    else if self.comeFrom == .monthly
                                
                    {
                        
                        DispatchQueue.main.async {
                            print(self.homeScreenModel?.first?.data?.count ?? 0)
                            
                            let data = "Total Monthly Properties: \(self.homeScreenModel?.first?.totalProperties ?? 0)"
                            print(data)
                            self.searchResult_view.isHidden = false
                            self.lblTotalProperties.isHidden = true
                            
                            
                            self.searchResult_view.isHidden = false
                            
                            self.searchResult_label.text = data
                            
                        }
                    }
                    
                    if (self.homeScreenModel?.first?.code ?? "") == "200" {
                        
                        
                        // DispatchQueue.main.async {
                        LoaderClass.stopLoader()
                        home = false
                        DispatchQueue.main.async {
                            self.list_tableView.reloadData()

                        }                        //}
                        
                        
                    }else{
                        LoaderClass.stopLoader()
                        home = false
                        self.presentAlert(msg: "Record not found")
                    }
                    
                    
                }catch  {
                    LoaderClass.stopLoader()
                    home = false
                    print("err \(error)")
                }
            }
            
        }
        
    }
    
}

extension HomeScreenViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == list_tableView
        {
            let rowCount = self.homeScreenModel?.first?.data?.count ?? 0
            
            if rowCount == 0 {
                
                
            }else {
                
                self.list_tableView.backgroundView = UIView()
            }
            //            if self.homeScreenModel?.first?.data?.count ?? 0 > 0 {
            //                lblNoDataFound.isHidden = true
            //            }else{
            //                lblNoDataFound.isHidden = false
            //            }
            return self.homeScreenModel?.first?.data?.count ?? 0
        }
        else   if tableView == phonetable_view
        {
            
            return   phonearr.count
        }
        
        
        return self.homeScreenModel?.first?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == list_tableView
        {
            
            let cell = self.list_tableView.dequeueReusableCell(withIdentifier: "HomeScreenTableViewCell") as! HomeScreenTableViewCell
            
            cell.whatsapp_btn.addTarget(self, action: #selector(tap_whatsapp_btn), for: .touchUpInside)
            
            cell.whatsapp_btn.tag = indexPath.row
            
            cell.call_btn.addTarget(self, action: #selector(tap_call_btn), for: .touchUpInside)
            cell.call_btn.tag = indexPath.row
            
            cell.comment_btn.tag = indexPath.row
            
          
            cell.comment_btn.addTarget(self, action: #selector(tap_comment_btn), for: .touchUpInside)
            
            cell.comment_btn.tag = indexPath.row
            
            cell.direction_btn.addTarget(self, action: #selector(tap_direction_btn), for: .touchUpInside)
            
            cell.direction_btn.tag = indexPath.row
            
            cell.share_btn.addTarget(self, action: #selector(tap_share_btn), for: .touchUpInside)
            
            cell.share_btn.tag = indexPath.row
            
            //MARK: this is use for premium User
            let verifyStatus = homeScreenModel?.first?.data?[indexPath.row].verifyStatus
            
            if verifyStatus == "1" {
                
                cell.verified_imageView.image =   UIImage(named: "verified")
                   
            }
            else if verifyStatus == "2" {
                cell.verified_imageView.image = UIImage(named: "verifiedp1")
           
                
            }
            else{
                
                cell.verified_imageView.image =   UIImage(named: "verified")
         
                
            }
            
            
            cell.btnViewResposeAct = {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewResponseVC") as! ViewResponseVC
                vc.propertyDesc = ((self.homeScreenModel?.first?.data?[indexPath.row].id ) as AnyObject).description
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if self.comeFrom == .searchData
            {
                
                if (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Rent Out Property" ||    (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Lease Out Property"
                    
                {
                    
                    if (self.homeScreenModel?.first?.data?[indexPath.row].rentedStatus ?? 0) == 1
                    {
                        cell.rent_image.image = UIImage(named: "rent_out")
                        cell.rent_lbl.text = "Rent out"
                        cell.rent_lbl.textColor = UIColor.red
                     
                        cell.rent_imageView.image = UIImage(named: "rent")
                        
                        
                    }
                    else {
                        cell.rent_image.image = UIImage(named: "rent_blue")
                        cell.rent_lbl.text = "Rent"
                        cell.rent_lbl.textColor = UIColor.black
                        cell.rent_imageView.image = UIImage(named: "rent")
                        
                    }
                }
                
                
                else if ((self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Sell Commercial Property" || (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Sell Property")
                {
                    if (self.homeScreenModel?.first?.data?[indexPath.row].rentedStatus ?? 0) == 1
                    {
                        cell.rent_image.image = UIImage(named: "rent_out")
                        cell.rent_lbl.text = "sold out"
                        cell.rent_lbl.textColor = UIColor.red
                       
                        cell.rent_imageView.image =   UIImage(named:  "SALE")
                        
                        
                    }
                    else {
                        cell.rent_image.image = UIImage(named: "rent_blue")
                        cell.rent_lbl.text = "sale"
                        cell.rent_lbl.textColor = UIColor.black
                        cell.rent_imageView.image =  UIImage(named: "SALE")
                        
                        
                    }
                }
            }
            else if self.comeFrom == .home
            {
                
                if (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Rent Out Property" ||    (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Lease Out Property"
                    
                {
                    
                    if (self.homeScreenModel?.first?.data?[indexPath.row].ios_rented_status ?? 0) == 1
                    {
                        cell.rent_image.image = UIImage(named: "rent_out")
                        cell.rent_lbl.text = "Rent out"
                        cell.rent_lbl.textColor = UIColor.red
                       
                        cell.rent_imageView.image = UIImage(named: "rent")
                        
                        
                    }
                    else {
                        cell.rent_image.image = UIImage(named: "rent_blue")
                        cell.rent_lbl.text = "Rent"
                        cell.rent_lbl.textColor = UIColor.black
                      
                        cell.rent_imageView.image = UIImage(named: "rent")
                        
                        
                    }
                }
                
                
                else if ((self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Sell Commercial Property" || (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Sell Property")
                {
                    if (self.homeScreenModel?.first?.data?[indexPath.row].ios_rented_status ?? 0) == 1
                    {
                        cell.rent_image.image = UIImage(named: "rent_out")
                        cell.rent_lbl.text = "sold out"
                        cell.rent_lbl.textColor = UIColor.red
                        cell.rent_imageView.image =  UIImage(named: "rent")
                  
                        
                    }
                    else {
                        cell.rent_image.image = UIImage(named: "rent_blue")
                        cell.rent_lbl.text = "sale"
                        cell.rent_lbl.textColor = UIColor.black
                        cell.rent_imageView.image = UIImage(named: "rent")
            
                        //cell.rent_btn.setImage(UIImage(named: "rent_blue"), for: .normal)
                    }
                }
            }
            else
            {
                if (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Rent Out Property" ||    (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Lease Out Property"
                    
                {
                    
                    if (self.homeScreenModel?.first?.data?[indexPath.row].rentedStatus ?? 0) == 1
                    {
                        cell.rent_image.image = UIImage(named: "rent_out")
                        cell.rent_lbl.text = "Rent out"
                        cell.rent_lbl.textColor = UIColor.red
                        cell.rent_imageView.image =  UIImage(named: "rent")
                        //UIImage.gif(name: "rent")
                        
                    }
                    else {
                        cell.rent_image.image = UIImage(named: "rent_blue")
                        cell.rent_lbl.text = "Rent"
                        cell.rent_lbl.textColor = UIColor.black
                        cell.rent_imageView.image =  UIImage(named: "rent")
                        //UIImage.gif(name: "rent")
                        
                    }
                }
                
                
                else if ((self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Sell Commercial Property" || (self.homeScreenModel?.first?.data?[indexPath.row].propertyCategory ?? "") == "Sell Property")
                {
                    if (self.homeScreenModel?.first?.data?[indexPath.row].rentedStatus ?? 0) == 1
                    {
                        cell.rent_image.image = UIImage(named: "rent_out")
                        cell.rent_lbl.text = "sold out"
                        cell.rent_lbl.textColor = UIColor.red
                        cell.rent_imageView.image = UIImage(named: "SALE")
                        
                        
                        
                    }
                    else {
                        cell.rent_image.image = UIImage(named: "rent_blue")
                        cell.rent_lbl.text = "sale"
                        cell.rent_lbl.textColor = UIColor.black
                        cell.rent_imageView.image = UIImage(named: "SALE")
                        
                    }
                }
            }
            
            
            cell.rent_btn.addTarget(self, action: #selector(rent_btn), for: .touchUpInside)
            cell.rent_btn.tag = indexPath.row
            
            //        self.rentstatus = ((self.homeScreenModel?.first?.data?[indexPath.row].ios_rented_status) != nil)
            //
            //        print(self.rentstatus)
            cell.oneIndexData = self.homeScreenModel?.first?.data?[indexPath.row]
            
            if (self.homeScreenModel?.first?.data?[indexPath.row].iscomment ?? "false") == "true" {
                
                cell.comment_label.text = "Commented"
                cell.comment_label.textColor = UIColor.purple
                
            }else {
                
                cell.comment_label.text = "Comment"
                cell.comment_label.textColor = UIColor.black
                
            }
            if (self.homeScreenModel?.first?.data?[indexPath.row].is_location ?? "false") == "true" {
                
                cell.direction_lbl.text = "live Loc."
                cell.direction_lbl.textColor =  UIColor.purple
                
                
            }else {
                
                cell.direction_lbl.text = "Location"
                cell.direction_lbl.textColor =  UIColor.black
                
            }
            
            if self.comeFrom == .user{
                cell.viewTableHeightConstant.constant = 30
                cell.viewTable.isHidden = false
                cell.lblLineOne.isHidden = false
                cell.lblLineTwo.isHidden = false
                
            }else{
                cell.viewTableHeightConstant.constant = 0
                cell.viewTable.isHidden = true
                cell.lblLineOne.isHidden = true
                cell.lblLineTwo.isHidden = true
                
            }
            
            if (self.homeScreenModel?.first?.data?[indexPath.row].bookmark_status ?? 0) == 1        {
                cell.heart_btn.setImage(UIImage(named: "heartred"), for: .normal)
                //  is_check = false
            }
            else
            {
                
                cell.heart_btn.setImage(UIImage(named: "hearwhite"), for: .normal)
                //  is_check = true
                
            }
            self.like = ((self.homeScreenModel?.first?.data?[indexPath.row].bookmark_status) != nil)
            
            cell.heart_btn.addTarget(self, action: #selector(tap_heart_btn), for: .touchUpInside)
            cell.heart_btn.tag = indexPath.row
            
            
            
            if self.comeFrom == .favourite {
                let url = self.homeScreenModel?.first?.data?[indexPath.row].image1 ?? ""
                
                cell.main_imageView.sd_setImage(with: URL(string: url))
            }
            else if self.comeFrom == .search {
                
                let url = self.homeScreenModel?.first?.data?[indexPath.row].image ?? ""
                
                cell.main_imageView.sd_setImage(with: URL(string: url))
                
            } else if self.comeFrom == .searchData {
                let url = self.homeScreenModel?.first?.data?[indexPath.row].image1 ?? ""
                
                cell.main_imageView.sd_setImage(with: URL(string: url))
            }
            else
            {
                let url = self.homeScreenModel?.first?.data?[indexPath.row].image ?? ""
                
                cell.main_imageView.sd_setImage(with: URL(string: url))
            }
            
            return cell
        }
       
        else if tableView == phonetable_view
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            let str = phonearr[indexPath.row]
            
            cell.textLabel?.text = str
            
            return cell
            
        }
        
        return   UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        phone_view.isHidden = true
        if tableView == list_tableView
        {
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HouseDetailViewController") as! HouseDetailViewController
            vc.houseDetail = self.homeScreenModel?.first?.data?[indexPath.row]
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        else    if tableView == phonetable_view
        {
            if chkphone == "1"
                
            {
                
                var str = phonearr[indexPath.row]
                
                str = str.addingPercentEncoding(withAllowedCharacters: (NSCharacterSet.urlQueryAllowed))!
                let whatsappURL = URL(string: str)
                
                var txt = "Hello Please share the property details and pictures.Thank You.."
                let urlWhats = "\("whatsapp://send?phone=")\("91"+str)&abid=12354&text=Hello Please share the property details and pictures.Thank You.."
                
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.comeFrom == .monthly
        {
            let data = "Total Monthly Properties: \(self.homeScreenModel?.first?.totalProperties ?? 0)"
            self.searchResult_label.text = data
        }
        else if self.comeFrom == .weekly
        {
            let data = "Total Weekly Properties: \(self.homeScreenModel?.first?.data?.count ?? 0)"
            
            self.searchResult_label.text = data
        }
        else if self.comeFrom == .searchData
        {

            self.searchResult_view.isHidden = false
            self.bottom_view.isHidden = false
            self.requestCallBack_view.isHidden = true
            self.post_btn.isHidden = true
            self.list_tableView.tableHeaderView = nil
            self.searchResult_label.isHidden = false
            
        }
        else if self.comeFrom == .home
        {

            self.bottom_view.isHidden = true
            self.requestCallBack_view.isHidden = false
            self.post_btn.isHidden = false
            self.list_tableView.tableHeaderView = tableHeaderView
            
            self.searchResult_label.isHidden = false
            
            
            
        }
        
        
        if self.comeFrom == .home && self.comeFrom == .filter  {
            
            if (indexPath.row - 1) == (self.homeScreenModel?.first?.data?.count ?? 0) - 2 {
                
                page = page + 1
                
                self.getProperty_API(true)
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
    }
    
    @objc func tap_edit_btn(sender : UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostPropertyViewController") as! PostPropertyViewController
        
        vc.homeData = self.homeScreenModel?.first?.data?[sender.tag]
        vc.valuedata = "1"
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    @objc func tap_heart_btn(sender : UIButton) {
        phone_view.isHidden = true

        
        let buttonPosition = sender.convert(CGPoint.zero, to: self.list_tableView)
        let IndexPath = self.list_tableView.indexPathForRow(at: buttonPosition)
        
        let cell = self.list_tableView.cellForRow(at: IndexPath!) as! HomeScreenTableViewCell
        print(cell)
        
        let id = (self.homeScreenModel?.first?.data?[sender.tag].id)
        print(id as Any)
        if self.comeFrom == .favourite {
            switch id {
                
            case .bool(let _):
                print("bool")
                
            case .int(let val):
                
                if  self.like == true{
                    cell.heart_btn.setImage(UIImage(named: "hearwhite"), for: .normal)
                    
                    self.UnFavourite_API(propertyId:String(val),sender:sender )
                    
                }
                else
                {
                    cell.heart_btn.setImage(UIImage(named: "hearwhite"), for: .normal)
                    
                    self.UnFavourite_API(propertyId:String(val),sender:sender )
                    
                }
                
                
            case .string(let val):
                break
                // self.favouriteUnFavourite_API(propertyId: String(val),sender: sender)
                
                
            case .none:
                
                print("none")
            }
        }
        
        else  if self.comeFrom == .home || self.comeFrom == .monthly || self.comeFrom == .weekly || self.comeFrom == .searchData || self.comeFrom == .homeSearch || self.comeFrom == .user
        {
            
            switch id {
                
            case .bool(let _):
                print("bool")
                
            case .int(let val):
                
                if  self.like == true{
                    cell.heart_btn.setImage(UIImage(named: "heartred"), for: .normal)
                    self.favouriteUnFavourite_API(propertyId: String(val),sender: sender)
                    self.like = false
                }
                else
                {
                    cell.heart_btn.setImage(UIImage(named: "hearwhite"), for: .normal)
                    self.like = true
                    
                    self.UnFavourite_API(propertyId:String(val),sender:sender )
                    
                }
                
                
            case .string(let val):
                if  self.like == true{
                    cell.heart_btn.setImage(UIImage(named: "heartred"), for: .normal)
                    self.favouriteUnFavourite_API(propertyId: String(val),sender: sender)
                    self.like = false
                }
                else
                {
                    cell.heart_btn.setImage(UIImage(named: "hearwhite"), for: .normal)
                    self.like = true
                    
                    self.UnFavourite_API(propertyId:String(val),sender:sender )
                    
                }
                
                
            case .none:
                
                print("none")
            }
            
        }
    }
    
    
    @objc func tap_whatsapp_btn(sender : UIButton) {
        phone_view.isHidden = true

        if self.homeScreenModel?.first?.data?[(sender as AnyObject).tag].mobile == "Available for premium users"
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
            let phone = "\(self.homeScreenModel?.first?.data?[(sender as AnyObject).tag].mobile ?? "")"
            let mobile = "\(self.homeScreenModel?.first?.data?[(sender as AnyObject).tag].alternativeNumber ?? "")"
            
//            phonearr = phone.components(separatedBy: "," )
//            phonearr.append(phone)
//            phonearr.append(mobile)
//
            phonenumberWhatsApp = "\(self.homeScreenModel?.first?.data?[(sender as AnyObject).tag].mobile ?? "")"
            chkphone = "1"
            phonearr.removeAll(where: { $0 == "" })

            phonetable_view.reloadData()
            
            phone_view.isHidden = false
            // picker_view.isHidden = false
            phonetable_view.isHidden = false
            
            selectnumberlbl.isHidden = false
        }
        
    }
    
    @objc func tap_call_btn(sender : UIButton) {
        phone_view.isHidden = false

        if self.homeScreenModel?.first?.data?[(sender as AnyObject).tag].mobile == "Available for premium users"
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
            let index = sender.tag
            let phone = "\(self.homeScreenModel?.first?.data?[index].mobile ?? "")"
            let mobile = "\(self.homeScreenModel?.first?.data?[index].alternativeNumber ?? "")"
          //  phonearr = phone.components(separatedBy: ",")
            phonearr.append(mobile)
            phonearr.append(phone)
            phonearr.joined(separator: ",")
            
            chkphone = "2"
            phonearr.removeAll(where: { $0 == "" })

            phonetable_view.reloadData()
            
            phone_view.isHidden = false
            phonetable_view.isHidden = false
            
            selectnumberlbl.isHidden = false
        }
        
    }
    
    @objc func tap_comment_btn(sender : UIButton) {
        phone_view.isHidden = true

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        vc.delegate = self

        let id = self.homeScreenModel?.first?.data?[sender.tag].id
        vc.indexVlaue = "\(sender.tag)"

        switch id {
            
        case .bool(let _):
            print("bool")
            
        case .int(let val):
            
            vc.propertyId = String(val)
            
        case .string(let val) :
            
            vc.propertyId = val
            
        case .none:
            
            print("none")
            
        }
        
        //   vc.propertyId = String(self.homeScreenModel?.first?.data?[sender.tag].id ?? -1)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tap_direction_btn(sender : UIButton) {
        phone_view.isHidden = true

        latitude = self.homeScreenModel?.first?.data?[sender.tag].lat! as! String
        longitude = self.homeScreenModel?.first?.data?[sender.tag].lng! as! String
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.lat = self.homeScreenModel?.first?.data?[sender.tag].lat ?? ""
        vc.long = self.homeScreenModel?.first?.data?[sender.tag].lng ?? ""
        self.navigationController?.pushViewController(vc, animated: true)

//        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
//            UIApplication.shared.open(URL(string:"comgooglemaps://?center=\(self.latitude),\(self.longitude)&zoom=14&views=traffic&q=\(self.longitude),\(self.latitude)")!, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.open(URL(string: "http://maps.google.com/maps?q=loc:\(self.latitude),\(self.longitude)&zoom=14&views=traffic&q=\(self.latitude),\(self.longitude)")!, options: [:], completionHandler: nil)
//        }
        
    }
    
    @objc func tap_share_btn(sender : UIButton) {
        phone_view.isHidden = true

        //share(linkShare : "https://realworld.com")
        let houseDetail = homeScreenModel?.first?.data?[sender.tag]
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
    
    
    
    
    func sharePicture() {
        
        
        let urlWhats = "\("whatsapp://send?phone=")\(phonenumberWhatsApp)&abid=12354&text"
        //"whatsapp://send?phone=+919789384445&abid=12354&text=Hello"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = NSURL(string: urlString) {
                
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    
                    let imgURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let fileName = "yourImageName.jpg"
                    let fileURL = imgURL.appendingPathComponent(fileName)
                    if let image = UIImage(contentsOfFile: fileURL.path) {
                        if let imageData = image.jpegData(compressionQuality: 0.75) {
                            let tempFile = NSURL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/yourImageName.jpg")
                            do {
                                try imageData.write(to: tempFile!, options: .atomicWrite)
                                self.documentInteractionController = UIDocumentInteractionController(url: tempFile!)
                                self.documentInteractionController.uti = "net.whatsapp.image"
                                self.documentInteractionController.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
                            } catch {
                                print(error)
                            }
                        }
                    }
                } else {
                    // Cannot open whatsapp
                }
            }
        }
    }
    
  
}
extension HomeScreenViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.bannerModel?.first?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.slider_imageView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.image?.contentMode = .scaleAspectFill
        cell.image?.clipsToBounds = true
        cell.slider_collectionView.clipsToBounds = true
        
        cell.image?.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        
        let url = self.bannerModel?.first?.data?[indexPath.row].image ?? ""
        
        let aString = url
        let formattedStringURL = aString.replacingOccurrences(of: " ", with: "%20")
        
        
        cell.image?.sd_setImage(with: URL(string: formattedStringURL))
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //  print(self.bannerModel?.first?.data?[indexPath.row].property_id )
        let proprtyId = self.bannerModel?.first?.data?[indexPath.row].property_id ?? ""
        let a: Int = Int(proprtyId) ?? 0
        if proprtyId == "0" {
            // print("zero")
        }
        else if a  > 0 {
            //  print("one")
        }
        else {
            if let url = URL(string: proprtyId) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: slider_imageView.frame.width , height: slider_imageView.frame.height)
    }
}


extension HomeScreenViewController: FilterDelegate {
    
    
    
    func filterWith(param: [String : Any]) {
        
        self.comeFrom = .filter
        
        self.page = 1
        
        self.param  = param
        
        self.param.updateValue((Singleton.sharedInstance.loginModel?.first?.data?.id ?? ""), forKey: "userid")
        
        self.param.updateValue(String(page), forKey: "page")
        
        self.getProperty_API(false)
        
        // self.filter_API(param: param)
    }
    
}

//MARK: this extension use for change comment color

extension HomeScreenViewController : passValue {
    func send(value: Bool, indexValue:String) {
        if value == true {
           print("protocol pass value")
            print(indexValue)
            let indexPath = IndexPath(row: Int(indexValue) ?? 0, section: 0)
//            let cell = self.list_tableView.dequeueReusableCell(withIdentifier: "HomeScreenTableViewCell") as! HomeScreenTableViewCell
            let cell:HomeScreenTableViewCell = list_tableView.cellForRow(at:indexPath) as! HomeScreenTableViewCell
            cell.comment_btn.setTitleColor(UIColor.purple, for: .normal)
            cell.comment_label.text = "commented"
            cell.comment_label.textColor = .purple
  
        }
    }
    
}

//MARK: exteion for date

extension HomeScreenViewController : PassDate {
    
    func passDate(date: String ,sendDate: String) {
       // print(date)
       // print(sendDate)
        selectMonth.setTitle("\(date)   \("Change Month")", for: .normal)
        
        self.param.updateValue(sendDate, forKey: "search")

        self.sideMenuSearch_Api()
        sideMenuSearchFull_view.isHidden = true
    }
    
    
}

