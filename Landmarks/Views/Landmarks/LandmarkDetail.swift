//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Ranjana Raghavan on 6/02/25.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
        }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.localCoordinate)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y : -130)
                .padding(.bottom , -130)
            VStack(alignment:.leading) {
                HStack{
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
       return LandmarkDetail(landmark: modelData.landmarks[0])
           .environment(modelData)
}
