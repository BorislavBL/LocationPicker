//
//  LocationPickerApp.swift
//  LocationPicker
//
//  Created by Borislav Lorinkov on 10.10.23.
//

import SwiftUI

@main
struct LocationPickerApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
