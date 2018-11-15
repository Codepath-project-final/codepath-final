import UIKit

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var confirmTextView: UITextView!
    
    var post : [String: Any]? = nil
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let post = post {
            
            let uid = post["user_id"] as! Int
            usernameLabel.text = String(uid)
            descriptionLabel.text = post["post_description"] as! String?
            locationLabel.text = post["location"] as! String?
            phoneNumberLabel.text = post["phone"] as! String?
        }
    }
    
    @IBAction func tapConfirm(_ sender: Any) {
        performSegue(withIdentifier: "BackToMainPage", sender: self)
    }
}
