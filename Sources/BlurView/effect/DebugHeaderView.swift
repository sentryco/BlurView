#if DEBUG && os(macOS)
import SwiftUI
/**
 * Note: Only for macOS
 * - Description: DebugHeaderView is a SwiftUI View component used for displaying a debug header.  It consists of a ZStack with a clear rectangle as the background, a pink rectangle box,  and an overlay rectangle with visual effects. This component is primarily used for debugging purposes.
 * - Fixme: ⚠️️ Move to debug folder? 👈
 * - Fixme: ⚠️️ Check legacy how headers look, begin making headers for iPad and macos etc 👈
 * - Fixme: ⚠️️ get things looking good for detail etc 👈 (keep in mind that we need to add a rounded header design as well)
 */
struct DebugHeaderView: View {
   /**
    * - Fixme: ⚠️️ Move each into a seperate var?
    */
   var body: some View {
      ZStack(alignment: .top) {
         // black background
         Rectangle()
            .fill(Color.clear.opacity(0))
            .frame(width: .infinity, height: .infinity)
            .visualEffect(material: .headerView, blendingMode: .withinWindow, emphasized: false)
         // orange box
         Rectangle()
            .fill(.pink.opacity(1))
            .frame(width: 100, height: 100, alignment: .top)
         // overlay
         Rectangle()
            .foregroundColor(Color.clear.opacity(0))
         // .foregroundColor(.clear)
         // .fill(.clear.opacity(1))
            .frame(width: .infinity, height: 80, alignment: .top)
         // .presentationBackground(.ultraThinMaterial)
         // .background(.gray.opacity(1))
         // - Fixme: ⚠️️⚠️️⚠️️ use this for login and onboarding overlay etc:
            .visualEffect(material: .headerView, blendingMode: .withinWindow, emphasized: false)
         // .background(.ultraThinMaterial)
         // .background(VisualEffectView())
      }
   }
}
/**
 * - Fixme: ⚠️️ how does this work?
 */
struct OverlayView: View {
   var body: some View {
      EmptyView()
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 400, height: 200)) {
   DebugHeaderView()
}
#endif
