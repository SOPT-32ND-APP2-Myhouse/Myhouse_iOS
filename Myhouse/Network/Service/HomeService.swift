//
//  HomeService.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/23.
//

import Foundation

import Alamofire

final class HomeService: BaseService {
    
    static let shared = HomeService()
    
    private override init() {}
}

extension HomeService {
    func getRecommendAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.getRecommendURL
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
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     RecommendResponseModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getPopularAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.getBestContentsURL
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
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     [PopularResponseModel].self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getProductAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.getProductURL
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
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     [ProductResponseModel].self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
