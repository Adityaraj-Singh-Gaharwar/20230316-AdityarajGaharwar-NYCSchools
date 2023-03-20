//
//  Constants.swift
//  20230316-AdityarajGaharwar-NYCSchools
//
//  Created by Adityaraj Singh Gaharwar on 17/03/23.
//

import Foundation
import UIKit

let status = Reach().connectionStatus()

struct Cell {
    static let schoolCell = "SchoolCell"
}

struct Controller {
    static let schoolDetailsVC = "SchoolDetailsVC"
}

struct Constants {
    static let netConnection = "Please check the network connection"
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = self.frame.height / newValue
        }
    }
}

extension UIViewController {
    func AlertWithOneOption(message:String, optionOne:String, actionOptionOne:@escaping() -> Void)  {
        let alert = UIAlertController.init(title: "NYC Schools", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: optionOne, style: .default, handler: { (action) in
            actionOptionOne()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func Alert(message:String){
        let alert = UIAlertController.init(title: "NYC Schools", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
