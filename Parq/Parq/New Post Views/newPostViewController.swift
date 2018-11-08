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
    @IBOutlet weak var postDescripionLabel: UITextField!
    @IBOutlet weak var postLocationLabel: UITextField!
    @IBOutlet weak var postPriceLabel: UITextField!
    
    let picker = UIImagePickerController()
    


override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
}

func upload() {
    
    let imageData = UIImageJPEGRepresentation(postImage.image!, 0.1)
    let newDate = Date()
    
    Alamofire.upload(multipartFormData: { (multipartFormData) in
        multipartFormData.append(imageData!, withName: "imageName", fileName: "\(newDate).png", mimeType: "image/png")
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            self.myImage.image = image
            dismiss(animated:true, completion: nil)
            
        }
        
        let  imag = info[UIImagePickerController.InfoKey.referenceURL] as! NSURL
        imageURL = imag.absoluteString!
        
        self.upload()
    }
    
    
    }
    
    
    
    @IBAction func shareButton(_ sender: Any) {
        
        
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        self.present(picker, animated: true, completion: nil)
    }
    
    
    
    @IBAction func shareButtonPress(_ sender: Any) {
    }
    
    
    @IBAction func cancelButtonPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


