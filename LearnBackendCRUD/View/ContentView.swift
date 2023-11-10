//
//  ContentView.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: GetDataView()) {
                Text("Get All Data")
            }
            NavigationLink(destination: GetDataByIdView()) {
                Text("Get Data by ID")
            }
            NavigationLink(destination: CreateDataView()) {
                Text("Add New Data")
            }
            NavigationLink(destination: UpdateDataView()) {
                Text("Update Data")
            }
            NavigationLink(destination: DeleteDataView()) {
                Text("Delete Data")
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
