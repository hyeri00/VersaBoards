//
//  GeneralBoardTableViewCell.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/12/23.
//

import UIKit

class GeneralBoardTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.chocolate_700
        label.font = Font.Typography.medium16
        return label
    }()
    
    let clipImage: UIImageView = {
        let imageView = UIImageView()
        let image = IconImage.attachment
        imageView.image = image.image
        return imageView
    }()
    
    let newBadgeImage: UIImageView = {
        let imageView = UIImageView()
        let image = IconImage.badge_new
        imageView.image = image.image
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.grey_500
        label.font = Font.Typography.light12
        return label
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.grey_500
        label.font = Font.Typography.light12
        return label
    }()
    
    private let viewsImage: UIImageView = {
        let imageView = UIImageView()
        let image = IconImage.eye
        imageView.image = image.image
        return imageView
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.grey_500
        label.font = Font.Typography.light12
        return label
    }()
    
    private lazy var badgeStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [clipImage,
                                                  newBadgeImage])
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var subStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameLabel,
                                                  dayLabel])
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var viewsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [viewsImage,
                                                  viewsLabel])
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fillProportionally
        return view
    }()
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        self.backgroundColor = .white
        self.selectionStyle = .none
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.badgeStackView)
        self.addSubview(self.subStackView)
        self.addSubview(self.viewsStackView)
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(20)
        }
        self.badgeStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
        }
        
        self.subStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalTo(20)
        }
        
        self.viewsStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalTo(subStackView.snp.trailing).offset(10)
        }
        
        self.viewsImage.snp.makeConstraints {
            $0.width.height.equalTo(16)
        }
    }
}
