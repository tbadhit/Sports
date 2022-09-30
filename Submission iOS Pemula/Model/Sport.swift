//
//  Sport.swift
//  Submission iOS Pemula
//
//  Created by Tubagus Adhitya Permana on 18/08/22.
//

struct SportsData: Decodable {
    let sports: [Sport]
}

struct Sport: Decodable {
    let title: String
    let format: String
    let thumbnail: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "strSport"
        case format = "strFormat"
        case thumbnail = "strSportThumb"
        case description = "strSportDescription"
    }
}
