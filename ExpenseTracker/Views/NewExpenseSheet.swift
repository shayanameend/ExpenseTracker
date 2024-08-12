import SwiftUI

struct NewExpenseSheet: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var modelContext
  
  @State private var name: String = ""
  @State private var value: Double = 0
  @State private var date: Date = .now
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Expense Name", text: $name)
        DatePicker("Date", selection: $date, displayedComponents: .date)
        TextField("Value", value: $value, format: .currency(code: "PKR"))
          .keyboardType(.decimalPad)
      }
      .navigationTitle("New Expense")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
        }
        ToolbarItemGroup(placement: .topBarTrailing) {
          Button("Save")  {
            let expense = Expense(name: name, value: value, date: date)
            modelContext.insert(expense)
            
            do {
              try modelContext.save()
              
              dismiss()
            } catch {
              fatalError("Could not save ModelContext: \(error)")
            }
          }
        }
      }
    }
  }
}
