// @generated from OpenAPI spec — do not edit directly
import Foundation

public struct UpdateAccountEntropyRequest: Codable, Sendable {
    public var autoPostponePeriodInDays: Int32?

    public init(autoPostponePeriodInDays: Int32? = nil) {
        self.autoPostponePeriodInDays = autoPostponePeriodInDays
    }
}
