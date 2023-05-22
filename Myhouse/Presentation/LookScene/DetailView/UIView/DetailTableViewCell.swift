//
//  DetailTableViewCell.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/22.
//

import UIKit

import SnapKit

final class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    
    let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Card.img_card03
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        self.addSubview(imgView)
        
        imgView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

