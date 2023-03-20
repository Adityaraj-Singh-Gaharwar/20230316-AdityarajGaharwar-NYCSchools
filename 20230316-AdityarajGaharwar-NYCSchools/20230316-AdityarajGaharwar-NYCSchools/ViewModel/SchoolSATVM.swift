//
//  SchoolSATVM.swift
//  20230316-AdityarajGaharwar-NYCSchools
//
//  Created by Adityaraj Singh Gaharwar on 17/03/23.
//

import Foundation

protocol SchoolSATVMDelegate {
    func didReceiveSchoolSATResponse(schoolSATResponse: SchoolSATModel?, err: NetworkError?)
}

class SchoolSATVM {
    var dbnNum: String?
    var schoolSATVmDelegate : SchoolSATVMDelegate?
    
    func getSchoolSatDetails() {
        // use SchoolListResource to call API
        let schoolSATResource = SchoolSATResource()
        LoadingIndicator.sharedInstance.showActivityIndicator()
        schoolSATResource.getSATScoreBySchools(dbnRequest: dbnNum ?? "") { result, err in
            // return the response we get from SchoolSATResource
            DispatchQueue.main.async {
                LoadingIndicator.sharedInstance.hideActivityIndicator()
                self.schoolSATVmDelegate?.didReceiveSchoolSATResponse(schoolSATResponse: result, err: err)
            }
        }
    }
}
