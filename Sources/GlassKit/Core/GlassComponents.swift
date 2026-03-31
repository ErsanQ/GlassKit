import SwiftUI

/// A view that applies a glassmorphism effect to its content.
@MainActor
public struct GlassView<Content: View>: View {
    private let content: Content
    private let blurRadius: CGFloat
    private let opacity: CGFloat
    
    public init(blurRadius: CGFloat = 20, opacity: CGFloat = 0.2, @ViewBuilder content: () -> Content) {
        self.blurRadius = blurRadius
        self.opacity = opacity
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            #if os(iOS)
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
                .opacity(opacity)
            #else
            Color.black.opacity(opacity).blur(radius: blurRadius)
            #endif
            
            content
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
    }
}

#if os(iOS)
@MainActor
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: Context) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { uiView.effect = effect }
}
#endif
