//
//  SchoolDetail.swift
//  20220327-SushreeNayak-NYCSchools
//
//  Created by SUSHREE SANGITA NAYAK on 3/27/22.
//




/*Model For storing School list along with other details.*/
struct SchoolDetail : Decodable {
   let school_name : String
   let city : String
   let code1 : String
   let website : String
   let primary_address_line_1 : String
   let state_code : String
   let zip : String
}
