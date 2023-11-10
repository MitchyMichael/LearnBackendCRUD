//
//  GetDataViewModel.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import Foundation
import Alamofire

class GetDataViewModel : ObservableObject {
    @Published var customers: [Customer] = []
    
    func getAllData() {
        AF.request("http://localhost/php-api/customers/read.php", method: .get).responseData { response in
            print(response)
            
            switch response.result {
            case .success(let success):
                guard let decodedData = try? JSONDecoder().decode(CustomersResponse.self, from: success) else {
                    return
                }
                self.customers = decodedData.data
            case .failure :
                return
            }
        }
    }
}


