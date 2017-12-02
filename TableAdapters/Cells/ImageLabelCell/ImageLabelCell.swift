//
//  StringConfigurableCell.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 11/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

typealias ImageTextDisplayItem = (imageUrl: URL, text: String)

class ImageLabelCell: UITableViewCell, TableAdapterCell {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func configure(with item: ImageTextDisplayItem) {
        label.text = item.text
        imgView.image = nil
        indicator.startAnimating()
        DispatchQueue.global().async { [weak self] in
            defer {
                DispatchQueue.main.async {
                    self?.indicator.stopAnimating()
                }
            }
            guard let data = try? Data(contentsOf: item.imageUrl), let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.imgView.image = image
            }
        }
    }
    
}
