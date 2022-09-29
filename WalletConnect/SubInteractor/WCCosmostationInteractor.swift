//
//  WCKeplrInteractor.swift
//  WalletConnect
//
//  Created by yongjoo jung on 2022/03/29.
//  Copyright © 2022 Trust Wallet. All rights reserved.
//

import Foundation

public typealias CosmostationAccountsClosure = (_ id: Int64, _ param: [String]) -> Void
public typealias CosmostationSignTxClosure = (_ params: NSDictionary) -> Void

public struct WCCosmostationInteractor {
    public var onCosmostationAccounts: CosmostationAccountsClosure?
    public var onCosmosatationSignTx: CosmostationSignTxClosure?
    
    func handleEvent(_ event: WCEvent, topic: String, decrypted: Data) throws {
        switch event {
        case .cosmostationAccounts:
            let request: JSONRPCRequest<[String]> = try event.decode(decrypted)
            onCosmostationAccounts?(request.id, request.params)
        case .cosmostationSignTx:
            if let dicDecrypted = try? JSONSerialization.jsonObject(with: decrypted, options: .mutableLeaves) as? NSDictionary {
                onCosmosatationSignTx?(dicDecrypted)
            }
            
        default:
            break
        }
    }
    
}
