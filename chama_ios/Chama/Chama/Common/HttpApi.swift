//
//  HttpApi.swift
//  HNTT
//
//  Created by Jin Qian on 2/28/17.
//  Copyright © 2017 Jin Qian. All rights reserved.
//

import UIKit
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}


private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
        
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

// MARK: - Provider support
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

let headers = [
    //"X-API-KEY": X_API_KEY,
    "Content-Type": "application/json"
]

class HttpApi: NSObject {
    
    static public func toJSonString(_ data : Any) -> String {
        
        var jsonString = "";
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        } catch {
            print(error.localizedDescription)
        }
        return jsonString;
    }
    
    static public func callPostApi(url:String,
                                   params:[String : Any]?,
                                   completed:@escaping (_ response:NSDictionary) -> Void,
                                   failed:@escaping (_ error:NSError) -> Void) {
        
        if !Connectivity.isConnectedToInternet {
            print("There is no internet connection")
            dismissLoading()
            toast(message: "There is no internet connection")
            return
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        Alamofire.request(url, method:.post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(params as Any)  // original params
                print(response.response as Any) // URL response
                print(response.data as Any)     // server data
                print(response.result as Any)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    completed(JSON as! NSDictionary)
                    
                } else {
                    print("error: \(String(describing: response.error?.localizedDescription))")
                    failed(response.error! as NSError)
                }
        }
    }
    
    static public func callPostApi(url:String,
                                   headers:[String: String], // = ["Content-Type": "application/json"],
                                   params:[String : Any]?,
                                   completed:@escaping (_ response:NSDictionary) -> Void,
                                   failed:@escaping (_ error:NSError) -> Void) {
        
        if !Connectivity.isConnectedToInternet {
            print("There is no internet connection")
            dismissLoading()
            toast(message: "There is no internet connection")
            return
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        Alamofire.request(url, method:.post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(params as Any)  // original params
                print(response.response as Any) // URL response
                print(response.data as Any)     // server data
                print(response.result as Any)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    completed(JSON as! NSDictionary)
                    
                } else {
                    print("error: \(String(describing: response.error?.localizedDescription))")
                    failed(response.error! as NSError)
                }
        }
    }
    
    static public func callGetApi(url:String,
                                  params:[String : Any]?,
                                  completed:@escaping (_ response:NSDictionary) -> Void,
                                  failed:@escaping (_ error:NSError) -> Void) {
        //let strUrl = "\(API_URL)\(url)"
        //let strUrl = "\(url)"

        if !Connectivity.isConnectedToInternet {
            print("There is no internet connection")
            dismissLoading()
            toast(message: "There is no internet connection")
            return
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        Alamofire.request(url, method:.get, parameters: params, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(params as Any)  // original params
                print(response.response as Any) // URL response
                print(response.data as Any)     // server data
                print(response.result as Any)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    completed(JSON as! NSDictionary)
                    
                } else {
                    print("error: \(String(describing: response.error?.localizedDescription))")
                    failed(response.error! as NSError)
                }
        }
    }
    
    static public func callPostApiURLEncoding(url:String,
                                              headers:[String: String]? = ["Content-Type": "application/json"],
                                              params:[String : Any]?,
                                              completed:@escaping (_ response:NSDictionary) -> Void,
                                              failed:@escaping (_ error:NSError) -> Void) {
        //let strUrl = "\(API_URL)\(url)"
        //let strUrl = "(url)"
        
        if !Connectivity.isConnectedToInternet {
            print("There is no internet connection")
            dismissLoading()
            toast(message: "There is no internet connection")
            return
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        Alamofire.request(url, method:.post, parameters: params, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(params as Any)  // original params
                print(response.response as Any) // URL response
                print(response.data as Any)     // server data
                print(response.result as Any)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    completed(JSON as! NSDictionary)
                    
                } else {
                    print("error: \(String(describing: response.error?.localizedDescription))")
                    failed(response.error! as NSError)
                }
        }
    }
    
    static public func callDeleteApiURLEncoding(url:String,
                                              headers:[String: String]? = ["Content-Type": "application/json"],
                                              params:[String : Any]?,
                                              completed:@escaping (_ response:NSDictionary) -> Void,
                                              failed:@escaping (_ error:NSError) -> Void) {
        //let strUrl = "\(API_URL)\(url)"
        //let strUrl = "(url)"
        
        if !Connectivity.isConnectedToInternet {
            print("There is no internet connection")
            dismissLoading()
            toast(message: "There is no internet connection")
            return
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        Alamofire.request(url, method:.delete, parameters: params, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(params as Any)  // original params
                print(response.response as Any) // URL response
                print(response.data as Any)     // server data
                print(response.result as Any)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    completed(JSON as! NSDictionary)
                    
                } else {
                    print("error: \(String(describing: response.error?.localizedDescription))")
                    failed(response.error! as NSError)
                }
        }
    }
    
    static public func callPostApiWithImage(url:String,
                              params:[String : String],
                              image:UIImage,
                              completed:@escaping (_ response:NSDictionary) -> Void,
                              failed:@escaping (_ error:NSError) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        if !Connectivity.isConnectedToInternet {
            print("There is no internet connection")
            dismissLoading()
            toast(message: "There is no internet connection")
            return
        }
        
        //let strUrl = "\(API_URL)\(url)"
        //let strUrl = "(url)"
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(image.pngData()!,
                                     withName: "file",
                                     fileName: "image.jpg",
                                     mimeType: "image/jpg")
            for (key, value) in params {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
        }, to:url)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print(progress)
                })
                
                upload.responseJSON { response in
                    print(response.result)
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        completed(JSON as! NSDictionary)
                        
                    } else {
                        print("error: \(String(describing: response.error?.localizedDescription))")
                        failed(response.error! as NSError)
                    }
                }
                break
            case .failure(let encodingError): //break
                print (encodingError.localizedDescription)
                failed(encodingError as NSError)
                break
            }
        }
    }
    
    /** @Param: sample content
     content: [String: Any] = {
         "registration_ids": ["dqEhmBg4RS0:APA91bEzykBAsb-R654L5ziCkTqc3FSq8da9mj7jJJwIFLy5KDnyDUIwcGTuHaP87WXR97aTEy0H2ui8gCHAEbMKqXCKiawL9ypDfIAy3xf0VmcDuCIN-IUJFAxmEmWJ4huUMzbgWzni"],
         "notification": {
             "title": "Title",
             "body": "Test Notification",
             "sound": "default",
             "badge": "0",
             "subtitle": "Qonect sub title"
             },
         "data": {
             "name": "yangyang",
             "age": "30",
             "WorkHistory": {
                 "1": "University",
                 "2": "Collage"
             }
         }
     }
     */
    
    
}
