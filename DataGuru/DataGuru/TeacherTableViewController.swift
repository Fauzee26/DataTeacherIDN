//
//  TeacherTableViewController.swift
//  DataGuru
//
//  Created by Muhammad Hilmy Fauzi on 10/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class TeacherTableViewController: UITableViewController {

    let TeacherURL = "http://localhost/DataGuruIDN/index.php/api/getDataGuru"
    
    var teacher = [Teacher]()
    
    var nisSelected:String?
    var nameSelected:String?
    var tglSelected:String?
    var asalSelected:String?
    var MapelSelected:String?
    var UmurSelected:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        getTeacher()
        //self sizing cells
        //set row height to 92
        tableView.estimatedRowHeight = 92.0
        //set row table height to automatic dimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teacher.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeacherTableViewCell

        cell.lblNama.text = teacher[indexPath.row].guruNama
        cell.lblPelajaran.text = teacher[indexPath.row].guruMapel

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        let dataTask = teacher[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        nisSelected = dataTask.guruNis
        nameSelected = dataTask.guruNama
        tglSelected = dataTask.guruTglLahir
        asalSelected = dataTask.guruAsal
        MapelSelected = dataTask.guruMapel
        UmurSelected = dataTask.guruUmur
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "segue"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let sendData = segue.destination as! ViewController
            sendData.passName = nameSelected
            sendData.passNis = nisSelected
            sendData.passTgl = tglSelected
            sendData.passAsal = asalSelected
            sendData.passMapel = MapelSelected
            sendData.passUmur = UmurSelected
            
        }
    }
    //MARK : - JSON Parsing
    //create new method with name : getLatestLoans()
    func getTeacher() {
        guard let teacherurl = URL(string: TeacherURL) else {
            return //this return is for back up the value that got when call variable loanURL
        }
        
        //declare request for request URL loanUrl
        let request = URLRequest(url: teacherurl)
        //declare task for take data from variable request above
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            //check what error is available or not
            if let error = error {
                //condition when error
                //print error
                print(error)
                return //back up value error that we get
            }
            //parse JSON data
            //declare variable data to call data
            if let data = data {
                //for this part will call method parseJsonData that we will make in below
                self.teacher = self.parseJsonData(data: data)
                
                //reload tableView
                OperationQueue.main.addOperation({
                    //reload data again
                    self.tableView.reloadData()
                })
            }
        })
        //task will resume to call the json data
        task.resume()
    }
    //create new method with name ParseJsonData
    //this method will parsing data Json
    func parseJsonData(data: Data) -> [Teacher] {
        //declare variable loans as object from loans class
        var teacher = [Teacher]()
        //will repeat to json data that parsed
        do{
            //declare jsonResult for take data from the json
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            
            //parse json data
            //declare jsonLoans for call data array jsonResult with name Loans
            let jsonLoans = jsonResult?["Teacher Data"] as! [AnyObject]
            //will call data be repeated for jsonLoan have data json array from variable jsonLoans
            for jsonLoan in jsonLoans {
                //declare loan as object from class loan
                let TeAcHeR = Teacher()
                //enter the value to each object from class loan
                TeAcHeR.guruNis = jsonLoan["nis_guru"] as! String
                TeAcHeR.guruNama = jsonLoan["nama_guru"] as! String
                TeAcHeR.guruTglLahir = jsonLoan["tgl_lahir"] as! String
                TeAcHeR.guruAsal = jsonLoan["asal_guru"] as! String
                TeAcHeR.guruMapel = jsonLoan["mata_pelajaran"] as! String
                TeAcHeR.guruUmur = jsonLoan["umur"] as! String
                //process enter data to object
                teacher.append(TeAcHeR)
            }
        }catch{
            print(error)
        }
        return teacher
    }
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


