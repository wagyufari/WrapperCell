//
//  ViewController.swift
//  WrapperCell
//
//  Created by Muhammad Ghifari on 19/4/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(WrapperCell<DummyCell>.self, forCellReuseIdentifier: "cell")
    }
}

struct DummyCell: View {
    var body: some View {
            VStack {
                Text("Hello, world!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }.padding(32)
        }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WrapperCell<DummyCell> {
            cell.bindContent(content: DummyCell())
            return cell
        }
        
        return UITableViewCell()
    }
}
