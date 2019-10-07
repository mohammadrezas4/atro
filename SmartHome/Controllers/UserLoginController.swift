import UIKit

class UserLoginController: UIViewController {
    
    var userLoginView : UserLoginView!
    var userLoginViewModel : UserLoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        userLoginView = UserLoginView(view: self.view)
        userLoginView.setupViews()
        userLoginViewModel = UserLoginViewModel(view: self.view)
        userLoginViewModel.delegate = self
        setListenerToViews()
    }

    func setListenerToViews() {
        userLoginView.loginButton.addTarget(self, action: #selector(loginButtonListener), for: .touchUpInside)
    }
    
    @objc func loginButtonListener(){
        userLoginViewModel.getLoginData(username: userLoginView.usernameTf.text ?? "empty", password: userLoginView.passwordTf.text ?? "empty")
        userLoginViewModel.didTapLoginButton()
    }
    
}

extension UserLoginController : SendDataToUserLoginController {
    func sendData(ok: Bool) {
        if ok {
            let mainPage = MainPageController()
            mainPage.modalPresentationStyle = .fullScreen
            present(mainPage, animated: true, completion: nil)
        }
    }
}
