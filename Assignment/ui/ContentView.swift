//
//  ContentView.swift
//  Assignment
//
//  Created by Kunal on 03/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var path: [DeviceData] = [] // Navigation path

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if let computers = viewModel.data {
                    DevicesList(devices: computers) { selectedComputer in
                        path.append(selectedComputer) // Navigate to detail view
                    }
                } else {
                    ProgressView("Loading...")
                }
            }
            .navigationTitle("Computers")
            .onAppear {
                viewModel.fetchAPI()
            }
            .navigationDestination(for: DeviceData.self) { computer in
                DetailView(device: computer)
            }
        }
    }
}
