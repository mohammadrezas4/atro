import Foundation
import UIKit

class MainPageView {
    
    var mView : UIView!
    var stack : UIStackView!
    
    init(view : UIView) {
        self.mView = view
    }
    
    let viewProfileButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setCornerRadius(radius: 24)
        btn.setTitle("View Profile", for: .normal)
        btn.backgroundColor = .link
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let viewRoomSwitchesButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setCornerRadius(radius: 24)
        btn.setTitle("View Rooms", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        stack = UIStackView(arrangedSubviews: [viewProfileButton, viewRoomSwitchesButton])
        stack.setCustomSpacing(20, after: viewProfileButton)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .gray
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        mView.addSubview(stack)
        stack.centerYAnchor.constraint(equalTo: mView.safeAreaLayoutGuide.centerYAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: mView.leadingAnchor, constant: 20).isActive = true
        stack.trailingAnchor.constraint(equalTo: mView.trailingAnchor, constant: -20).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
    }
}
