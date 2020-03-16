import UIKit
import Alamofire

protocol JsonControllerDelegate {
    func callBackAfterDownload()
}
class JsonController: NSObject {
    
    var delegate : JsonControllerDelegate?

    func callAPI() {
        
        AF.request("https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow").response { response in
            debugPrint(response)
            let dataNew = String(data: response.data!, encoding: String.Encoding.utf8)
            if let data = dataNew!.data(using: .utf8) {
                PersistentDataModel.shared().jsonData = try! JSONDecoder().decode(BaseClass.self, from: data)
                self.delegate?.callBackAfterDownload()
            }
        }
    }
}
