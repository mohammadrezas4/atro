import Foundation

struct LoginParameters {
    var username : String
    var password : String
}

struct LoginReturnData {
    var status : String
    var error : String
    var message : String
    var token : String
}

struct ProfileInfo {
    var username : String
    var name : String
    var email : String
    var phone : String
    var emailVer : String
    var phoneVer : String
    var userId : String
}

struct RegisterUser {
    var username : String
    var password : String
    var name : String
    var email : String
    var phone : String
}
