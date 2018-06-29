//
//  MessageService.swift
//  slap
//
//  Created by Araz Sinjary on 6/27/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let id = item["_id"].stringValue
                            let description = item["description"].stringValue
                            let name = item["name"].stringValue
                            let channel = Channel(channelTitle: name, channelDescription: description, id: id)
                            self.channels.append(channel)
                        }
                        print(self.channels.map{ $0.channelTitle})
                        completion(true)
                    }
                } catch { }
            } else {
                completion(true)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
