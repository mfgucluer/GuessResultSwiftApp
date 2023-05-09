//
//  ViewController.swift
//  GuessResult
//
//  Created by Mustafa Fatih on 3/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userText: UITextField!
    var userName = ""
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(go))
        imageView.addGestureRecognizer(gesture)
    }

    
    @objc func go()
    {
        userName = userText.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {

        if segue.identifier == "toSecondVC" {
            let destination = segue.destination as! SecondVc
            destination.nameL = userName
        }
        
        
    }
    
}
