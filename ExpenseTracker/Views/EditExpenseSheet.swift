import SwiftUI

struct EditExpenseSheet: View {
  @Environment(\.dismiss) private var dismiss
  
  @Bindable var expense: Expense
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Expense Name", text: $expense.name)
        DatePicker("Date", selection: $expense.date, displayedComponents: .date)
        TextField("Value", value: $expense.value, format: .currency(code: "PKR"))
          .keyboardType(.decimalPad)
      }
      .navigationTitle("Update Expense")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .topBarTrailing) {
          Button("Done") {
            dismiss()
          }
        }
      }
    }
  }
}
