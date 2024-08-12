import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  
  @Query(sort: \Expense.date) private var expenses: [Expense] = []
  
  @State private var expenseToEdit: Expense?
  @State private var isShowingItemState = false
  
  var body: some View {
    NavigationStack {
      List() {
        ForEach(expenses) { expense in
          ExpenseItem(expense: expense)
            .onTapGesture {
              expenseToEdit = expense
            }
        }
        .onDelete { IndexSet in
          for index in IndexSet {
            modelContext.delete(expenses[index])
          }
        }
      }
      .navigationTitle("Expenses")
      .navigationBarTitleDisplayMode(.large)
      .sheet(isPresented: $isShowingItemState) {
        NewExpenseSheet()
      }
      .sheet(item: $expenseToEdit) { expense in
        EditExpenseSheet(expense: expense)
      }
      .toolbar {
        if !expenses.isEmpty {
          Button("Add Expenses", systemImage: "plus") {
            isShowingItemState = true
          }
        }
      }
      .overlay {
        if expenses.isEmpty {
          ContentUnavailableView(label: {
            Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
          }, description: {
            Text("Add some expenses to get started.")
          }, actions: {
            Button("Add Expenses") {
              isShowingItemState = true
            }
          })
          .offset(y: -64)
        }
      }
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: [Expense.self], inMemory: true)
}
