//
//  MovieDetailsTableViewCell.swift
//  PhonePe Task
//
//  Created by Dheeraj Bhavsar on 30/10/21.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    
    class var identifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        thumbnailImageView.layer.cornerRadius = 12
    }
    
    func configure(with movie: Movie) {
        releaseDateLabel.text = movie.releaseDate
        ratingLabel.text = "\(movie.voteAverage)"
        overviewLabel.text = movie.overview
        guard let posterURL = URLs.getURL(forImage: movie.posterPath) else { return }
        thumbnailImageView.sd_setImage(with: posterURL)
    }
    
}
