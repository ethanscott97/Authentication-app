//
//  FilterViewController.swift
//  Authentication
//
//  Created by Ethan Scott on 4/22/21.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func groupWasSelected(group: String)
}

class FilterViewController: UIViewController {
    
    //MARK: - Properties
    weak var delegate: FilterSelectionDelegate?

    //MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   //MARK: - Actions
    @IBAction func busButtonTapped(_ sender: Any) {
        delegate?.groupWasSelected(group: "buses")
        self.dismiss(animated: true)
    }
    
    @IBAction func antButtonTapped(_ sender: Any) {
        delegate?.groupWasSelected(group: "animals")
        self.dismiss(animated: true)
    }
}//End of class
