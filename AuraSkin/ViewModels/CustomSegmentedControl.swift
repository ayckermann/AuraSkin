//
//  CustomSegmentedControl.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 26/05/24.
//

import SwiftUI
import UIKit

struct SavedSegmentedControl: UIViewRepresentable {
    @Binding var selection: String
    var categories: [String]

    func makeUIView(context: Context) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: categories)

        // Apply custom appearance
        segmentedControl.selectedSegmentTintColor = UIColor(Color.auraSkinPrimaryColor)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

        // Set up initial selection
        if let selectedIndex = categories.firstIndex(of: selection) {
            segmentedControl.selectedSegmentIndex = selectedIndex
        }
        segmentedControl.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)

        return segmentedControl
    }

    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        if let selectedIndex = categories.firstIndex(of: selection) {
            uiView.selectedSegmentIndex = selectedIndex
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: SavedSegmentedControl

        init(_ parent: SavedSegmentedControl) {
            self.parent = parent
        }

        @objc func valueChanged(_ sender: UISegmentedControl) {
            let selectedIndex = sender.selectedSegmentIndex
            if selectedIndex < parent.categories.count {
                parent.selection = parent.categories[selectedIndex]
            }
        }
    }
}

struct AnalysisResultSegmentedControl: UIViewRepresentable {
    @Binding var selection: IngredientsEffectType
    var titles: [String]

    func makeUIView(context: Context) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: titles)

        // Apply custom appearance
        segmentedControl.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 14)], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)

        // Set up initial selection
        segmentedControl.selectedSegmentIndex = 0

        segmentedControl.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)

        return segmentedControl
    }

    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        switch selection {
            case .pros:
                uiView.selectedSegmentTintColor = UIColor(Color.auraSkinPrimaryColor)
            case .cons:
                uiView.selectedSegmentTintColor = UIColor(Color.auraSkinConsColor)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: AnalysisResultSegmentedControl

        private var selectedMap: [Int:IngredientsEffectType] = [
            0: .pros,
            1: .cons
        ]

        init(_ parent: AnalysisResultSegmentedControl) {
            self.parent = parent
        }

        @objc func valueChanged(_ sender: UISegmentedControl) {
            parent.selection = selectedMap[sender.selectedSegmentIndex] ?? .pros
        }
    }
}

