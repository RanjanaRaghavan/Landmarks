//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ranjana Raghavan on 6/2/25.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
            
            List{
                
                Toggle(isOn : $showFavoritesOnly){
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) {landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label:{
                        LandmarkRow(landmark: landmark)
                    }
                
                }
            
            }
            .animation(.default,value :filteredLandmarks)
            .navigationTitle("Landmarks")
            }detail: {
                Text("Choose a Landmark")
            }
    }
        
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
