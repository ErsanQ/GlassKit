import SwiftUI
import GlassKit

struct GlassExampleView: View {
    var body: some View {
        ZStack {
            // Background
            GlassBackground()
            
            VStack(spacing: 40) {
                // Header
                VStack(spacing: 8) {
                    Text("GlassKit")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    Text("The Premium UI for SwiftUI")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                // Card
                GlassCard(cornerRadius: 32) {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Image(systemName: "snowflake")
                                .font(.title)
                            Spacer()
                            Text("ACTIVE")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(4)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Crystal Clear")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Zero boilerplate glassmorphism effect for your views.")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        
                        HStack {
                            UserInfo(name: "Ersan Q", role: "Author")
                            Spacer()
                            Text("v1.0.0")
                                .font(.caption2)
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 250)
                }
                
                // Button
                GlassButton("Get Started") {
                    print("Button Pressed")
                }
                .padding(.horizontal, 50)
            }
            .padding()
        }
    }
}

struct UserInfo: View {
    let name: String
    let role: String
    var body: some View {
        HStack {
            Circle()
                .fill(Color.white.opacity(0.5))
                .frame(width: 32, height: 32)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.caption)
                    .fontWeight(.bold)
                Text(role)
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.6))
            }
        }
    }
}

#Preview {
    GlassExampleView()
}
