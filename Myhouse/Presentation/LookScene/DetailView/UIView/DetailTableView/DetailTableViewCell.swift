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
    
    var imgId: Int = Int()
    let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let subscribeButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Common.btn_bookMarkUnactived_big, for: .normal)
        return button
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
        imgView.addSubview(subscribeButton)
        imgView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        subscribeButton.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.trailing.bottom.equalToSuperview()
        }
    }
}

