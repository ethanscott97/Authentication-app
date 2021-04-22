//
//  PictureCollectionViewController.swift
//  Authentication
//
//  Created by Ethan Scott on 4/22/21.
//

import UIKit

class PictureCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    var displayedPicture: [VerifyImage] = []
    var targetedPicture: VerifyImage?
    var selectedGroup = "buses"

    override func viewDidLoad() {
        super.viewDidLoad()
        shufflePictures(group: selectedGroup)

    }
    
    //MARK: - Helper Methods
    func shufflePictures(group: String) {
        if group == "buses" {
            let shuffledBusGroup = VerifyImageController.buses.shuffled()
            let busGroup = shuffledBusGroup.prefix(3)
            displayedPicture = Array(busGroup)
            targetedPicture = VerifyImageController.animals.randomElement()
        } else {
            let shuffledAnimalGroup = VerifyImageController.animals.shuffled()
            let animalGroup = shuffledAnimalGroup.prefix(3)
            displayedPicture = Array(animalGroup)
            targetedPicture = VerifyImageController.buses.randomElement()
        }
        updateViews()
    }

    func updateViews() {
        guard let picture = targetedPicture else {return}
        displayedPicture.append(picture)
        displayedPicture.shuffle()
        self.title = "Find the \(picture.name)"
        collectionView.reloadData()
    }
    
    func sentAlert(picture: VerifyImage) {
        let success = picture == targetedPicture
        let alertController = UIAlertController(title: success ? "Such Wisdom" : "You are not intelligent", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shufflePictures(group: self.selectedGroup)
        }
        alertController.addAction(doneAction)
        if success {
            alertController.addAction(shuffleAction)
        }
        present(alertController, animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilterVC" {
            guard let destination = segue.destination as? FilterViewController else {return}
            
            destination.delegate = self
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedPicture.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath) as? PictureCollectionViewCell else {return UICollectionViewCell()}
    
        let picture = displayedPicture[indexPath.row]
        cell.picture = picture
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let picture = displayedPicture[indexPath.row]
        sentAlert(picture: picture)
        
    }

}//End of class

extension PictureCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 20, height: width + 30)
    }
}//end of extension

extension PictureCollectionViewController: FilterSelectionDelegate {
    func groupWasSelected(group: String) {
        selectedGroup = group
        shufflePictures(group: group)
    }
}//end of extension
