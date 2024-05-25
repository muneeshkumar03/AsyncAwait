//
//  ViewController.swift
//  AsyncAwait
//
//  Created by Muneesh Kumar on 25/05/24.
//

import UIKit

class ViewController: UIViewController {
let apiManager = APIManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            await getProductList()
        }
    }
}

extension ViewController {
    func getProductList() async {

        await apiManager.sendRequest(method: "get", endPoint: "products", parameters: InputModel()) {[weak self] (result: Result<ProductListModel, Error>) in
            switch result {
            case .success(let model):
                print("success \(model)")
            case .failure(let failure):
                print("failure \(failure)")
            }
        }
    }
}

