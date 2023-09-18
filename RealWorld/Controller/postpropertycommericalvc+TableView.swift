//
//  postpropertycommericalvc+TableView.swift
//  ReallWorld
//
//  Created by shashivendra sengar on 15/09/22.
//  Copyright © 2022 ArthTech Solutions. All rights reserved.
//

import Foundation
import UIKit
extension postpropertycommericalvc : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return localityArray?.count ?? 0//10
        
        
        if searching {
            return searchedCountry.count
        } else {
            return countryNameArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "CommercialSearchTableViewCell", for: indexPath) as! CommercialSearchTableViewCell
       // cell.labelShowAreaName.text = localityArray?[indexPath.row].localityName
        
        if searching {
             cell.labelShowAreaName.text = searchedCountry[indexPath.row]
        } else {
            cell.labelShowAreaName.text = countryNameArr[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.get(address : countryNameArr[indexPath.row])
        self.countrySearch.text = countryNameArr[indexPath.row]
        self.searchTableHeightConstraint.constant = 0
        cityName = countryNameArr[indexPath.row]
        searchTableView.reloadData()


    }
    
}

extension postpropertycommericalvc: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedCountry = countryNameArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
        switch saleRent {
            
        case .sale:
            if selectCity_textfield.text == "Select City" {
                self.countrySearch.text = ""
                self.presentAlert(msg: "please select your sale City")
                
                searchBar.isUserInteractionEnabled = false
            }
            else {
                searchBar.isUserInteractionEnabled = true
                searching = true
                
                self.searchTableHeightConstraint.constant = 200
                
                searchTableView.reloadData()
                
            }
        case .rent:
            if selectcity1_textfield.text == "Select City" {
                self.countrySearch.text = ""
                self.presentAlert(msg: "please select your rent City")
                
                searchBar.isUserInteractionEnabled = false
            }
            else {
                searchBar.isUserInteractionEnabled = true
                searching = true
                
                self.searchTableHeightConstraint.constant = 200
                
                searchTableView.reloadData()
            }
        }

        
    }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        searchTableView.reloadData()
    }
    
}
