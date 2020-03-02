//
//  NewSocialVC.swift
//  mdb-socials
//
//  Created by James Jung on 2/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class NewSocialVC: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var event: EventManager!
    var eventImage: UIImage!
    @IBOutlet weak var newEventField: UITextField!
    @IBOutlet weak var eventTimeField: UITextField!
    @IBOutlet weak var eventLocationField: UITextField!
    @IBOutlet weak var eventDescriptionField: UITextView!
    
    @IBOutlet weak var imageButton: UIButton!
    
    @IBAction func cameraButton(_ sender: Any) {
       showAlert()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createEventButton(_ sender: Any) {
        event = EventManager()
        let eventName = newEventField.text
        let eventTime = eventTimeField.text
        let eventLocation = eventLocationField.text
        let eventDescription = eventDescriptionField.text

        
        guard eventName! != "" && eventTime! != "" && eventLocation! != "" &&
            eventDescription! != "" && eventImage != nil else {
            displayErrorCreatingEvent(title: "Error Creating Event", message: "Please fill in all fields")
            return
        }

        event.createNewEvent(creator: UserDefaults.standard.string(forKey: "name")!, date: eventTime!, description: eventDescription!, image: eventImage!, location: eventLocation!, eventName: eventName!)
        self.dismiss(animated: true, completion: nil)
        
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
        if (eventDescriptionField.text == "Provide a description of the event"
            && eventDescriptionField.textColor == .lightGray) {
            eventDescriptionField.text = ""
            eventDescriptionField.textColor = .black
        }
        eventDescriptionField.becomeFirstResponder() //Optional
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if (eventDescriptionField.text == "")
        {
            eventDescriptionField.text = "Provide a description of the event"
            eventDescriptionField.textColor = .lightGray
        }
        eventDescriptionField.resignFirstResponder()
        
    }
    
    
    func showAlert() {

        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //get image from source type
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {

        //Check is source type available
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {

            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage
        
        
        if let possibleImage = info[.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[.originalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }

        // set the image on the screen and dismiss the imagePicker
        imageButton.setImage(newImage, for: .normal)
        eventImage = newImage
        dismiss(animated: true)
    }
    
    func displayErrorCreatingEvent(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
