import SwiftUI

/// A component that renders a stylized glass-like container.
public struct GlassCard<Content: View>: View {
    private let content: Content
    private let cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat = 24, @ViewBuilder content: () -> Content) {
        self.cornerRadius = cornerRadius
        self.content = content()
    }
    
    public var body: some View {
        content
            .glass(cornerRadius: cornerRadius)
    }
}

/// A button styled with glassmorphism interaction.
public struct GlassButton: View {
    let title: String
    let action: () -> Void
    
    public init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .glass(cornerRadius: 16)
        }
        .scaleEffect(1.0)
        .transition(.scale)
    }
}

/// A colorful gradient background for glassmorphism demonstration.
public struct GlassBackground: View {
    public init() {}
    public var body: some View {
        ZStack {
            #if os(iOS)
            Circle()
                .fill(Color.blue.opacity(0.8))
                .frame(width: 400, height: 400)
                .offset(x: -150, y: -250)
                .blur(radius: 80)
            
            Circle()
                .fill(Color.purple.opacity(0.6))
                .frame(width: 350, height: 350)
                .offset(x: 150, y: 300)
                .blur(radius: 60)
            
            Circle()
                .fill(Color.pink.opacity(0.5))
                .frame(width: 300, height: 300)
                .offset(x: -50, y: 100)
                .blur(radius: 100)
            #else
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            #endif
        }
        .ignoresSafeArea()
    }
}
