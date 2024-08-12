import Foundation
import SwiftData

@Model
final class Expense {
  @Attribute(.unique) var name: String
  var value: Double
  var date: Date
  
  init(name: String, value: Double, date: Date) {
    self.name = name
    self.value = value
    self.date = date
  }
}
