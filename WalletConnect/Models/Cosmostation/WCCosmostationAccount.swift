//
//  WCCosmostationAccount.swift
//  WalletConnect
//
//  Created by y on 2022/04/17.
//  Copyright © 2022 Trust Wallet. All rights reserved.
//

import Foundation

public struct WCCosmostationAccount: Codable {
    public let name: String
    public let algo: String
    public let pubKey: [UInt8]
    public let address: [UInt8]
    public let bech32Address: String

    public init(name: String, algo: String, pubKey: [UInt8], address: [UInt8], bech32Address: String) {
        self.name = name
        self.algo = algo
        self.pubKey = pubKey
        self.address = address
        self.bech32Address = bech32Address
    }
}
