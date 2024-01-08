//
//  ViewController.swift
//  JSONParsing3
//
//  Created by NTS on 08/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    
    func fetchData(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            if let safeData = data {
                do {
                    let jsonData = try JSONDecoder().decode(JsonDataModel.self, from: safeData)
                    DispatchQueue.main.async {
                        self.userIdLabel.text = String(jsonData.userId)
                        self.completedLabel.text = String(jsonData.completed)
                        self.idLabel.text = String(jsonData.id)
                        self.titleLabel.text = jsonData.title
                    }
                }catch {
                    print(error)
                }
            }
        }.resume()
    }

}

