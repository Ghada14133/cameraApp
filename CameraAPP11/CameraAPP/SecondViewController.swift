//
//  SecondViewController.swift
//  CameraAPP
//
//  Created by Um Talal 2030 on 03/12/2021.
//

import UIKit

class SecondViewController: UIViewController {
    var receivedName = ""
    let myButton = UIButton()
    let mylable = UILabel()
    let myImag = UIImageView()
    

    
    override var prefersStatusBarHidden: Bool{
        true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .orange
        
        print(receivedName)
        bgImagey()
       
        view.addSubview(mylable)
        mylable.frame = CGRect(x:10, y: 120, width: 350, height: 59)
        mylable.text = "              "
        mylable.font = UIFont.systemFont(ofSize: 30)
        mylable.textAlignment = .center
        mylable.textColor = .orange
        mylable.text = receivedName
        
        view.addSubview(myButton)
        myButton.setTitle("Take a Picture", for: .normal)
        myButton.frame = CGRect(x:100, y: 600, width: 200, height: 60)
        myButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = .lightGray
        myButton.layer.cornerRadius = 20
        myButton.clipsToBounds = true
        myButton.addTarget(self, action: #selector (foo), for: .touchDown)
       
       
        myImag.frame = CGRect(x: 50, y: 100, width: 50, height: 100)
        myImag.image = UIImage(named: "not yet")
        myImag.contentMode = .scaleToFill
        myImag.layer.cornerRadius = 10
        myImag.clipsToBounds = true
        view.addSubview(myImag)
       
    }
    private let backgroundImage : UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "image_2")
        return background
    }()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        myImag.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func bgImagey(){
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           
    }

    @objc func foo(){
        
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.delegate = self
        present(camera, animated: true)
        
    }

}

extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func ImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)

        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        myImag.image = image
    }
}




