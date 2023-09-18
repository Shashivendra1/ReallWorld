

import UIKit

import NVActivityIndicatorView

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let storyboardObj = UIStoryboard(name: "Main", bundle: nil)

class Proxy {
    static var shared: Proxy {
        return Proxy()
    }
    fileprivate init(){}
    
     func isValidEmail(email: String) -> Bool {
          let regEx =  "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
                          "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
                          "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
                          "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
                          "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
                          "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
                          "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
          let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
          return pred.evaluate(with: email)
      }
   
      func isValidPassword(testStr:String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: testStr)
         }
         
//MARK:- Display Toast Methos
    func displayStatusCodeAlert(_ message: String) {
        let alert = UIAlertController(title: "Reall World", message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: AppAlerts.titleValue.ok, style: .default, handler: nil)
        alert.addAction(action)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- Display Toast Methos
//    func displayStatusPresentAlert(_ message: String,controller: UIViewController) { title: "Real World", message: message, preferredStyle: UIAlertController.Style.alert)
//        let action = UIAlertAction(title: AppAlerts.titleValue.ok, style: .default, handler: nil)
//        alert.addAction(action)
//        controller.present(alert, animated: true, completion: nil)
//    }
    
  //MARK:- Display Toast Methos
       func showAlertOkMessage(_ message: String,completion:@escaping() -> Void) {
           let alert = UIAlertController(title: "Reall World", message: message, preferredStyle: UIAlertController.Style.alert)
           let actionOk = UIAlertAction(title: AppAlerts.titleValue.ok, style: .default, handler: { (_) in
               completion()
           })
           alert.addAction(actionOk)
           UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
       }
    
    //MARK:- Display Toast Methos
    func showAlertMessage(message: String,completion:@escaping(_ isSuccess:Bool) -> Void) {
        let alert = UIAlertController(title: "Reall World", message: message, preferredStyle: UIAlertController.Style.alert)
        let actionOk = UIAlertAction(title: AppAlerts.titleValue.ok, style: .default, handler: { (_) in
            completion(true)
        })
        let actionCancel = UIAlertAction(title: AppAlerts.titleValue.cancel, style: .default, handler: { (_) in
            completion(false)
        })
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- Get String From Date Method
    func getStringFromDate(date: Date,needFormat: String) -> String {
        var dateStr = String()
        if needFormat != "" {
            let formatter = DateFormatter()
            formatter.dateFormat = needFormat
            let locale = Locale.current
            formatter.locale = locale
            dateStr = formatter.string(from: date)
        }
        return dateStr
    }
    
    //MARK:- Get Date From String Method
    func getDateFromSting(string: String,stringFormat: String) -> Date {
        var date = Date()
        if string != "" {
            let formatter = DateFormatter()
            formatter.dateFormat = stringFormat
            let dateInDate = formatter.date(from: string)
            if dateInDate != nil {
                date = dateInDate!
            }
        }
        return date
    }
    
    //MARK:- UTC To Local Convert Method
    func UTCToLocal(_ UTCDateString: String,needFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale.current
        let UTCDate = dateFormatter.date(from: UTCDateString)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = needFormat
        if UTCDate != nil {
            let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
            return UTCToCurrentFormat
        } else {
            return ""
        }
    }
    
    //MARK:- Get Date And Time In String Method
    func getDateAndTimeInStr(getDate:String,backendFormat:String,needDateFormat:String,needTimeFormat:String) -> (String,String) {
        var resultDateInStr = String(),resultTimeInStr = String()
        if getDate != "" {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = backendFormat//"yyyy-MM-dd hh:mm a"
            let dateInStr = dateFormatter.date(from: getDate)
            
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = needDateFormat//"yyyy-MM-dd"
            if dateInStr != nil {
                resultDateInStr = dateFormatter1.string(from: dateInStr!)
            }
            
            dateFormatter1.dateFormat = needTimeFormat//"hh:mm a"
            let timeInStr = dateFormatter.date(from: getDate)
            if timeInStr != nil {
                resultTimeInStr = dateFormatter1.string(from: timeInStr!)
            }
        }
        return (resultDateInStr,resultTimeInStr)
    }
    
    //MARK:- Get Date In String Method
    func getDateInStr(getDate:String,backendFormat:String,needDateFormat:String) -> String {
        var resultDateInStr = String()
        if getDate != "" {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = backendFormat
            let dateInStr = dateFormatter.date(from: getDate)
            
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = needDateFormat
            if dateInStr != nil {
                resultDateInStr = dateFormatter1.string(from: dateInStr!)
            }
        }
        return resultDateInStr
    }
    
    //MARK:- Get Time In String Method
    func getTimeInStr(getDate:String,backendFormat:String,needTimeFormat:String) -> String {
        var resultTimeInStr = String()
        if getDate != "" {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = backendFormat
            
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = needTimeFormat
            let timeInStr = dateFormatter.date(from: getDate)
            if timeInStr != nil {
                resultTimeInStr = dateFormatter1.string(from: timeInStr!)
            }
        }
        return resultTimeInStr
    }
    
    ///MARK:- Configure Radar Chart Method
//    func configureRadarChartMethod(_ chatDetail: RadarGraph.Request,currentConroller:IAxisValueFormatter) {
//        chatDetail.chartView!.clear()
//        chatDetail.chartView!.noDataText = "You need to provide data for the chart."
//        var dataEntries: [ChartDataEntry] = []
//        for i in 0..<(chatDetail.dataPoints?.count ?? 0) {
//            let dataEntry = ChartDataEntry(x: Double(i), y: Double(chatDetail.values![i]))
//            dataEntries.append(dataEntry)
//        }
//        let chartDataSet = RadarChartDataSet(entries: dataEntries, label: "")
//        chartDataSet.colors = chatDetail.colorsArray!
//        chartDataSet.fillColor = chatDetail.fillColor!
//        chartDataSet.fillAlpha = 0.4
//        chartDataSet.lineWidth = 2
//        chartDataSet.drawFilledEnabled = true
//        chartDataSet.drawValuesEnabled = false
//        
//        let chartData = RadarChartData(dataSet: chartDataSet)
//        chatDetail.chartView?.data = chartData
//        
//        chatDetail.chartView!.rotationEnabled = false
//        chatDetail.chartView!.backgroundColor = chatDetail.chartBackgroundColor!
//        let xAxis = chatDetail.chartView!.xAxis
//        xAxis.labelFont = .systemFont(ofSize: 9, weight: .semibold)
//        xAxis.xOffset = 0
//        xAxis.yOffset = 0
//        xAxis.valueFormatter = currentConroller
//        xAxis.labelTextColor = .white
//        
//        let yAxis = chatDetail.chartView!.yAxis
//        yAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
//        yAxis.labelCount = chatDetail.yAxisLabelCount!
//        yAxis.axisMinimum = chatDetail.yAxisMinimumVal!
//        yAxis.axisMaximum = chatDetail.yAxisMaximumVal!
//        yAxis.drawLabelsEnabled = chatDetail.isdrawYAxisLabel!
//        yAxis.labelTextColor = .white
//        
//        let l = chatDetail.chartView!.legend
//        l.enabled = false
//        chatDetail.chartView!.sizeToFit()
//        if chatDetail.isdynamicHeight! {
//           chatDetail.dynamicHeight!.constant = chatDetail.chartView!.contentRect.height
//        }
//    }
    
    //MARK:- Open Setting Of App
    func openSettingApp() {
        let settingAlert = UIAlertController(title: AppAlerts.titleValue.connectionProblem, message: AppAlerts.titleValue.checkInternet, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: AppAlerts.titleValue.cancel, style: UIAlertAction.Style.default, handler: nil)
        settingAlert.addAction(okAction)
        let openSetting = UIAlertAction(title: AppAlerts.titleValue.setting, style:UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
            let url:URL = URL(string: UIApplication.openSettingsURLString)!
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    (success) in })
            } else {
                guard UIApplication.shared.openURL(url) else {
                    Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.pleaseReviewyournetworksettings)
                    return
                }
            }
        })
        settingAlert.addAction(openSetting)
        UIApplication.shared.keyWindow?.rootViewController?.present(settingAlert, animated: true, completion: nil)
    }
    
}
