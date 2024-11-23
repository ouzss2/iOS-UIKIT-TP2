//
//  DetailsViewController.swift
//  Tp2UIKIT
//
//  Created by Tekup-mac-1 on 23/11/2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var mylab: UILabel!
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var descriptions: UITextView!
    
    var imageurl = "";
    var descriptiontext = "" ;
    var titletext = "";
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mylab.text = titletext;
        descriptions.text = descriptiontext;
        if let imageUrl = URL(string: imageurl) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        self.myimage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
