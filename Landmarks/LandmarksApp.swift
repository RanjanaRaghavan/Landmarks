//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Ranjana Raghavan on 5/31/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
