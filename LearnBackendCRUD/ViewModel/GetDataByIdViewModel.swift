//
//  GetDataByIdViewModel.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import Foundation
import Alamofire

class GetDataByIdViewModel : ObservableObject {
    @Published var customer: Customer?
    
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
