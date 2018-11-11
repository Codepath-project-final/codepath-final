//
//  newPostViewController.swift
//  Parq
//
//  Created by Jangey Lu on 11/5/18.
//  Copyright © 2018 CodePath. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class newPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var postDescriptionLabel: UITextField!
    
    @IBOutlet weak var postLocationLabel: UITextField!
    @IBOutlet weak var postPriceLabel: UITextField!
    
    let picker = UIImagePickerController()
    


override func viewDidLoad() {
    super.viewDidLoad()
    picker.delegate = self
    picker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
    
    // Do any additional setup after loading the view.
}

func upload() {
    
    let imageData = postImage.image!.pngData()
    let newDate = Date()
    
    let user_id = String(LoginViewController.userID)
    
    let parameters = ["description": postDescriptionLabel.text!, "location" : postLocationLabel.text!, "price" : postPriceLabel.text!,
                      "user_id": user_id] as! [String: String]
    
    Alamofire.upload(multipartFormData: { (multipartFormData) in
        

        for (key,value) in parameters {
            multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
        }
        
        multipartFormData.append(imageData!, withName: "image", fileName: "\(newDate).png", mimeType: "image/png")
    }, to: "https://parkistan.herokuapp.com/upload")
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            self.postImage.image = image
            dismiss(animated:true, completion: nil)
            
        }
        
    }
    
    
    
    
    
    @IBAction func photoPicker(_ sender: Any) {
        

        self.present(picker, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func post(_ sender: Any) {
        
        self.upload()

        
    }
    
    
  
    
    
    @IBAction func cancelButtonPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


