//
//  ViewController.swift
//  Cluno
//
//  Created by Yu Ke on 05.12.18.
//  Copyright © 2018 Yu Ke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //get sandbox path
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        var data = NSData(contentsOfFile: jsonPath)
        //check if the data is empty
        if data == nil
        {
            if let url = NSURL(string: "https://api.staging.cluno.com/offerservice/v1/offer/query")
            {
                data = NSData(contentsOf: url as URL)
            }
        }
        
        //convert json to dictionary
        guard let aData = data as Data?, let dict = try? JSONSerialization.jsonObject(with: aData, options: []) as? [String: Any] else
        {
            print("NO INTERNET CONNECTION")
            return
        }
        
        print(dict)
    }


}

