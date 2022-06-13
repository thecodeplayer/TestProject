//
//  APIClient.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/10/22.
//

import Foundation
import Alamofire

class APIClient {

    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                completion(response.result)
        }
    }

    static func getInformation(completion:@escaping (AFResult< [SampleModel]>)->Void) {
        performRequest(route: APIRouter.information, completion: completion)
    }

}
