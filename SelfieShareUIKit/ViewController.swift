//
//  ViewController.swift
//  SelfieShareUIKit
//
//  Created by Justin Hold on 3/8/24.
//

import UIKit

class ViewController: UICollectionViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	
	// MARK: - PROPERTIES
	var images = [UIImage]()
	
	

	// MARK: - VIEWDIDLOAD
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		title = "Selfie Share"
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: .camera,
			target: self,
			action: #selector(importPicture)
		)
	}

	// MARK: - OVERRIDE FUNCTIONS
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return images.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageView", for: indexPath)
		if let imageView = cell.viewWithTag(1000) as? UIImageView {
			imageView.image = images[indexPath.item]
		}
		return cell
	}
	
	// MARK: - @OBJC FUNCTIONS
	@objc func importPicture() {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		present(picker, animated: true)
	}
	
	
	// MARK: - FUNCTONS
	func imagePickerController(
		_ picker: UIImagePickerController,
		didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
	) {
		guard let image = info[.editedImage] as? UIImage else { return }
		dismiss(animated: true)
		
		images.insert(image, at: 0)
		collectionView.reloadData()
	}
}

