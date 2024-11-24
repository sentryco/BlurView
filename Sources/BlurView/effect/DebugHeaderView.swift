#if DEBUG && os(macOS)
import SwiftUI
/**
 * Note: Only for macOS
 * - Description: DebugHeaderView is a SwiftUI View component used for displaying a debug header.  It consists of a ZStack with a clear rectangle as the background, a pink rectangle box,  and an overlay rectangle with visual effects. This component is primarily used for debugging purposes.
 */
struct DebugHeaderView: View {
   /**
    * - Important: ⚠️️ It seems best to leave the background color to be decided by the operating system. It matches better with the translucent tint. Custom background colors creates more visible seems.
    * - Fixme: ⚠️️ Look into how this was done in legacy. Legacy supported any custom background color I think.
    */
   var body: some View {
      ZStack(alignment: .top) {
//         Rectangle()
//            .fill(Color.gray.opacity(1))
//            .frame(width: .infinity, height: .infinity)
         Underlay()
         Graphic()
         Overlay()
      }
   }
}
/**
 * Underlay
 * - Important: ⚠️️ This tints the background to the same tint that the translucent cover produces. So that there is near no visible seem between cover and background
 */
struct Underlay: View {
   var body: some View {
      Rectangle()
         .fill(Color.clear.opacity(0))
         .frame(width: .infinity, height: .infinity)
         .visualEffect(material: .headerView, blendingMode: .withinWindow, emphasized: false)
   }
}
/**
 * Graphic element (Bright color)
 */
struct Graphic: View {
   var body: some View {
      Rectangle()
         .fill(.pink.opacity(1))
         .frame(width: 100, height: 100, alignment: .top)
   }
}
/**
 * Overlay
 * - Description: Matches best if no custom background color is uses. This is a current limitation that might be improved in the future
 * - Fixme: ⚠️️ make this a viewmodifier instead?
 */
struct Overlay: View {
   var body: some View {
      Rectangle()
         .foregroundColor(Color.clear.opacity(0))
      // .foregroundColor(.clear)
      // .fill(.clear.opacity(1))
         .frame(width: .infinity, height: 80, alignment: .top)
      // .presentationBackground(.ultraThinMaterial)
      // .background(.gray.opacity(1))
         .visualEffect(material: .headerView, blendingMode: .withinWindow, emphasized: false)
      // .background(.ultraThinMaterial)
      // .background(VisualEffectView())
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 400, height: 200)) {
   DebugHeaderView()
}
#endif
