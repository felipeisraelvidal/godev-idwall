import UIKit

class MentorTableViewCell: UITableViewCell {

    static let identifier = "MentorTableViewCell"
    
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.cornerRadius = 27.5
        photoImageView.clipsToBounds = true
    }
    
    // MARK: - Public methods
    
    func configure(with model: Mentor) {
        
        photoImageView.loadImage(from: model.photo)
        
        nameLabel.text = model.name
        companyLabel.text = model.company.name
        
    }
    
}
