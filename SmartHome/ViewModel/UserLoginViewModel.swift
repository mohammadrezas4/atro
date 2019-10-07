import Foundation
import UIKit

protocol GetDataFromUserLoginController {
    func getLoginData(username : String, password : String)
}

protocol SendDataToUserLoginController {
    func sendData(ok : Bool)
}

class UserLoginViewModel : GetDataFromUserLoginController {

    var loginParameters : LoginParameters?
    var userLoginView : UserLoginView!
    var delegate : SendDataToUserLoginController?
    
    init(view : UIView) {
        self.userLoginView = UserLoginView(view: view)
    }
    
    func getLoginData(username: String, password: String) {
        loginParameters = LoginParameters(username: username, password: password)
    }
    
    func didTapLoginButton() {
        if chekValidity() {
            ApiRequest.sharedInstance.loginUser(parameters: ["username" : loginParameters!.username, "password" : loginParameters!.password]) { (json, error) in
                if json != nil {
                    self.delegate?.sendData(ok: true)
                }
            }
        }        
    }
    
    func chekValidity() -> Bool {
        if (loginParameters?.username.isEmpty)! {
            //showError(msg: "Username is empty!")
            return false
        } else if (loginParameters?.password.isEmpty)! {
            //showError(msg: "Password is empty")
            return false
        }
        return true
    }
    
}
