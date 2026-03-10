// @generated from OpenAPI spec — do not edit directly
import Foundation

public struct CreateBoardRequest: Codable, Sendable {
    public var allAccess: Bool?
    public var autoPostponePeriodInDays: Int32?
    public let name: String
    public var publicDescription: String?

    public init(
        allAccess: Bool? = nil,
        autoPostponePeriodInDays: Int32? = nil,
        name: String,
        publicDescription: String? = nil
    ) {
        self.allAccess = allAccess
        self.autoPostponePeriodInDays = autoPostponePeriodInDays
        self.name = name
        self.publicDescription = publicDescription
    }
}
