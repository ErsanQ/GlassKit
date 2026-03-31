import SwiftUI

public extension View {
    /// Applies a premium glassmorphic background to the view.
    ///
    /// - Returns: A view wrapped with a `GlassSurface` background.
    @MainActor
    func glassBackground() -> some View {
        self.modifier(GlassModifier())
    }
}

/// An internal ViewModifier that applies the `GlassSurface` style.
@MainActor
private struct GlassModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(GlassSurface())
    }
}
