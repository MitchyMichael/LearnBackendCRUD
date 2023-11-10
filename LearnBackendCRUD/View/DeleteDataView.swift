//
//  DeleteDataView.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 08/11/23.
//

import SwiftUI

struct DeleteDataView: View {
    @StateObject private var deleteDataViewModel = DeleteDataViewModel()
    @State var inputId: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Input customer ID : ")
                TextField("Customer id number", value: $inputId, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
            }
            .padding()
            
            Button (role: .destructive){
                deleteDataViewModel.deleteData(inputId: inputId)
            } label: {
                Text("Delete Data")
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    DeleteDataView()
}
