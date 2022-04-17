//
//  WCKeplrInteractor.swift
//  WalletConnect
//
//  Created by yongjoo jung on 2022/03/29.
//  Copyright © 2022 Trust Wallet. All rights reserved.
//

import Foundation

public typealias CosmostationGetKeysClosure = (_ id: Int64, _ param: [String]) -> Void
public typealias CosmostationSignAminoClosure = (_ params: NSDictionary) -> Void

public struct WCCosmostationInteractor {
    public var onCosmostationGetKeys: CosmostationGetKeysClosure?
    public var onCosmosatationSignAmino: CosmostationSignAminoClosure?
    
    func handleEvent(_ event: WCEvent, topic: String, decrypted: Data) throws {
        switch event {
        case .cosmostationGetKeys:
            let request: JSONRPCRequest<[String]> = try event.decode(decrypted)
            onCosmostationGetKeys?(request.id, request.params)
        case .cosmostationSignAmino:
            if let dicDecrypted = try? JSONSerialization.jsonObject(with: decrypted, options: .mutableLeaves) as? NSDictionary {
                onCosmosatationSignAmino?(dicDecrypted)
            }
            
        default:
            break
        }
    }
    
}
