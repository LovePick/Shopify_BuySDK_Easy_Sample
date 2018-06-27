//
//  ViewController.swift
//  TestUseBuySDK
//
//  Created by DW02 on 20/6/2561 BE.
//  Copyright © 2561 DW02. All rights reserved.
//

import UIKit
import MobileBuySDK



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        self.queryShop()
    }
   
    
    func queryShop(){
        //Create query
        let query = Storefront.buildQuery { $0
            .shop { $0
                .name()
            }
        }
        
       
        
        
        //authentication client
        let client = Graph.Client(
            shopDomain: "graphql.myshopify.com",
            apiKey:     "8e2fef6daed4b93cf4e731f580799dd1"
        )
        client.cachePolicy = .cacheFirst(expireIn: 3600)
        
        
        
        //creare task
        let task = client.queryGraphWith(query) { (response, error) in
            
            if let response = response{
                let name = response.shop.name
                print(name)
            } else {
                print("Query failed: \(error)")
            }
        }
        
        task.resume()
    }

}

