//
//  ImageViewModel.swift
//  SwiftUi
//
//  Created by Atul Tiwari on 06/09/25.
//

import Foundation
import SwiftUI

class ImageViewModel {

    @Published var imageModel = [ImageModel]()
    func loadData() {
        guard let url = URL(string: "https://picsum.photos/v2/list") else {
            print("Invalid Url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let modelData = try? JSONDecoder().decode(
                [ImageModel].self,
                from: data!
            )

            DispatchQueue.main.async {
                if let model = modelData {
                    self.imageModel = model
                }
            }

        }.resume()
    }

}
