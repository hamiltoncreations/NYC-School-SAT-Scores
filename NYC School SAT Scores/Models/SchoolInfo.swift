//
//  SchoolInfo.swift
//  NYC School SAT Scores
//
//  Created by Matthew Hamilton on 6/13/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import Foundation



/// A generic struct for mapping Schools from https://data.cityofnewyork.us/resource/s3k6-pzi2.json
///
/// Normally this would be typed by hand with a better naming convention, but to save time
///  I used https://app.quicktype.io/ to quickly generate this struct
///
/// I used this as an opportunity to learn Codable, to easily map JSON to Swift objects.
///  However I learned Codable does not handle missing JSON elements very well, and required
///  me to add the lengthy initializer below to support missing values.
///
/// If I were to do this challenge again, I'd consider using other approaches such as the SwiftlyJSON
///  library instead.


class SchoolInfo: Codable {
    let dbn, schoolName, boro, overviewParagraph, school10ThSeats: String?
    let academicopportunities1, academicopportunities2, ellPrograms, neighborhood: String?
    let buildingCode, location, phoneNumber, faxNumber: String?
    let schoolEmail, website, subway, grades2018: String?
    let finalgrades, totalStudents, extracurricularActivities, schoolSports, attendanceRate: String?
    let pctStuEnoughVariety, pctStuSafe, schoolAccessibilityDescription, directions1: String?
    let requirement11, requirement21, requirement31, requirement41: String?
    let requirement51, offerRate1, program1, code1: String?
    let interest1, method1, seats9ge1, grade9gefilledflag1, grade9geapplicants1, seats9swd1: String?
    let grade9swdfilledflag1, grade9swdapplicants1, seats101: String?
    let admissionspriority11, admissionspriority21: String?
    let admissionspriority31, grade9Geapplicantsperseat1, grade9Swdapplicantsperseat1, primaryAddressLine1: String?
    let city, zip, stateCode, latitude, longitude, communityBoard, councilDistrict: String?
    let censusTract, bin, bbl, nta, borough: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"
        case school10ThSeats = "school_10th_seats"
        case academicopportunities1, academicopportunities2
        case ellPrograms = "ell_programs"
        case neighborhood
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website, subway, grades2018, finalgrades
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case pctStuEnoughVariety = "pct_stu_enough_variety"
        case pctStuSafe = "pct_stu_safe"
        case schoolAccessibilityDescription = "school_accessibility_description"
        case directions1
        case requirement11 = "requirement1_1"
        case requirement21 = "requirement2_1"
        case requirement31 = "requirement3_1"
        case requirement41 = "requirement4_1"
        case requirement51 = "requirement5_1"
        case offerRate1 = "offer_rate1"
        case program1, code1, interest1, method1, seats9ge1, grade9gefilledflag1, grade9geapplicants1, seats9swd1, grade9swdfilledflag1, grade9swdapplicants1, seats101, admissionspriority11, admissionspriority21, admissionspriority31
        case grade9Geapplicantsperseat1 = "grade9geapplicantsperseat1"
        case grade9Swdapplicantsperseat1 = "grade9swdapplicantsperseat1"
        case primaryAddressLine1 = "primary_address_line_1"
        case city, zip
        case stateCode = "state_code"
        case latitude, longitude
        case communityBoard = "community_board"
        case councilDistrict = "council_district"
        case censusTract = "census_tract"
        case bin, bbl, nta, borough
    }
    
    required init(from decoder: Decoder) throws {
    
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // These are no optional
        dbn = try values.decode(String.self, forKey: .dbn)
        schoolName = try values.decode(String.self, forKey: .schoolName)
        
        boro = try values.decodeIfPresent(String.self, forKey: .boro)
        overviewParagraph = try values.decodeIfPresent(String.self, forKey: .overviewParagraph)
        school10ThSeats = try values.decodeIfPresent(String.self, forKey: .school10ThSeats)
        academicopportunities1 = try values.decodeIfPresent(String.self, forKey: .academicopportunities1)
        academicopportunities2 = try values.decodeIfPresent(String.self, forKey: .academicopportunities2)
        ellPrograms = try values.decodeIfPresent(String.self, forKey: .ellPrograms)
        neighborhood = try values.decodeIfPresent(String.self, forKey: .neighborhood)
        buildingCode = try values.decodeIfPresent(String.self, forKey: .buildingCode)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        faxNumber = try values.decodeIfPresent(String.self, forKey: .faxNumber)
        schoolEmail = try values.decodeIfPresent(String.self, forKey: .schoolEmail)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        subway = try values.decodeIfPresent(String.self, forKey: .subway)
        grades2018 = try values.decodeIfPresent(String.self, forKey: .grades2018)
        finalgrades = try values.decodeIfPresent(String.self, forKey: .finalgrades)
        totalStudents = try values.decodeIfPresent(String.self, forKey: .totalStudents)
        extracurricularActivities = try values.decodeIfPresent(String.self, forKey: .extracurricularActivities)
        schoolSports = try values.decodeIfPresent(String.self, forKey: .schoolSports)
        attendanceRate = try values.decodeIfPresent(String.self, forKey: .attendanceRate)
        pctStuEnoughVariety = try values.decodeIfPresent(String.self, forKey: .pctStuEnoughVariety)
        pctStuSafe = try values.decodeIfPresent(String.self, forKey: .pctStuSafe)
        schoolAccessibilityDescription = try values.decodeIfPresent(String.self, forKey: .schoolAccessibilityDescription)
        directions1 = try values.decodeIfPresent(String.self, forKey: .directions1)
        requirement11 = try values.decodeIfPresent(String.self, forKey: .requirement11)
        requirement21 = try values.decodeIfPresent(String.self, forKey: .requirement21)
        requirement31 = try values.decodeIfPresent(String.self, forKey: .requirement31)
        requirement41 = try values.decodeIfPresent(String.self, forKey: .requirement41)
        requirement51 = try values.decodeIfPresent(String.self, forKey: .requirement51)
        offerRate1 = try values.decodeIfPresent(String.self, forKey: .offerRate1)
        program1 = try values.decodeIfPresent(String.self, forKey: .program1)
        code1 = try values.decodeIfPresent(String.self, forKey: .code1)
        interest1 = try values.decodeIfPresent(String.self, forKey: .interest1)
        method1 = try values.decodeIfPresent(String.self, forKey: .method1)
        seats9ge1 = try values.decodeIfPresent(String.self, forKey: .seats9ge1)
        grade9gefilledflag1 = try values.decodeIfPresent(String.self, forKey: .grade9gefilledflag1)
        grade9geapplicants1 = try values.decodeIfPresent(String.self, forKey: .grade9geapplicants1)
        seats9swd1 = try values.decodeIfPresent(String.self, forKey: .seats9swd1)
        grade9swdfilledflag1 = try values.decodeIfPresent(String.self, forKey: .grade9swdfilledflag1)
        grade9swdapplicants1 = try values.decodeIfPresent(String.self, forKey: .grade9swdapplicants1)
        seats101 = try values.decodeIfPresent(String.self, forKey: .seats101)
        admissionspriority11 = try values.decodeIfPresent(String.self, forKey: .admissionspriority11)
        admissionspriority21 = try values.decodeIfPresent(String.self, forKey: .admissionspriority21)
        admissionspriority31 = try values.decodeIfPresent(String.self, forKey: .admissionspriority31)
        grade9Geapplicantsperseat1 = try values.decodeIfPresent(String.self, forKey: .grade9Geapplicantsperseat1)
        grade9Swdapplicantsperseat1 = try values.decodeIfPresent(String.self, forKey: .grade9Swdapplicantsperseat1)
        primaryAddressLine1 = try values.decodeIfPresent(String.self, forKey: .primaryAddressLine1)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zip = try values.decodeIfPresent(String.self, forKey: .zip)
        stateCode = try values.decodeIfPresent(String.self, forKey: .stateCode)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        communityBoard = try values.decodeIfPresent(String.self, forKey: .communityBoard)
        councilDistrict = try values.decodeIfPresent(String.self, forKey: .councilDistrict)
        censusTract = try values.decodeIfPresent(String.self, forKey: .censusTract)
        bin = try values.decodeIfPresent(String.self, forKey: .bin)
        bbl = try values.decodeIfPresent(String.self, forKey: .bbl)
        nta = try values.decodeIfPresent(String.self, forKey: .nta)
        borough = try values.decodeIfPresent(String.self, forKey: .borough)
    }
}
