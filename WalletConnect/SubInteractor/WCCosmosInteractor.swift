//
//  WCCosmosInteractor.swift
//  WalletConnect
//
//  Created by y on 2022/09/29.
//  Copyright © 2022 Trust Wallet. All rights reserved.
//

import Foundation

public typealias CosmosAccountsClosure = (_ id: Int64, _ param: [String]) -> Void
public typealias CosmosSignAminoClosure = (_ params: NSDictionary) -> Void
public typealias CosmosSignDirectClosure = (_ params: NSDictionary) -> Void

public struct WCCosmosInteractor {
    public var onCosmosAccounts: CosmosAccountsClosure?
    public var onCosmosSignAmino: CosmosSignAminoClosure?
    public var onCosmosSignDirect: CosmosSignDirectClosure?
    
    func handleEvent(_ event: WCEvent, topic: String, decrypted: Data) throws {
        switch event {
        case .cosmosGetAccounts:
            let request: JSONRPCRequest<[String]> = try event.decode(decrypted)
            onCosmosAccounts?(request.id, request.params)
        case .cosmosSignDirect:
            if let dicDecrypted = try? JSONSerialization.jsonObject(with: decrypted, options: .mutableLeaves) as? NSDictionary {
                onCosmosSignDirect?(dicDecrypted)
            }
        case .cosmosSignAmino:
            if let dicDecrypted = try? JSONSerialization.jsonObject(with: decrypted, options: .mutableLeaves) as? NSDictionary {
                onCosmosSignAmino?(dicDecrypted)
            }
            
        default:
            break
        }
    }
    
}
