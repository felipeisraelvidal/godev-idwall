import UIKit

extension UIViewController {
    
    func presentAlertController(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let doneAction = UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: nil
        )
        alertController.addAction(doneAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
