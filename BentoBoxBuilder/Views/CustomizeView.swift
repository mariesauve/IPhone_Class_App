import SwiftUI
import UIKit

struct CustomizeView: View {
    
    let itemsByCategory = Dictionary(grouping: bentoItems, by: { $0.category })
    @State private var selectedItems: [String: DataItem] = [:]
    @State private var showSaveAlert = false
    
    var body: some View {
        NavigationView {
         
                VStack {
                    ForEach(itemsByCategory.keys.sorted(), id: \.self) { category in
                        HStack {
                            Text("\(category):")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .bold()
                                .padding(.leading, 12.0)
                            Spacer()
                            
                            Picker("Select an item", selection: Binding(
                                get: { selectedItems[category]?.name ?? "Select" },
                                set: { newValue in
                                    if let item = itemsByCategory[category]?.first(where: { $0.name == newValue }) {
                                        selectedItems[category] = item
                                    }
                                }
                            )) {
                                ForEach(itemsByCategory[category] ?? [], id: \.name) { item in
                                    Text(item.name).tag(item.name)
                                }
                            }
                            .pickerStyle(InlinePickerStyle())
                        }
                        .padding([.top, .bottom, .trailing], 5)
                    }
                
                    HStack(alignment: .bottom) {
                        Button(action: saveSelections) {
                            HStack {
                                Image(systemName: "square.and.arrow.down")
                                Text("Save")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            }
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 2)
                            )   }
                        
                        Button(action: {
                            printSelections()
                            shareSelections()
                        }) {
                            HStack {
                                Image(systemName: "printer")
                                Text("Print")
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        }
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                }
                .padding()
                .navigationTitle("Custom Bento")
                .alert(isPresented: $showSaveAlert) {
                    Alert(
                        title: Text("Saved"),
                        message: Text("Your selections have been saved."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .onAppear(perform: loadSelections)
            }
        
    }
    
    func saveSelections() {
        let savedSelections = selectedItems.mapValues { $0.name }
        UserDefaults.standard.set(savedSelections, forKey: "bentoSelections")
        
        showSaveAlert = true
    }
    
    func printSelections() {
        let savedSelections = selectedItems.mapValues { $0.name }
        let textToPrint = savedSelections.map { "\($0): \($1)" }.joined(separator: "\n")
        
        let printController = UIPrintInteractionController.shared
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.jobName = "Bento Selections"
        printController.printInfo = printInfo
        
        let formatter = UISimpleTextPrintFormatter(text: textToPrint)
        printController.printFormatter = formatter
        
       
        if UIApplication.shared.connectedScenes.first is UIWindowScene {
            printController.present(animated: true, completionHandler: nil)
        }
    }
    
    func shareSelections() {
        let savedSelections = selectedItems.mapValues { $0.name }
        let textToShare = savedSelections.map { "\($0): \($1)" }.joined(separator: "\n")
        
        let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func loadSelections() {
        if let loadedSelections = UserDefaults.standard.dictionary(forKey: "bentoSelections") as? [String: String] {
            for (category, itemName) in loadedSelections {
                if let item = itemsByCategory[category]?.first(where: { $0.name == itemName }) {
                    selectedItems[category] = item
                }
            }
            print("Loaded selections: \(loadedSelections)")
        } else {
            print("No selections found.")
        }
    }
}

#Preview {
    CustomizeView()
}
