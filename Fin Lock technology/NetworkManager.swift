//
//  NetworkManager.swift
//  Fin Lock technology
//
//  Created by Sneh on 15/10/23.
//

import Foundation

class NetworkManager {
  

    func fetchCountries(comp: @escaping(_ data:DataModel?) -> ()) {
        
        defer {
            print("function")
        }
        let url = URL(string: "https://countriesnow.space/api/v0.1/countries")
        URLSession.shared.dataTask(with: url!) { data,response,error in 
        
//        let url = URL(string: "https://countriesnow.space/api/v0.1/countries")
//        URLSession.shared.dataTask(with: url!) {data,response, error in
//            
            if let  error{
                print (error.localizedDescription)
                return
            }
            if let data {
               let decoder = JSONDecoder()
                do{
                    let data = try decoder.decode(DataModel.self , from:data )
                     print(data)
                    comp(data)
                   
                } catch{
                    print (error.localizedDescription)
                }
               
            }
            
        }.resume()
     
    }
    
    
    
}





