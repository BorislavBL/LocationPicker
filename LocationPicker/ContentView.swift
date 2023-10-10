//
//  ContentView.swift
//  LocationPicker
//
//  Created by Borislav Lorinkov on 10.10.23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    @State private var showPlaceLookUpSheet = false
    @State var returnedPlace = Place(mapItem: MKMapItem())
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Location:\n \(locationManager.location?.coordinate.latitude ?? 0.0), \(locationManager.location?.coordinate.longitude ?? 0.0)")
                
                Text("Returned Place: \n \(returnedPlace.latitude), \(returnedPlace.longitude) \n \(returnedPlace.address) \n \(returnedPlace.name)")
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        showPlaceLookUpSheet.toggle()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                        Text("Lookup Place")
                    })
                }
            }
        }
        .fullScreenCover(isPresented: $showPlaceLookUpSheet) {
            PlaceLookupView(returnedPlace: $returnedPlace)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
