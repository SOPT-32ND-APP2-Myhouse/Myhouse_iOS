//
//  ScrapService.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/23.
//

import Foundation

import Alamofire

final class ScrapService: BaseService {
    
    static let shared = ScrapService()
    
    private override init() {}
}

extension ScrapService {
    
    func getAllScrapAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = Config.getAllScrapURL
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
                                                     AllScrapResponseModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getAllDetailAPI(
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = Config.getAllPostURL + "/1"
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
                                                     GetDetailPostResponse.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func postScrapAPI(
        image_url: String,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = "/scrap"
        let header: HTTPHeaders = NetworkConstant.noTokenHeader
        let body: Parameters = [
            "image_url": image_url
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     Scrap.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func postScrapFolderAPI(
        imageUrl: String,
        folderId: Int,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        let url = Config.postFolderScrapURL + "\(folderId)"
        let header: HTTPHeaders = NetworkConstant.noTokenHeader
        let body: Parameters = [
            "image_url": imageUrl
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     ScrapResponseModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
