//
//  ContentView.swift
//  Landmarks
//
//  Created by Ranjana Raghavan on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
