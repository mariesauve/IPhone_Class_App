import SwiftUI
import UIKit

struct ExtraView: View {
    @State var currentTab: Tab = .ContentView

    init() {
        UITabBar.appearance().isHidden = true
    }

    @Namespace var animation

    var body: some View {
        TabView(selection: $currentTab) {
            ContentView()
                .tag(Tab.ContentView)
            Text("Search View")
                .tag(Tab.Search)
            Text("Notification View")
                .tag(Tab.Notification)
            Text("Cart View")
                .tag(Tab.Cart)
            ProfileView()
                .tag(Tab.ProfileView)
        }
        .overlay(
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
            }
            .padding(.vertical)
            .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
            .background(Color(.brown)),
            alignment: .bottom
        )
     
        .ignoresSafeArea(.all, edges: .bottom)
    }

    func TabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }) {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                    ZStack {
                        if currentTab == tab {
                            MaterialEffect(style: .light)
                                .clipShape(Circle())
                                .matchedGeometryEffect(id: tab.rawValue, in: animation)
                        }
                        
                    }
                }
            }
            
        }
        .frame(height: 40)
    }
}

enum Tab: String, CaseIterable {
    case ContentView = "house"
    case Search = "magnifyingglass.circle"
    case Notification = "bell"
    case Cart = "bag"
    case ProfileView = "person"

    var TabName: String {
        switch self {
        case .ContentView: return "ContentView"
        case .Search: return "Search"
        case .Notification: return "Notification"
        case .Cart: return "Cart"
        case .ProfileView: return "ProfileView"
        }
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // later
    }
}

#Preview {
    ExtraView()
}
