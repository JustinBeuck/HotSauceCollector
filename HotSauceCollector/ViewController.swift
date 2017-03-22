//
//  ViewController.swift
//  HotSauceCollector
//
//  Created by JUSTIN MICHAEL BEUCK on 3/16/17.
//  Copyright © 2017 JustinCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var hotSauces : [HotSauce] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        hotSauces = try context.fetch(HotSauce.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotSauces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let hotSauce = hotSauces[indexPath.row]
        cell.textLabel?.text = hotSauce.name
        cell.imageView?.image = UIImage(data: hotSauce.image as! Data)
        cell.detailTextLabel?.text = String(hotSauce.scovilleLevel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hotSauce = hotSauces[indexPath.row]
        performSegue(withIdentifier: "hotSauceSegue", sender: hotSauce)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! HotSauceViewController
        nextVC.hotSauce = sender as? HotSauce
    }


}

