//
//  CreateDataView.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import SwiftUI

struct CreateDataView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var createDataViewModel = CreateDataViewModel()
    
    @State var inputName: String = ""
    @State var inputEmail: String = ""
    @State var inputPhone: String = ""
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){
                HStack {
                    Text("Input name:")
                    TextField("Your name", text: $inputName)
                        .autocorrectionDisabled()
                }
                HStack {
                    Text("Input email:")
                    TextField("Your email", text: $inputEmail)
                        .autocorrectionDisabled()
                }
                HStack {
                    Text("Input phone:")
                    TextField("Your phone", text: $inputPhone)
                        .autocorrectionDisabled()
                }
            }
            
            Button {
                let push = Customer(id: "", name: inputName, email: inputEmail, phone: inputPhone)
                createDataViewModel.createData(customer: push)
                dismiss()
            } label: {
                Text("Send")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    CreateDataView()
}
