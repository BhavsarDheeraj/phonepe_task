//
//  MovieTableViewCell.swift
//  PhonePe Task
//
//  Created by Dheeraj Bhavsar on 30/10/21.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    class var identifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        thumbnailImageView.layer.cornerRadius = 8
    }
    
    func configure(with movie: Movie) {
        nameLabel.text = movie.title
        descriptionLabel.text = movie.overview
        guard let posterURL = URLs.getURL(forImage: movie.posterPath) else { return }
        thumbnailImageView.sd_setImage(with: posterURL)
    }
    
}
