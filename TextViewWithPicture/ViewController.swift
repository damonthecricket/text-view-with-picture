//
//  ViewController.swift
//  TextViewWithPicture
//
//  Created by Damon Cricket on 10.02.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func addBarButtonTap(sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            dismiss(animated: true)
            var attributedString: NSMutableAttributedString!
            attributedString = NSMutableAttributedString(attributedString: textView!.attributedText)
            let textAttachment = NSTextAttachment()
            textAttachment.image = pickedImage
            let oldWidth = textAttachment.image!.size.width
            let scaleFactor = oldWidth / (textView!.frame.size.width - 10)
            textAttachment.image = UIImage(cgImage: textAttachment.image!.cgImage!, scale: scaleFactor, orientation: .up)
            let attrStringWithImage = NSAttributedString(attachment: textAttachment)
            attributedString.append(attrStringWithImage)
            textView?.attributedText = attributedString
        }
    }
}

