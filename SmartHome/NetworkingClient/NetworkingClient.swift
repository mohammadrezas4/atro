import Foundation
import Alamofire

class NetworkingClient {
    
    typealias webserviceResponse = ([[String : Any]]?, Error?) -> Void
    
    func executeGETrequest(_ url : URLConvertible, headers : HTTPHeaders? = nil, complition : @escaping webserviceResponse) {
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil).validate().responseJSON { (response) in
            if let error = response.error {
                complition(nil, error)
            } else if let jsonArray = response.value as? [[String : Any]] {
                complition(jsonArray, nil)
            } else if let jsonDict = response.value as? [String : Any] {
                complition([jsonDict], nil)
            }
        }
    }
    
    func executePOSTrequest(_ url : URLConvertible, _ parameter : [String : String]? = nil, headers : HTTPHeaders? = nil, complition : @escaping webserviceResponse) {
        AF.request(url, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: headers, interceptor: nil).validate().responseJSON { (response) in
            if let error = response.error {
                complition(nil, error)
            } else if let jsonArray = response.value as? [[String : Any]] {
                complition(jsonArray, nil)
            } else if let jsonDict = response.value as? [String : Any] {
                complition([jsonDict], nil)
            }
        }
        
    }
    
}
