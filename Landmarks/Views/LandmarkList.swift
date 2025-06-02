//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ranjana Raghavan on 6/2/25.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        NavigationSplitView {
            
            List(landmarks) {landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                } label:{
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
            }detail: {
                Text("Choose a Landmark")
            }
    }
        
}

#Preview {
    LandmarkList()
}
