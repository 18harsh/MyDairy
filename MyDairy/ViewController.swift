import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MyDairy"
        let icon = UIImage(systemName: "plus") // SF Symbol icon
        let rightBarButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(plusIconTapped))
        
        // Add the button to the right side of the navigation bar
        navigationItem.rightBarButtonItem = rightBarButton
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15) // Equal padding on all sides
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: (view.frame.width - 40) / 2, height: 100) // Adjust width and height as needed
        
        let cellWidth = (view.frame.width - 40) / 2 // 3 columns with 10pt padding on each side
        layout.itemSize = CGSize(width: cellWidth, height: 150) // Adjust height as needed
        
        // Create the collection view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }

    @objc func plusIconTapped() {
        let containerVC = MDCardViewController()
        let navController = UINavigationController(rootViewController: containerVC)
        navController.modalPresentationStyle = .overFullScreen
        present(navController, animated: true, completion: nil)
    }
    
    
    // UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 // Number of items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.configure(with: "\(indexPath.item + 1)")
        return cell
    }
    
}
