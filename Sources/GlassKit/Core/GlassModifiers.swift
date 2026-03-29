import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// A view that represents a blurring effect using UIKit or AppKit.
public struct BlurView: View {
    let style: UIBlurEffect.Style
    
    public init(style: UIBlurEffect.Style = .systemUltraThinMaterial) {
        self.style = style
    }
    
    public var body: some View {
        #if os(iOS)
        Representable(style: style)
        #else
        Color.black.opacity(0.1).blur(radius: 20)
        #endif
    }
}

#if os(iOS)
private struct Representable: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
#endif

public extension View {
    /// Applies a glassmorphism effect to the view.
    /// - Parameters:
    ///   - cornerRadius: The radius of the corners.
    ///   - opacity: The intensity of the glass effect.
    ///   - shadow: Whether to add a subtle shadow.
    /// - Returns: A glassmorphic view.
    func glass(cornerRadius: CGFloat = 20, opacity: CGFloat = 0.1, shadow: Bool = true) -> some View {
        self
            .padding()
            .background(
                BlurView()
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(
                                LinearGradient(
                                    colors: [.white.opacity(0.5), .white.opacity(0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1.5
                            )
                    )
            )
            .cornerRadius(cornerRadius)
            .shadow(color: shadow ? Color.black.opacity(0.1) : .clear, radius: 10, x: 0, y: 10)
    }
}
