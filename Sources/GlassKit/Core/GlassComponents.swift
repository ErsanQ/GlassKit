import SwiftUI

/// A view that renders a premium frosted glass effect.
///
/// `GlassSurface` uses system blur effects (where available) and semi-transparent
/// white fills to create a professional glassmorphism look. It handles platform
/// differences by falling back to high-opacity shapes on platforms without native blurs.
///
/// ## Usage
/// ```swift
/// GlassSurface()
///     .frame(width: 300, height: 200)
///     .overlay(Text("Glass Card"))
/// ```
@MainActor
public struct GlassSurface: View {
    
    /// Creates a new GlassSurface instance.
    public init() {}
    
    public var body: some View {
        ZStack {
            #if os(iOS) || os(tvOS) || os(visionOS)
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
            #elseif os(macOS)
            VisualEffectView() // NSVisualEffectView wrapper
            #else
            Color.white.opacity(0.1)
            #endif
            
            Color.white.opacity(0.05)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
    }
}

#if os(iOS) || os(tvOS) || os(visionOS)
/// An internal UIViewRepresentable that wraps `UIVisualEffectView` for SwiftUI.
@MainActor
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: Context) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { uiView.effect = effect }
}
#endif

#if os(macOS)
/// An internal NSViewRepresentable that wraps `NSVisualEffectView` for SwiftUI.
@MainActor
struct VisualEffectView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .withinWindow
        view.state = .active
        return view
    }
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
#endif
