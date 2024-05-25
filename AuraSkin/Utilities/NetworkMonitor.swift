//
//  NetworkMonitor.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 23/05/24.
//

import Foundation
import Network

@Observable
class NetworkMonitor {
    private let networkMonitor: NWPathMonitor = NWPathMonitor()
    private let workerQueue: DispatchQueue = DispatchQueue(label: "Monitor")
    var isConnected = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
}
