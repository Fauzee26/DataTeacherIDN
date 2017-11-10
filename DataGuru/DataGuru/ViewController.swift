//
//  ViewController.swift
//  DataGuru
//
//  Created by Muhammad Hilmy Fauzi on 10/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelNis: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTgl: UILabel!
    @IBOutlet weak var labelAsal: UILabel!
    @IBOutlet weak var labelMapel: UILabel!
    @IBOutlet weak var labelUmur: UILabel!

    
    var passNis:String?
    var passName:String?
    var passTgl:String?
    var passAsal:String?
    var passMapel:String?
    var passUmur:String?
    
    override func viewDidLoad() {
        
        labelNis.text = "NIS: " + passNis!
        labelName.text = "Name: " + passName!
        labelTgl.text = "Birth: " + passTgl!
        labelAsal.text = "Asal: " + passAsal!
        labelMapel.text = "Mapel: " + passMapel!
        labelUmur.text = "Umur: " + passUmur! + " Tahun"
        
        
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

