//
//  NewSocialVC.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class NewSocialVC: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var newEventField: UITextField!
    @IBOutlet weak var eventTimeField: UITextField!
    @IBOutlet weak var eventLocationField: UITextField!
    @IBOutlet weak var eventDescriptionField: UITextView!
    
    @IBOutlet var imageView: UIImageView!
    var imagePicker = UIImagePickerController()
    
    @IBAction func cameraButton(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createEventButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        eventDescriptionField.textColor = .black
        eventDescriptionField.text = "Provide a description of the event"
        eventDescriptionField.layer.borderWidth = 1
        eventDescriptionField.layer.borderColor = UIColor.lightGray.cgColor
        eventDescriptionField.layer.cornerRadius = 3
        eventDescriptionField.textContainer.maximumNumberOfLines = 2
        eventDescriptionField.textContainer.lineBreakMode = .byTruncatingTail
    }
    
    //Following two functions are to give placeholder functinality and do not work
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("1 textViewDidBeginEditing did run")
        if (eventDescriptionField.text == "Provide a description of the event"
            && eventDescriptionField.textColor == .lightGray) {
            eventDescriptionField.text = ""
            eventDescriptionField.textColor = .black
        }
        eventDescriptionField.becomeFirstResponder() //Optional
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        print("2 textViewDidEndEditing did run")
        if (eventDescriptionField.text == "")
        {
            eventDescriptionField.text = "Provide a description of the event"
            eventDescriptionField.textColor = .lightGray
        }
        eventDescriptionField.resignFirstResponder()
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in

        })
        print("Changing Image")
        imageView.image = image
    }
    

}
