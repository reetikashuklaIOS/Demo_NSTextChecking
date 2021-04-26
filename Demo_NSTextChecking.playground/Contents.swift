import UIKit

let str =
    "Aaron Wilson Designer and Tutor +8907845678 www.garonmilsonenglish.com 7 Ang Mo Kio Street 64 Singapore, 569086 Singapore"

getData(str)

func getData(_ string : String) {
    let detector = try! NSDataDetector(types: NSTextCheckingAllTypes)
    let range = NSRange(string.startIndex..<string.endIndex, in: string)
    detector.enumerateMatches(in: string,
                              options: [],
                              range: range) { (match, flags, _) in
        guard let match = match else {
            return
        }
        print("match.resultType.rawValue  \(match.resultType.rawValue)")
        switch match.resultType {
        case .date:
            let date = match.date
            let timeZone = match.timeZone
            let duration = match.duration
            print(date as Any, timeZone as Any, duration)
        case .address:
            if let components = match.components {
                let name = components[.name]
                let jobTitle = components[.jobTitle]
                let organization = components[.organization]
                let street = components[.street]
                let locality = components[.city]
                let region = components[.state]
                let postalCode = components[.zip]
                let country = components[.country]
                let phoneNumber = components[.phone]
                print(name as Any, jobTitle as Any, organization as Any, street as Any, locality as Any, region as Any, postalCode as Any, country as Any, phoneNumber as Any)
            }
        case .link:
            let url = match.url
            print(url as Any)
        case .phoneNumber:
            let phoneNumber = match.phoneNumber
            print(phoneNumber as Any)
        case .transitInformation:
            if let components = match.components {
                let airline = components[.airline]
                let flight = components[.flight]
                print(airline as Any, flight as Any)
            }
        default:
            return
        }
    }
}
