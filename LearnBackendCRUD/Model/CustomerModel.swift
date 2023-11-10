//
//  CustomerModel.swift
//  LearnBackendCRUD
//
//  Created by Michael Wijaya Sutrisna on 07/11/23.
//

import Foundation

struct CustomersResponse: Codable {
    let status: Int
    let message: String
    let data: [Customer]
}

struct Customer: Codable, Identifiable {
    let id, name, email, phone: String
}

struct SingleCustomerResponse : Codable {
    let status: Int
    let message: String
    let data: Customer?
}
