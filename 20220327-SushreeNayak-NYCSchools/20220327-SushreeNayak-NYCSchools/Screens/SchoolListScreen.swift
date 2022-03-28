//
//  ViewController.swift
//  20220327-SushreeNayak-NYCSchools
//
//  Created by SUSHREE SANGITA NAYAK on 3/27/22.
//

import UIKit

/* School List Screen */

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var schoolNames : [SchoolDetail] = []
    var schoolDetails : [SATDetail] = []
    var selectedSchoolDetail : SATDetail!
    var selectedSchool : SchoolDetail!
    
    
    
    
    
    /*Table View Implementation Started*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return schoolNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSchoolTableCellTableViewCell", for: indexPath) as! CustomSchoolTableCellTableViewCell
        
        cell.schoolNameLbl.text=schoolNames[indexPath.row].school_name
        cell.backgroundColor=hexStringToUIColor(hex: "#95C4FF")
        
        return cell;
            }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schoolNameClicked=schoolNames[indexPath.row].school_name
         var schoolDetailsFound : Bool = false
            for schooldetail in schoolDetails{
                if(schooldetail.school_name.uppercased() == schoolNameClicked.uppercased()){
                    
                    selectedSchoolDetail=schooldetail
                    
                    selectedSchool=schoolNames[indexPath.row]
                    schoolDetailsFound = true
                   performSegue(withIdentifier:"goToSchoolDetailSegue", sender: self)
                 }
        }
        
        if(!schoolDetailsFound){
            let alert = UIAlertController(title: "School Details", message: "SAT Details Not Available for this  School", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                @unknown default: break
                    
                }}))
            self.present(alert, animated: true, completion: nil)
        }

    }
 @IBOutlet weak var schoolTable: UITableView!
 /*Table View Implementation Ended*/

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolTable.delegate=self
        schoolTable.dataSource=self
        schoolTable.register(UINib(nibName:"CustomSchoolTableCellTableViewCell", bundle: nil) , forCellReuseIdentifier: "CustomSchoolTableCellTableViewCell");
        
        schoolNames = loadSchoolNames(filename: "schoolInfo")!
        print(schoolNames[0].school_name)
        
        schoolDetails = loadSchoolDetails(filename: "SATResult")!
        print(schoolDetails[0].school_name)
        self.title="School List"
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom:0, right: 0)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
 /*For loading the School List  for schools.*/
    func loadSchoolNames(filename fileName: String) -> [SchoolDetail]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([SchoolDetail].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    /*For loading the SAT Details for schools.*/
    func loadSchoolDetails(filename fileName: String) -> [SATDetail]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([SATDetail].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToSchoolDetailSegue"){
            let destinationVC=segue.destination as! SchoolDetailViewController
            destinationVC.satMaths=selectedSchoolDetail.sat_math_avg_score
            destinationVC.satReading=selectedSchoolDetail.sat_critical_reading_avg_score
            destinationVC.satWriting=selectedSchoolDetail.sat_writing_avg_score
            destinationVC.schoolName=selectedSchoolDetail.school_name
            destinationVC.website=selectedSchool.website
            destinationVC.address=selectedSchool.primary_address_line_1 + selectedSchool.state_code + selectedSchool.zip


        }
    }
    
    
     /*For converting the hex code to color */
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}












