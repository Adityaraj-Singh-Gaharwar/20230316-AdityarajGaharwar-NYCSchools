//
//  Storyboards.swift
//  20230316-AdityarajGaharwar-NYCSchools
//
//  Created by Adityaraj Singh Gaharwar on 17/03/23.
//

import Foundation
import UIKit

class Storyboards {
    class func Main(controller: String) -> UIViewController {
        return UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: controller)
    }
}
