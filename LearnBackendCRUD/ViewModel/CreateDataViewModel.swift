//
//  CreateDataViewModel.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import Foundation
import Alamofire

class CreateDataViewModel : ObservableObject {
    @Published var customer: Customer?
    
    func createData(customer: Customer) {
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(customer.name.data(using: .utf8)!, withName: "name")
            multipartFormData.append(customer.email.data(using: .utf8)!, withName: "email")
            multipartFormData.append(customer.phone.data(using: .utf8)!, withName: "phone")
        }, to: "http://localhost/php-api/customers/create.php", method: .post)
        .response { response in
            print("test")
            switch response.result {
            case .success(let success):
                let stringDecoded = String(data: success!, encoding: .utf8)
                print(stringDecoded)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
