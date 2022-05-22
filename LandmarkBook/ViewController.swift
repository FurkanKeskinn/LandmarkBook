//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Furkan Keskin on 21.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarImages = [UIImage]()
    var landmarkNames = [String]()
    
    var chosenLandmarkName  = ""
    var chosenLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate =  self
        tableView.dataSource = self
        
        //Landmark Book Data
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
     
        
        landmarImages.append(UIImage(named: "Metallica2.jpeg")!)
        landmarImages.append(UIImage(named: "Metallica2.jpeg")!)
        landmarImages.append(UIImage(named: "Metallica2.jpeg")!)
        landmarImages.append(UIImage(named: "Metallica2.jpeg")!)
        landmarImages.append(UIImage(named: "Metallica2.jpeg")!)
        
        
        
        navigationItem.title = "Landmark Book"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewContoller", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "toImageViewContoller" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selecredLandmarkImage = chosenLandmarkImage
        }
    }


}


