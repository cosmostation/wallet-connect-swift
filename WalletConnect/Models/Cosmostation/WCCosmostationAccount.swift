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
    public let pubKey: String
    public let address: String
    public let bech32Address: String
    public let isNanoLedger: Bool

    public init(name: String, algo: String, pubKey: String, address: String, bech32Address: String, isNanoLedger: Bool) {
        self.name = name
        self.algo = algo
        self.pubKey = pubKey
        self.address = address
        self.bech32Address = bech32Address
        self.isNanoLedger = isNanoLedger
    }
}
