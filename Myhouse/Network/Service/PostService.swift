//
//  PostService.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/23.
//

import Foundation

import Alamofire

final class PostService: BaseService {
    
    static let shared = PostService()
    
    private override init() {}
}

extension PostService {
    
    func getAllPostAPI(
        completion: @escaping (NetworkResult<Any>) -> Void) {
            let url = Config.getAllPostURL
        let header: HTTPHeaders = NetworkConstant.noTokenHeader
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, AllPostResponseModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
}
