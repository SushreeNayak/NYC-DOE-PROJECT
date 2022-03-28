//
//  SATDetail.swift
//  20220327-SushreeNayak-NYCSchools
//
//  Created by SUSHREE SANGITA NAYAK on 3/27/22.
//




/*Model For storing SAT Details.*/
struct SATDetail : Decodable {
    let dbn :String
    let num_of_sat_test_takers : String
    let sat_critical_reading_avg_score : String
    let sat_math_avg_score: String
    let sat_writing_avg_score : String
    let school_name : String
}
