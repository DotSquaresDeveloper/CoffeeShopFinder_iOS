
import Foundation
import UIKit

class JobsTableViewCell :UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lbldistance: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib();
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true);
        
    }
}

