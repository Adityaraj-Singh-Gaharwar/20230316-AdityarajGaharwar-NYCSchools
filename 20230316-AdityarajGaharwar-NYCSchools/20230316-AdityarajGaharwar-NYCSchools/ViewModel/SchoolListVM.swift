//
//  SchoolListVM.swift
//  20230316-AdityarajGaharwar-NYCSchools
//
//  Created by Adityaraj Singh Gaharwar on 17/03/23.
//

import Foundation
import UIKit

protocol SchoolListVMDelegate {
    func didReceiveSchoolListResponse(schoolListResponse: [SchoolListModel]?, err: NetworkError?)
}

class SchoolListVM {
    var schoolListVmDelegate : SchoolListVMDelegate?
    
    func getSchoolList() {
        // use SchoolListResource to call API
        LoadingIndicator.sharedInstance.showActivityIndicator()
        let schoolListResource = SchoolListResource()
        schoolListResource.getSchoolLists { result,err  in
            // return the response we get from SchoolListResource
            DispatchQueue.main.async {
                LoadingIndicator.sharedInstance.hideActivityIndicator()
                self.schoolListVmDelegate?.didReceiveSchoolListResponse(schoolListResponse: result, err: err)
            }
        }
    }
}
