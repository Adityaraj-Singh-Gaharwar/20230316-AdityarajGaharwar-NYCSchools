//
//  SchoolSATResource.swift
//  20230316-AdityarajGaharwar-NYCSchools
//
//  Created by Adityaraj Singh Gaharwar on 17/03/23.
//

import Foundation

struct SchoolSATResource {

    func getSATScoreBySchools(dbnRequest: String, completion: @escaping (_ result: SchoolSATModel?, _ err: NetworkError?) -> Void) {
        let utility = HttpUtility.shared
        let schoolSATUrl = URL(string: APIEndPoints.schoolSATDetails)!
        var components = URLComponents(url: schoolSATUrl, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "dbn", value: dbnRequest)]
        let schoolSATRequest = Request(withUrl: (components?.url!)!, forHttpMethod: .get)
        utility.request(huRequest: schoolSATRequest, resultType: SchoolSATModel.self) { (response) in
            switch response {
            case .success(let satScore):
                if let scores = satScore {
                    completion(scores, nil)
                } else {
                    completion(nil, nil)
                }
            case .failure(let error):
                // your code here to handle error
                DispatchQueue.main.async {
                    LoadingIndicator.sharedInstance.hideActivityIndicator()
                    completion(nil, error)
                    // your code here to handle error
                    print(error.localizedDescription)
                }
            }
        }
    }
}
