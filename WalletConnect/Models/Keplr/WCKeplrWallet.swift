//
//  WCKeplrWallet.swift
//  WalletConnect
//
//  Created by yongjoo jung on 2022/03/29.
//  Copyright © 2022 Trust Wallet. All rights reserved.
//

import Foundation

public struct WCKeplrWallet: Codable {
    public let name: String
    public let algo: String
    public let pubKey: [UInt8]
    public let address: [UInt8]
    public let bech32Address: String
    public let isNanoLedger: Bool

    public init(name: String, algo: String, pubKey: [UInt8], address: [UInt8], bech32Address: String, isNanoLedger: Bool) {
        self.name = name
        self.algo = algo
        self.pubKey = pubKey
        self.address = address
        self.bech32Address = bech32Address
        self.isNanoLedger = isNanoLedger
    }
}
