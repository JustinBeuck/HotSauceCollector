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
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .camera
        
    }
    @IBAction func addTapped(_ sender: Any) {
    }

}
