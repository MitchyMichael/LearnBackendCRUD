//
//  UpdateDataView.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import SwiftUI

struct UpdateDataView: View {
    
    @State var isChanged: Bool = false
    @State var dataId: Int = 0
    @StateObject private var updateDataViewModel = UpdateDataViewModel()
    
    @State var newName: String = ""
    @State var newEmail: String = ""
    @State var newPhone: String = ""
    
    var body: some View {
        VStack {
            HStack{
                Text("Input Data ID :")
                TextField("Data ID", value: $dataId, formatter: NumberFormatter())
            }
            
            VStack {
                Button {
                    updateDataViewModel.getDataById(customerId: dataId)
                    if isChanged == false {
                        isChanged = true
                    }
                } label: {
                    Text("Send")
                }
            }
            .padding(.bottom, 50)
            
            if isChanged == true {
                if updateDataViewModel.customer != nil {
                    VStack {
                        VStack (alignment: .leading){
                            HStack {
                                Text("Name : ")
                                TextField(updateDataViewModel.customer!.name, text: $newName)
                                    .autocorrectionDisabled()
                            }
                            HStack {
                                Text("Email : ")
                                TextField(updateDataViewModel.customer!.email, text: $newEmail)
                                    .autocorrectionDisabled()
                            }
                            HStack {
                                Text("Phone : ")
                                TextField(updateDataViewModel.customer!.phone, text: $newPhone)
                                    .autocorrectionDisabled()
                            }
                        }
                        
                        VStack {
                            Button {
                                let push = Customer(id: String(dataId), name: newName, email: newEmail, phone: newPhone)
                                updateDataViewModel.updateData(customer: push)
                            } label: {
                                Text("Confirm edit")
                            }
                        }
                        .padding()
                    }
                } else {
                    Text("No customer found")
                }
            }
        }
        .padding()
    }
    
    
}

#Preview {
    UpdateDataView()
}
