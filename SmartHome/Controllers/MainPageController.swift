import UIKit

class MainPageController: UIViewController {
    
    var mainPageView : MainPageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mainPageView = MainPageView(view: self.view)
        mainPageView.setupViews()
    }

}
