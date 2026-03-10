// @generated from OpenAPI spec — do not edit directly
import Foundation

public struct UpdateBoardRequest: Codable, Sendable {
    public var allAccess: Bool?
    public var autoPostponePeriodInDays: Int32?
    public var name: String?
    public var publicDescription: String?
    public var userIds: [String]?

    public init(
        allAccess: Bool? = nil,
        autoPostponePeriodInDays: Int32? = nil,
        name: String? = nil,
        publicDescription: String? = nil,
        userIds: [String]? = nil
    ) {
        self.allAccess = allAccess
        self.autoPostponePeriodInDays = autoPostponePeriodInDays
        self.name = name
        self.publicDescription = publicDescription
        self.userIds = userIds
    }
}
