//
//  HotSauceViewController.swift
//  HotSauceCollector
//
//  Created by JUSTIN MICHAEL BEUCK on 3/17/17.
//  Copyright © 2017 JustinCo. All rights reserved.
//

import UIKit

class HotSauceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var hotSauceImageView: UIImageView!
    @IBOutlet var scovilleLevel: UITextField!
    @IBOutlet var addupdatebutton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    var hotSauce : HotSauce? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        if hotSauce != nil {
            hotSauceImageView.image = UIImage(data: hotSauce!.image as! Data)
            titleTextField.text = hotSauce!.name
            scovilleLevel.text = String(hotSauce!.scovilleLevel)
            
            addupdatebutton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }
    }
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        hotSauceImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .camera
        
    }
    @IBAction func addTapped(_ sender: Any) {
        
        if hotSauce != nil {
            hotSauce!.name = titleTextField.text
            // hotSauce!.scovilleLevel = scovilleLevel!
            
            hotSauce!.image = UIImagePNGRepresentation(hotSauceImageView.image!) as NSData?
            
        } else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let hotSauce = HotSauce(context: context)
            let scovilleNumber = Int64(scovilleLevel.text!)
            
            hotSauce.name = titleTextField.text
            hotSauce.scovilleLevel = scovilleNumber!
            
            hotSauce.image = UIImagePNGRepresentation(hotSauceImageView.image!) as NSData?
        }
        
        
     
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

       navigationController!.popViewController(animated: true)
        
        
    }

}
