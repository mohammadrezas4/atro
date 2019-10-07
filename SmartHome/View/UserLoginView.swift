import Foundation
import UIKit

class UserLoginView {
    
    var view : UIView!
    
    init(view : UIView) {
        self.view = view
        view.backgroundColor = .white
    }
    
    let companyLb : UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.text = "Atropates elec."
        lb.font = .boldSystemFont(ofSize: 24)
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let usernameTf : LeftPaddedTextField = {
        let tf = LeftPaddedTextField()
        tf.placeholder = "Username"
        tf.backgroundColor = .textFieldBC
        tf.setCornerRadius(radius: 24)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTf : LeftPaddedTextField = {
        let tf = LeftPaddedTextField()
        tf.placeholder = "Password"
        tf.backgroundColor = .textFieldBC
        tf.setCornerRadius(radius: 24)
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var loginButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.backgroundColor = .link
        btn.setCornerRadius(radius: 24)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let signupButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.backgroundColor = .systemGreen
        btn.setCornerRadius(radius: 24)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        view.addSubview(companyLb)
        companyLb.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        companyLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        companyLb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(usernameTf)
        usernameTf.topAnchor.constraint(equalTo: companyLb.bottomAnchor, constant: 50).isActive = true
        usernameTf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        usernameTf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        usernameTf.heightAnchor.constraint(equalToConstant: 50).isActive = true
                
        view.addSubview(passwordTf)
        passwordTf.topAnchor.constraint(equalTo: usernameTf.bottomAnchor, constant: 20).isActive = true
        passwordTf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: passwordTf.bottomAnchor, constant: 20).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(signupButton)
        signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
