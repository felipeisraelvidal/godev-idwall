import UIKit

class MentorsViewController: UIViewController {
    
    private var mentors: [Mentor] = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        registerCells()
        fetchMentors()
    }
    
    // MARK: - Private methods
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerCells() {
        
        let mentorCell = UINib(nibName: MentorTableViewCell.identifier, bundle: nil)
        tableView.register(mentorCell, forCellReuseIdentifier: MentorTableViewCell.identifier)
        
    }
    
    private func fetchMentors() {
        guard let url = URL(string: "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84") else {
            self.presentAlertController(title: "Oops...", message: "URL inválida!")
            return
        }
        
        NetworkManager.shared.request(of: [Mentor].self, url: url) { [weak self] result in
            switch result {
            case .success(let mentors):
                self?.mentors = mentors
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                self?.presentAlertController(title: "Oops...", message: error.localizedDescription)
            }
        }
    }

}

extension MentorsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mentors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MentorTableViewCell.identifier, for: indexPath) as? MentorTableViewCell else {
            return UITableViewCell()
        }
        
        let mentor = mentors[indexPath.row]
        cell.configure(with: mentor)
        
        return cell
    }
    
}
