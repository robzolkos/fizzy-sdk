// @generated from OpenAPI spec — do not edit directly
import Foundation

public struct AccountSettings: Codable, Sendable {
    public let cardsCount: Int32
    public let createdAt: String
    public let id: String
    public let name: String
    public var autoPostponePeriodInDays: Int32?

    public init(
        cardsCount: Int32,
        createdAt: String,
        id: String,
        name: String,
        autoPostponePeriodInDays: Int32? = nil
    ) {
        self.cardsCount = cardsCount
        self.createdAt = createdAt
        self.id = id
        self.name = name
        self.autoPostponePeriodInDays = autoPostponePeriodInDays
    }
}
