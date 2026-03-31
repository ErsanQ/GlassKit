import SwiftUI

/// A view modifier that applies a glassmorphism effect.
@MainActor
public struct GlassModifier: ViewModifier {
    let blurRadius: CGFloat
    let opacity: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .background(
                GlassView(blurRadius: blurRadius, opacity: opacity) {
                    EmptyView()
                }
            )
    }
}

public extension View {
    /// Applies a glassmorphism effect to the view.
    @MainActor
    func glass(blurRadius: CGFloat = 20, opacity: CGFloat = 0.2) -> some View {
        modifier(GlassModifier(blurRadius: blurRadius, opacity: opacity))
    }
}
