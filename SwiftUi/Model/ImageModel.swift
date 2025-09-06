import Foundation

struct ImageModel : Codable, Identifiable{
    var id: String?
    var author: String?
    var downloadUrl : String?
    
    enum CodingKeys :String, CodingKey{
        case id,author
        case downloadUrl = "download_url"
    }
}
