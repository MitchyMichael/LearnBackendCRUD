//
//  DeleteDataViewModel.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 08/11/23.
//

import Foundation
import Alamofire

class DeleteDataViewModel : ObservableObject {
    @Published var customers: [Customer] = []
    
    func deleteData(inputId: Int) {
        AF.request("http://localhost/php-api/customers/delete.php?id=\(inputId)", method: .delete).responseData { response in
            switch response.result {
            case .success(let success):
                guard let decodedData = try? JSONDecoder().decode(CustomersResponse.self, from: success) else {
                    return
                }
                self.customers = decodedData.data
                let stringDecoded = String(data: success, encoding: .utf8)
                print(success)
                print(stringDecoded)
            case .failure (let failure):
                print(failure)
                return
            }
        }
    }
}
