import Foundation
import RealmSwift

class UserInformation : Object {
    
    @objc dynamic var username : String?
    @objc dynamic var password : String?
    @objc dynamic var name : String?
    @objc dynamic var emailAddress : String?
    @objc dynamic var phoneNumber : String?
    @objc dynamic var emailVerified : String?
    @objc dynamic var phoneVerified : String?
    @objc dynamic var userID : String?
    @objc dynamic var token : String?
    
}
