import SwiftUI

struct ExpenseItem: View {
  let expense: Expense
  
  var body: some View {
    HStack {
      Text(expense.date, format: .dateTime.month(.abbreviated).day())
        .frame(width: 72, alignment: .leading)
      Text(expense.name)
      Spacer()
      Text(expense.value, format: .currency(code: "PKR"))
    }
  }
}
