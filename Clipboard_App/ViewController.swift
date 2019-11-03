//
//  ViewController.swift
//  Clipboard_App
//
//  Created by vijaygenius123 on 03/11/19.
//  Copyright © 2019 vijaygenius123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let DATA_KEY = "Clipboard_App_Data_Key"
    @IBOutlet weak var textView: UITextView!
    var pastedStrings:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA_KEY){
            pastedStrings.append(contentsOf: loadedStrings)
        }
        showText();
       //textView.text = "Hello World"
    }
    
    func addText(){
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text) else
        {
            return
        }
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        showText();
    }
    
    func showText(){
        textView.text = ""
        for str in pastedStrings{
            textView.text.append("\(str)\n\n")
        }
    }

    @IBAction func trashButton(_ sender: Any) {
        
        //textView.text = "Button Was Pressed"
        textView.text = ""
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
}

