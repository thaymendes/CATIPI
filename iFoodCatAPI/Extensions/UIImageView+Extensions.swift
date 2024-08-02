//
//  UIImageView.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 29/07/24.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL, placeholder: UIImage? = nil, showLoading: Bool = false) {
        image = placeholder

        if showLoading {
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.center = center
            addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if showLoading {
                    self.subviews.compactMap { $0 as? UIActivityIndicatorView }.forEach { $0.removeFromSuperview() }
                }
            }

            guard let data = data, error == nil, let image = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
