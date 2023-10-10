//
//  PlaceLookupView.swift
//  LocationPicker
//
//  Created by Borislav Lorinkov on 10.10.23.
//

import SwiftUI
import MapKit

struct PlaceLookupView: View {
    @EnvironmentObject var locationManager: LocationManager
    @StateObject var placeVM = PlaceViewModel()
    @State private var searcText = ""
    @Environment(\.dismiss) private var dismiss
    @Binding var returnedPlace: Place

    var body: some View {
        NavigationStack{
            List(placeVM.places){ place in
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.title2)
                    Text(place.address)
                        .font(.callout)
                }
                .onTapGesture {
                    returnedPlace = place
                    dismiss()
                }
            }
            .listStyle(.plain)
            .searchable(text: $searcText)
            .onChange(of: searcText, { oldValue, newValue in
                if !newValue.isEmpty {
                    placeVM.search(text: newValue, region: locationManager.region)
                } else {
                    placeVM.places = []
                }
            })
            .toolbar{
                ToolbarItem(placement: .automatic) {
                    Button("Dismiss", action: {dismiss()})
                }
            }
        }
    }
}

#Preview {
    PlaceLookupView( returnedPlace: .constant(Place(mapItem: MKMapItem())))
        .environmentObject(LocationManager())
}
