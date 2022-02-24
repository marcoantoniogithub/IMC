import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textWeight: UITextField!
    @IBOutlet weak var textHeight: UITextField!
    @IBOutlet weak var viewResult: UIView!
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    
    var IMC: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func Calculate(_ sender: Any) {
        if let weight = Double(textWeight.text!), let height = Double(textHeight.text!) {
            IMC = weight / (height * height)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = "20"
        var img: String = "magreza"
        
        switch IMC {
            case 0..<16:
                result = "Magreza"
                img = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                img = "magreza"
            case 18.5..<25:
                result = "Peso ideal"
                img = "ideal"
            case 25..<30:
                result = "Sobre peso"
                img = "sobre"
            default:
                result = "Obesidade"
                img = "obesidade"
        }
        labelResult.text = "\(Int(IMC)): \(result)"
        imageResult.image = UIImage(named: img)
        viewResult.isHidden = false
        view.endEditing(true)
    }
}

