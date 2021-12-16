//
//  NetWorkMonitor.swift
//  ASB
//
//  Created by Tejaswini on 16/12/21.
//  Copyright © 2021 Tejaswini. All rights reserved.
//

import Foundation
import Network

final class NetWorkMonitor{
    static let shared = NetWorkMonitor()
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    public private(set) var isConnected: Bool = false
    public private(set) var connectionType: connectionType = .unknown
    enum connectionType {
        case wifi
        case cellular
        case eathernet
        case unknown
    }
    private init(){
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring(){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
            self?.getConnectionType(_path:path)
        }
        
    }
    
    public func stopMonitoring(){
        monitor.cancel()
    }
    
    private func getConnectionType(_path: NWPath){
        if _path.usesInterfaceType(.wifi){
            self.connectionType = .wifi
        }else if _path.usesInterfaceType(.cellular){
            self.connectionType = .cellular
        }else if _path.usesInterfaceType(.wiredEthernet){
            self.connectionType = .eathernet
        }else{
            self.connectionType = .unknown
        }
    }
}
