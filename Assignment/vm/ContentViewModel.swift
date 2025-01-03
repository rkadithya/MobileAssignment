//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation


class ContentViewModel : ObservableObject {
    
    private let apiService = ApiService()
    @Published var data: [DeviceData]? = nil

    func fetchAPI() {
        apiService.fetchDeviceDetails(completion: { item in
            self.data = item
        })
    }
}
