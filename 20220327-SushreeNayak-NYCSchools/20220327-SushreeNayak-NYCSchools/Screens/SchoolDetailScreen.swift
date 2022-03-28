//
//  SchoolDetailViewController.swift
//  20180913-SushreeSangitaNayak-NYCSchools
//
//  Created by Sangita on 9/15/18.
//  Copyright © 2018 Sangita. All rights reserved.
//

import UIKit


/* School Details Screen */
class SchoolDetailViewController: UIViewController {
    
    @IBOutlet weak var SATMathsLbl: UILabel!
    @IBOutlet weak var SATReadingLbl: UILabel!
    @IBOutlet weak var SATWritingLbl: UILabel!
    @IBOutlet weak var schoolNameLbl: UILabel!
    @IBOutlet weak var SATMathsValue: UILabel!
    @IBOutlet weak var SATReadingValue: UILabel!
    @IBOutlet weak var SATWritingValue: UILabel!
    @IBOutlet weak var schoolNameValue: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var webVal: UILabel!
    
   // @IBOutlet weak var websiteVal: UILabel!
    
    
    @IBOutlet weak var addressValue: UILabel!
    
    
    var schoolName : String?
    var satMaths : String?
    var satReading : String?
    var satWriting : String?
    var address : String?
    var website : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SATMathsValue.text=satMaths
        SATReadingValue.text=satReading
        SATWritingValue.text=satWriting
        schoolNameValue.text=schoolName
        addressValue.text=address
         webVal.text=website
        
       
        self.title="School Details"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
