//
//  UpdateDataViewModel.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import Foundation
import Alamofire

class UpdateDataViewModel : ObservableObject {
    @Published var customer: Customer?
    
    func updateData(customer: Customer) {
        print(customer)
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(customer)
        
        AF.upload(jsonData!, to: "http://localhost/php-api/customers/update.php?id=\(customer.id)", method: .put)
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
    
    func getDataById(customerId: Int) {
        AF.request("http://localhost/php-api/customers/read.php?id=\(customerId)", method: .get).responseData { response in
            print(response)
            
            switch response.result {
            case .success(let success):
                guard let decodedData = try? JSONDecoder().decode(SingleCustomerResponse.self, from: success) else {
                    return
                }
                
                if let data = decodedData.data {
                    self.customer = decodedData.data
                } else {
                    self.customer = nil
                }
                
            case .failure :
                return
            }
        }
    }
}
