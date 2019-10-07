
import Foundation
import SwiftyJSON

class ApiRequest {
    
    class var sharedInstance: ApiRequest {
        struct Singleton {
            static let instance: ApiRequest = ApiRequest()
        }
        return Singleton.instance
    }

    let realmManager = RealmManager()
    var defaults = UserDefaults.standard
    let client = NetworkingClient()

    typealias profileInfoResponse = (ProfileInfo?, Error?) -> Void
    typealias infoResponse = (JSON?, Error?) -> Void

    public func loginUser() {
        let realmObject = realmManager.getObjects(type: UserInformation.self)
        let username = realmObject![0]["username"] as! String
        let password = realmObject![0]["password"] as! String
        let userdata = ["username" : username, "password" : password]
        print(userdata)
        client.executePOSTrequest(apiURLs.login.description, userdata) { (arrayData, error) in
            if error != nil {
                print("loginError --- \(error!.localizedDescription)")
            } else if let arrayData = arrayData {
                let json = JSON(arrayData)
                let userInfo = UserInformation()
                userInfo.username = username as String
                userInfo.password = password as String
                userInfo.token = json[0]["response"]["token"].rawString()!
                print("loginJson --- \(json)")
            }
        }
    }
    
    public func loginUser(parameters : [String : String], complition : @escaping infoResponse) {
        client.executePOSTrequest(apiURLs.login.description, parameters) { (arrayData, error) in
            if error != nil {
                print("loginError --- \(error!.localizedDescription)")
                complition(nil, error)
            } else if let arrayData = arrayData {
                let json = JSON(arrayData)
                complition(json, nil)
                
                let userInfo = UserInformation()
                userInfo.username = parameters["username"]!
                userInfo.password = parameters["password"]!
                userInfo.token = json[0]["response"]["token"].rawString()!
                self.realmManager.addObject(objc: userInfo)
                print("loginJson --- \(json)")
            }
        }
    }

//    public func getUserProfile(complition : @escaping profileInfoResponse){
//        let token = defaults.object(forKey: defaultsKeys.token) as! String
//        client.executeGETrequest(apiURLs.profile.description, headers: ["Authorization" : token]) { (arrayData, error) in
//            if error != nil {
//                complition(nil, error)
//            } else if let arrayData = arrayData {
//                let json = JSON(arrayData)
//                let profileInfo = ProfileInfo(username: json[0]["response"]["username"].rawString()!, name: json[0]["response"]["name"].rawString()!, email: json[0]["response"]["email"].rawString()!, phone: json[0]["response"]["phone"].rawString()!, emailVer: json[0]["response"]["emailVer"].rawString()!, phoneVer: json[0]["response"]["phoneVer"].rawString()!, userId: json[0]["response"]["userId"].rawString()!)
//                complition(profileInfo, nil)
//            }
//        }
//    }
//
//    public func registerUser(parameters : [String : String], complition : @escaping infoResponse) {
//        client.executePOSTrequest(apiURLs.register.description, parameters) { (arrayData, error) in
//            if error != nil {
//                print(error?.localizedDescription as Any)
//            } else if let arrayData = arrayData {
//                let json = JSON(arrayData)
//                complition(json, error)
//                self.defaults.set(parameters["username"], forKey: defaultsKeys.username)
//                self.defaults.set(parameters["password"], forKey: defaultsKeys.password)
//            }
//        }
//    }
//
//    public func verifyPhoneRequest(){
//        let token = defaults.object(forKey: defaultsKeys.token) as! String
//        client.executePOSTrequest(apiURLs.verPhone.description, headers: ["Authorization" : token]) { (arrayData, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else if let arrayData = arrayData {
//                let json = JSON(arrayData)
//                print(json)
//            }
//        }
//    }
//
//    public func verifyEmailRequest(){
//        let token = defaults.object(forKey: defaultsKeys.token) as! String
//        client.executePOSTrequest(apiURLs.verEmail.description, headers: ["Authorization" : token]) { (arrayData, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else if let arrayData = arrayData {
//                let json = JSON(arrayData)
//                print(json)
//            }
//        }
//    }
//
//    public func verifyEmailCodeRequest(code : String){
//        let token = defaults.object(forKey: defaultsKeys.token) as! String
//        client.executePOSTrequest(apiURLs.verEmailCode.description,["code" : code], headers: ["Authorization" : token]) { (arrayData, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else if let arrayData = arrayData {
//                let json = JSON(arrayData)
//                print(json)
//            }
//        }
//    }
//
//    public func verifyPhoneCodeRequest(code : String, complition : @escaping infoResponse) {
//        let token = defaults.object(forKey: defaultsKeys.token) as! String
//        client.executePOSTrequest(apiURLs.verPhoneCode.description, ["code" : code], headers: ["Authorization" : token]) { (arrayData, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else if let arrayData = arrayData {
//                let json = JSON(arrayData)
//                print(json)
//                complition(json, error)
//            }
//        }
//    }

}
