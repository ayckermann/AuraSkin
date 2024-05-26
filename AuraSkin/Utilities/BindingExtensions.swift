//
//  BindingExtensions.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 26/05/24.
//

import Foundation
import SwiftUI

extension Binding where Value == String? {
    var unwrapped: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? "" },
            set: { self.wrappedValue = $0 }
        )
    }
}

extension Binding where Value == Date? {
    var unwrapped: Binding<Date> {
        Binding<Date>(
            get: { self.wrappedValue ?? Date() },
            set: { self.wrappedValue = $0 }
        )
    }
}

extension Binding where Value == Bool? {
    var unwrapped: Binding<Bool> {
        Binding<Bool>(
            get: { self.wrappedValue ?? false },
            set: { self.wrappedValue = $0 }
        )
    }
}
