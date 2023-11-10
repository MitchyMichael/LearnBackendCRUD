//
//  GetDataByIdView.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import SwiftUI

struct GetDataByIdView: View {
    @State var inputId: Int = 0
    @StateObject private var getDataByIdViewModel = GetDataByIdViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Input customer ID : ")
                TextField("Customer id number", value: $inputId, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
            }
            .padding()
            
            Button {
                getDataByIdViewModel.getDataById(customerId: inputId)
            } label: {
                Text("Send")
            }
            .padding(.bottom)
            
            if getDataByIdViewModel.customer != nil {
                VStack (alignment: .leading){
                    Text("Name: \(getDataByIdViewModel.customer!.name)")
                    Text("Email: \(getDataByIdViewModel.customer!.email)")
                    Text("Phone: \(getDataByIdViewModel.customer!.phone)")
                }
            } else {
                Text("No customer found")
            }
            
            
        }
    }
}

#Preview {
    GetDataByIdView()
}
