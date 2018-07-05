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
    var messages = [Message]()
    var unreadChannels = [String]()
    var selectedChannel: Channel?
    
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
                        //print(self.channels[0].channelTitle)
                        //print(self.channels.map{ $0.channelTitle})
                        NotificationCenter.default.post(name: NOTIF_CHANNEL_LOADED, object: nil)
                        completion(true)
                    }
                } catch { }
            } else {
                completion(true)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findAllMessageForChannel(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else { return }
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let messageBody = item["messageBody"].stringValue
                            let channelId = item["channelId"].stringValue
                            let id = item["_id"].stringValue
                            let userName = item["userName"].stringValue
                            let userAvatar = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            let timeStamp = item["timeStamp"].stringValue
                            
                            let message = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                            self.messages.append(message)
                        }
                        print(self.messages)
                        completion(true)
                    }
                    else {
                        debugPrint(response.result.error as Any)
                        completion(false)
                    }
                    
                } catch { }
            }
        }
    }
    
    func clearMessages() {
        messages.removeAll()
    }
    
    func clearChannels() {
        channels.removeAll()
    }
}
