//
//  TableViewController.swift
//  tableview
//
//  Created by Артём Сальников on 14.05.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    //let array = [1, 2, 3, 4, 5]
    
   // var arrayNames = ["Рэйчел","Моника","Фиби","Джо","Чендлер","Росс"]
    //var arraySurnames = ["Грин","Геллер","Буффе","Триббиани","Бинг","Геллер"]
    //var arrayImage = ["rachel", "monica", "phoebe", "joe","chandler", "rosse"]

    var  arrayPersons = [Person(name: "Рэйчел", surname: "Грин" , imagename: "rachel", desc: "Рэйчел - сыгранная актрисой Дженнифер Энистон это избалованная девушка, выросшая в состоятельной семье и имеющая слабое пресдатвление о реальной жизни. Ее история в сериале начинается с побега с собственной свадьбы."),
                         Person(name: "Моника", surname: "Геллер" , imagename: "monica", desc: "Моника - сыгранная Кортни Кокс, младшая сестра Росса. В детстве часто комплисовала из-за того что была пухляшкой, но со временем она похудела и стала шей-поваром. В будущем поженилась на Чендлере"),
                         Person(name: "Фиби", surname: "Буффе" , imagename: "phoebe", desc: "Фиби - сыгранная Лизой Кудроу, в сериале работает массажисткой и играет на гитаре. Поет довольно странные песенки собственного сочинения. В начале сериала живет с бабушкой."),
                         Person(name: "Джо", surname: "Триббиани" , imagename: "joe",desc: "Джо - сыгранный актером Мэттом Лебланом, изображен как стереотипный актер, беден,наивен, малообразован, да к тому является  точно таким же извращенцем как и создатель этой программы"),
                         Person(name: "Чендлер", surname: "Бинг" , imagename: "chandler", desc: "Чендлер - сыгранным Мэттью Перри, родился в семье писателей эротишных романов,любит много шутить, весьма интересный персонаж, к играивший его актер умер 28 октября 2023 года."),
                         Person(name: "Росс", surname: "Геллер" , imagename: "rosse", desc: "Росс - сыгранный Дэвидом Швиммером, является старшим братом Моники,раньше был уважаемым палеонтологом а зтем стал преподователем в университете, несмотря на добрый вид ему не везет в любви, да и в целом плохо знакомится с девушками.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addPerson(_ sender: Any) {
       // arrayNames.append("new name")
      //  arraySurnames.append("new surname")
       // arrayImage.append("avatar")
        arrayPersons.append(Person(name: "new name", surname: "new surname" , imagename: "avatar", desc: "Here will be a new description"))
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(100) as! UILabel
        label.text = arrayPersons[indexPath.row].name
        
        let labelSurname = cell.viewWithTag(101) as! UILabel
        labelSurname.text = arrayPersons[indexPath.row].surname
        
        let imageview = cell.viewWithTag(102) as! UIImageView
        imageview.image = UIImage(named: arrayPersons[indexPath.row].imagename)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
        detailVc.person = arrayPersons[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayPersons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
