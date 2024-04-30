//
//  ArticleModel.swift
//  ArticleApp

import Foundation

struct ArticleSearchResponse: Codable, Hashable {
    let response: Docs?
}

struct Docs: Codable, Hashable {
    let docs: [Article]?
}

struct Article: Codable, Hashable {
    let abstract: String?
//    let webUrl: String?
//    let snippet: String?
//    let leadParagraph: String?
//    let printSection: String?
//    let printPage: String?
    let source: String?
    let multimedia: [Multimedia]?
}

struct Multimedia: Codable, Hashable {
//    let rank: Int?
//    let subtype: String?
//    let caption: String?
//    let credit: String?
//    let type: String?
    let url: String?
}


//MARK: API Response
/*"abstract": "In two races in Maryland and Virginia, candidates are turning political fame into campaigns, and a Pennsylvania race is focused on a congressmanâ€™s role in Trumpâ€™s efforts to overturn his 2020 loss.",
 "web_url": "https://www.nytimes.com/2024/04/11/us/politics/democrats-trump-save-democracy.html",
 "snippet": "In two races in Maryland and Virginia, candidates are turning political fame into campaigns, and a Pennsylvania race is focused on a congressmanâ€™s role in Trumpâ€™s efforts to overturn his 2020 loss.",
 "lead_paragraph": "Harry Dunn, a former Capitol Police officer whose pitched battles with former President Donald J. Trumpâ€™s supporters on and after Jan. 6, 2021, vaulted him to political stardom, was greeted Tuesday evening in Annapolis, Md., like a celebrity.",
 "print_section": "A",
 "print_page": "1",
 "source": "The New York Times",
 "multimedia": [
   {
     "rank": 0,
     "subtype": "xlarge",
     "caption": null,
     "credit": null,
     "type": "image",
     "url": "images/2024/04/10/us/politics/00pol-house-democracy1/00pol-house-democracy1-articleLarge.jpg"*/
