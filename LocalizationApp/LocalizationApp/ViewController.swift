//
//  ViewController.swift
//  LocalizationApp
//
//  Created by Morgan Collino on 12/9/19.
//  Copyright © 2019 Morgan Collino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var ctaButton: UIButton!
    @IBOutlet private weak var dismissButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

    func configureView() {
        addBlur()
        containerView.addDropShadow(withRoundedCorners: true)
        configureViewText()
    }

    func configureViewText() {
        let name = "Morgan"
        let numberOfSongs = 42
        let playlistName = "Party2020"

        titleLabel.text = PopupStrings.title
        descriptionLabel.text = PopupStrings.description(userName: name, numberOfSongs: numberOfSongs, playlistName: playlistName)
        ctaButton.setTitle(PopupStrings.cta, for: .normal)
        dismissButton.setTitle(PopupStrings.ctaDismiss, for: .normal)
    }
}

private extension ViewController {

    func addBlur() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        // 3
        let blurView = UIVisualEffectView(effect: blurEffect)
        // 4
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 1)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}

extension UIView {

    public typealias DropShadowControls = (hide: () -> Void, show: () -> Void)

    @discardableResult
    public func addDropShadow(withRoundedCorners roundCorners: Bool = true) -> DropShadowControls {
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.size.width + 3, height: bounds.size.height + 3))
        layer.cornerRadius = roundCorners ? 12.0 : 0
        layer.shadowColor = UIColor.lightGray
            .cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        layer.shadowOpacity = 1

        layer.shadowRadius = 12
        layer.shadowPath = shadowPath.cgPath
        layer.masksToBounds = false

        return (hide: { [weak layer] in layer?.shadowOpacity = 0 },
                show: { [weak layer] in layer?.shadowOpacity = 0.27 })
    }
}
