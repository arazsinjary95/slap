//
//  Channel.swift
//  slap
//
//  Created by Araz Sinjary on 6/27/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import Foundation

struct Channel : Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
