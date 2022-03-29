//
//  WCKeplrInteractor.swift
//  WalletConnect
//
//  Created by yongjoo jung on 2022/03/29.
//  Copyright © 2022 Trust Wallet. All rights reserved.
//

import Foundation

public typealias EnableKeplrWalletClosure = (_ id: Int64, _ param: [String]) -> Void
public typealias GetKeplrWalletClosure = (_ id: Int64, _ param: [String]) -> Void
public typealias SignKeplrAminoClosure = (_ params: NSDictionary) -> Void

public struct WCKeplrInteractor {
    public var onEnableKeplrWallet: EnableKeplrWalletClosure?
    public var onGetKeplrWallet: GetKeplrWalletClosure?
    public var onSignKeplrAmino: SignKeplrAminoClosure?
    
    func handleEvent(_ event: WCEvent, topic: String, decrypted: Data) throws {
        switch event {
        case .keplrEnableWallet:
            let request: JSONRPCRequest<[String]> = try event.decode(decrypted)
            onEnableKeplrWallet?(request.id, request.params)
        case .keplrGetWallet:
            let request: JSONRPCRequest<[String]> = try event.decode(decrypted)
            onGetKeplrWallet?(request.id, request.params)
        case .keplrSignAmino:
            if let dicDecrypted = try? JSONSerialization.jsonObject(with: decrypted, options: .mutableLeaves) as? NSDictionary {
                onSignKeplrAmino?(dicDecrypted)
            }
            
        default:
            break
        }
    }
    
}
