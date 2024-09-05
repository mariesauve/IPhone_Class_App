import SwiftUI

struct ContentView: View {
    
    let itemsByCategory = Dictionary(grouping: bentoItems, by: { $0.category })
    @State private var selectedBento: [String: DataItem] = [:]
    
    var body: some View {
        NavigationView {
            VStack {

                HStack {
                    // ExtraView()
                    Image("qearl-hu-0aQuUvhlvvk-unsplash")
                        .resizable()
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 200, height: 150)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 5)
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                }
                
                VStack(alignment: .leading) {
                    ForEach(itemsByCategory.keys.sorted(), id: \.self) { category in
                        if let selectedItem = selectedBento[category] {
                            HStack() {
                                selectedItem.image
                                    .resizable()
                                    .frame(width: 45.0, height: 45.0)
                                    .alignmentGuide(.leading) { $0[.bottom] }
                                
                                HStack {
                                    Text("\(category):")
                                        .font(.title3)
                                        .multilineTextAlignment(.leading)
                                        .bold()
                                        
                                    Text(selectedItem.name)
                                        .font(.title3)
                                        .multilineTextAlignment(.leading)
                                }
                                .alignmentGuide(.listRowSeparatorLeading) { $0[.bottom] }
                            }
                            .padding(.top)
                        } else {
                            HStack {
                                Text("\(category):")
                                    .font(.title3)
                                    .multilineTextAlignment(.leading)
                                    .bold()
                                Text(" ?...")
                                    .font(.title3)
                            }
                            .padding(.top)
                        }
                    }
                }
                
                HStack {
                    Button(action: generateRandomBento) {
                        HStack {
                            Image(systemName: "fork.knife.circle")
                                .foregroundColor(Color(hue: 1.0, saturation: 0.008, brightness: 0.384))
                            Text("Roulette")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        }
                        .padding(.all)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 2)
                        )
                    }
                    
                    NavigationLink(destination: CustomizeView()) {
                        HStack {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(Color.gray)
                            Text("Custom")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(Color.blue)
                            
                        }
                        .padding(.all)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                    }
                }
                .padding(.top)
            }
            .padding()
        }
    
    }
    
    func generateRandomBento() {
        for (category, items) in itemsByCategory {
            selectedBento[category] = items.randomElement()
        }
    }
}

#Preview {
    ContentView()
}
