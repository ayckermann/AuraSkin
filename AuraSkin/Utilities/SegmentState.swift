//
//  SegmentState.swift
//  AuraSkin
//
//  Created by Risma Harby on 25/05/24.
//

import Foundation
import SwiftUI

class SegmentState: ObservableObject {
    @Published var segment: String = ""

    func resetUISegmentedControl() {
        UISegmentedControl.appearance().selectedSegmentTintColor = nil
        UISegmentedControl.appearance().setTitleTextAttributes([:], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([:], for: .selected)
        UISegmentedControl.appearance().setDividerImage(nil, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

        UISegmentedControl.appearance().setTitleTextAttributes([:], for: .normal)
        UISegmentedControl.appearance().backgroundColor = nil
    }
}
