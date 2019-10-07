import Foundation

enum apiURLs : Int, CustomStringConvertible {
    case baseAddress
    case user
    case login
    case register
    case profile
    case edit
    case changePassword
    case verEmail
    case verEmailCode
    case verPhone
    case verPhoneCode
    
    var description: String {
        switch self {
        case .baseAddress:
            return "https://api.atropate.com"
        case .user:
            return "https://api.atropate.com/user"
        case .login:
            return "https://api.atropate.com/user/login"
        case .register:
            return "https://api.atropate.com/user/register"
        case .profile:
            return "https://api.atropate.com/user/profile"
        case .edit:
            return "https://api.atropate.com/user/edit"
        case .changePassword:
            return "https://api.atropate.com/user/changepassword"
        case .verEmail:
            return "https://api.atropate.com/user/veremail"
        case .verEmailCode:
            return "https://api.atropate.com/user/veremailcode"
        case .verPhone:
            return "https://api.atropate.com/user/verphone"
        case .verPhoneCode:
            return "https://api.atropate.com/user/verphonecode"
        }
    }
}
