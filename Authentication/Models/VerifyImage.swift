//
//  VerifyImage.swift
//  Authentication
//
//  Created by Ethan Scott on 4/22/21.
//

import UIKit

class VerifyImage {
    
    let name: String
    let image: UIImage?
    let correct: Bool
    let uuid: String
    
    init(name: String, image: UIImage?, correct: Bool, uuid: String = UUID().uuidString) {
        self.name = name
        self.image = image
        self.correct = correct
        self.uuid = uuid
    }
    
}
//MARK: - Extension
extension VerifyImage: Equatable {
    static func == (lhs: VerifyImage, rhs: VerifyImage) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
}
