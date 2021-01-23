//
//  ViewController.swift
//  CGAffineTransform
//
//  Created by trungnghia on 23/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var segmentedControlView: UISegmentedControl!
    
    private var currentRotationValue: CGFloat = 0
    private var rotationStaus = RotationType.normal
    
    enum RotationType {
        case normal
        case revert
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func resetDidTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.imageView.transform = CGAffineTransform.identity
            self.sliderView.value = 1
            self.segmentedControlView.selectedSegmentIndex = 0
            self.currentRotationValue = 0
        }
    }
    
    @IBAction func sliderDidScroll(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        imageView.transform = CGAffineTransform(scaleX: currentValue, y: currentValue)
    }
    
    @IBAction func segmentedControlDidTap(_ sender: UISegmentedControl) {
        let action = segmentedControlView.selectedSegmentIndex
        UIView.animate(withDuration: 0.4) {
            switch action {
            case 0:
                self.imageView.transform = CGAffineTransform.identity
            case 1:
                self.imageView.transform = CGAffineTransform(translationX: -100, y: 0)
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: 100, y: 0)
            case 3:
                self.imageView.transform = CGAffineTransform(translationX: 0, y: 100)
            default:
                self.imageView.transform = CGAffineTransform(translationX: 0, y: -100)
            }
        }
    }
    
    @IBAction func rotationDidTap(_ sender: Any) {
        currentRotationValue += CGFloat.pi / 2
        UIView.animate(withDuration: 0.4) {
            self.imageView.transform = CGAffineTransform(rotationAngle: self.currentRotationValue)
            self.rotationStaus = .normal
        }
    }
    
    @IBAction func rotationRevertDidTap(_ sender: Any) {
        currentRotationValue -= CGFloat.pi / 2
        UIView.animate(withDuration: 0.4) {
            self.imageView.transform = CGAffineTransform(rotationAngle: self.currentRotationValue)
            self.rotationStaus = .revert
        }
    }
    
    @IBAction func customTransformDidTap(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.imageView.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: 0)
        }
    }
}
