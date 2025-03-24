//
//  ViewController.swift
//  FinalAppProject_Sprint1_AP
//
//  Created by Ashley on 3/18/25.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var makeupTable: UITableView!
    
    var makeupArray: [MakeupItem] = [
        ["Foundation", "Morphe - Lightform Extended Hydration", "Nyx - Can't Stop Won't Stop 24hr", "Revolution - IRL Filter", "Maybelline - Instant Age Rewind", "Revlon - Illuminance Serum Tint"],
        ["Concealer", "Tarte Shape Tape", "Too Faced Born This Way", "Nars Radiant", "Hourglass Vanish Airbrush"],
        ["Blush", "Nyx - Buttermelt Pressed Powder", "Bare Minerals - Gen Nude Blonzer", "Milani - Baked"],
        ["Lipstick", "Maybelline - Super Stay Teddy Tint", "MAC - MACximal", "Kylie Cosmetics - Lip Kit"]
    ]
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeupTable.dataSource = self
        makeupTable.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makeupArray[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = makeupArray[indexPath.section][indexPath.row + 1]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = makeupArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "Selected Makeup Item", message: "\(selectedItem)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return makeupArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return makeupArray[section][0]
    }

}

class AddItemViewController: UIViewController {
    
    @IBOutlet var brandNameText: UITextField!
    @IBOutlet var productNameText: UITextField!
    @IBOutlet var productTypeText: UITextField!
    @IBOutlet var productColorText: UITextField!
    
        @IBAction func myViewButton(_ sender: Any) {
            productNameText.text = UserDefaults.standard.string(forKey: "productName")
            brandNameText.text = UserDefaults.standard.string(forKey: "brandName")
            productTypeText.text = UserDefaults.standard.string(forKey: "productType")
            productColorText.text = UserDefaults.standard.string(forKey: "productColor")
        }
        
       
        @IBAction func myRemoveButton(_ sender: Any) {
            productNameText.text = ""
            brandNameText.text = ""
            productTypeText.text = ""
            productColorText.text = ""
        }

        
    @IBAction func saveItem(_ sender: UIButton) {
        guard let name = productNameText.text, !name.isEmpty,
              let brand = brandNameText.text, !brand.isEmpty,
              let type = productTypeText.text, !type.isEmpty,
              let color = productColorText.text, !color.isEmpty else {
            return
        }

        UserDefaults.standard.set(brand, forKey: "brandName")
        UserDefaults.standard.set(name, forKey: "productName")
        UserDefaults.standard.set(type, forKey: "productType")
        UserDefaults.standard.set(color, forKey: "productColor")

        
        /*let newItem = MakeupItem(name: name, brand: brand, type: type, color: color)
        MakeupItemData.shared.saveItems(items: [newItem])
*/
        
        navigationController?.popViewController(animated: true)
    }

}

