// Блок 1

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let images = ["image1", "image2", "image3"]
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = UIImage(named: images[indexPath.row])
        let detailViewController = DetailViewController(image: image)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

class DetailViewController: UIViewController {
    
    private let imageView = UIImageView()
    private var isPulsating = false
    
    init(image: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFit
        
        pulsateAndRotate()
    }
    
    func pulsateAndRotate() {
        UIView.animate(withDuration: 1, animations: {
            self.isPulsating = true
            self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2).rotated(by: .pi / 4)
        }) { _ in
            UIView.animate(withDuration: 1, animations: {
                self.imageView.transform = .identity
            }) { _ in
                if self.isPulsating {
                    self.pulsateAndRotate()
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isPulsating = false
    }
}

// Блок 2

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let images = ["image1", "image2", "image3"]
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = UIImage(named: images[indexPath.row])
        let detailViewController = DetailViewController(image: image)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

class DetailViewController: UIViewController {
    
    private let imageView = UIImageView()
    private var isPulsating = false
    
    init(image: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFit
        
        pulsateAndRotate()
    }
    
    func pulsateAndRotate() {
        UIView.animate(withDuration: 1, animations: {
            self.isPulsating = true
            self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2).rotated(by: .pi / 4)
        }) { _ in
            UIView.animate(withDuration: 1, animations: {
                self.imageView.transform = .identity
            }) { _ in
                if self.isPulsating {
                    self.pulsateAndRotate()
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isPulsating = false
    }
}

// Д.З.

### ViewController.swift:

class FriendsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Friends"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(profileButtonTapped))
    }
    
    @objc func profileButtonTapped() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        let nameLabel = UILabel()
        nameLabel.text = "John Doe"
        nameLabel.textAlignment = .center
        nameLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 30)
        view.addSubview(nameLabel)
        
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 200)
        view.addSubview(imageView)
    }
}

### ContentView.swift:

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: NewsListView()) {
                    Text("Go to News")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct NewsListView: View {
    var body: some View {
        List {
            ForEach(0..<10) { index in
                VStack(alignment: .leading) {
                    Text("News Title \(index + 1)")
                        .font(.headline)
                    Text("Published Date: \(Date())")
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle("News")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}