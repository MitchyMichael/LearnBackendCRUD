//
//  GetDataView.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import SwiftUI
import Alamofire

struct GetDataView: View {
    @StateObject private var getDataViewModel = GetDataViewModel()
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                ForEach(getDataViewModel.customers) { customer in
                    Text("Id: \(customer.id)")
                    Text("Name: \(customer.name)")
                    Text("Email: \(customer.email)")
                    Text("Phone: \(customer.phone)")
                        .padding(.bottom)
                }
            }
            .onAppear(){
                getDataViewModel.getAllData()
            }
        }
    }
}

#Preview {
    GetDataView()
}
