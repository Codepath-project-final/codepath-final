import UIKit
import Alamofire

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
        
        let id = post?["post_id"] as! Int
        deletePost(id)
        performSegue(withIdentifier: "BackToMainPage", sender: self)
    }
    
    func deletePost(_ id: Int) {
        
        
        
       
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
               /*multipartFormData.append((id as! String).data(using: .utf8)!, withName: "user_id")
 */
            
        }, to: "https://parkistan.herokuapp.com/delete/\(id)" )
        { (result) in
            switch result {
            case .success(let upload, _,_ ):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    //self.delegate?.showSuccessAlert()
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    //                        self.showSuccesAlert()
                    //self.removeImage(“frame”, fileExtension: “txt”)
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                    
                }
               
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                print(encodingError)
                
            }
        }
    }
}
