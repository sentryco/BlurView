#if DEBUG && os(macOS)
import SwiftUI
/**
 * Note: Only for macOS
 * - Description: DebugHeaderView is a SwiftUI View component used for displaying a debug header.  It consists of a ZStack with a clear rectangle as the background, a pink rectangle box,  and an overlay rectangle with visual effects. This component is primarily used for debugging purposes.
 * - Important: ⚠️️ If we use .hudWindow as material in visualEffect. We dont need underlay to match seem etc
 * - Important: ⚠️️ Adding Material in background like regularMaterial etc. We dont need underlay to avoid seems.
 * - Important: ⚠️️ There is less seem. If we add material to underlay. esp for light apperance mode
 * - Important: ⚠️️ To remove all seems for macOS for all translusent types. The current workaround is to use inset a rectangle in the background. iOs doesnt need this, as it can use the tinted blur view from this kit
 * - Important: ⚠️️ It doesnt seem possible to make translucent materil transperant. adding opacity disable translucency
 * - Note: Best practice I think would be to use Material in a background() as both mac and ios has the same api. it requires the background color to be the native OS background color. But thats a limitation for the other solutions as well. unless we digg into legacy and figure out how to make custom background colors work
 * - Fixme: ⚠️️ add the workaround in the example bello to the debugview
 * ## Examplea:
 * // ⚠️️ Seems we can also just do: padding(.top) here
 * Rectangle() // the current workaround for seemless translucent views for macOS
 *    .inset(by: spacerHeight)
 *    .fill(Material.ultraThinMaterial)
 *    .alignmentGuide(.top) { _ in spacerHeight }
 * ) // add translucent background here
 */
struct DebugHeaderView: View {
   /**
    * - Important: ⚠️️ It seems best to leave the background color to be decided by the operating system. It matches better with the translucent tint. Custom background colors creates more visible seems.
    * - Fixme: ⚠️️ Look into how this was done in legacy. Legacy supported any custom background color I think.
    * - Fixme: ⚠️️ To avoid seems we can add an underlay that does not cover the overlay area?
    */
   var body: some View {
      ZStack(alignment: .top) {
         // Background()
         Underlay()
         // Graphic()
         Overlay()
      }
      
   }
}
/**
 * Background
 */
//struct Background: View {
//   var body: some View {
//      Rectangle()
//         .fill(Color.black.opacity(1))
//         .frame(width: .infinity, height: .infinity)
//   }
//}
/**
 * Underlay
 * - Important: ⚠️️ This tints the background to the same tint that the translucent cover produces. So that there is near no visible seem between cover and background
 */
struct Underlay: View {
   var body: some View {
      Rectangle()
         .fill(Color.clear.opacity(1))
         .frame(width: .infinity, height: .infinity)
//         .visualEffect(material: .hudWindow, blendingMode: .withinWindow, emphasized: false)
//         .background(.ultraThickMaterial) // A mostly opaque material.
//         .background(.thickMaterial) // A material that's more opaque than translucent.
//         .background(.regularMaterial) // A material that's somewhat translucent.
//         .background(.thinMaterial) // A material that's more translucent than opaque.
//         .background(.ultraThinMaterial) // A mostly translucent material.
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
         .fill(.clear) // also works: .foregroundColor(.clear)
         .frame(width: .infinity, height: 80, alignment: .top)
//       .presentationBackground(.ultraThinMaterial)
      // .background(.gray.opacity(1))
//         .visualEffect(material: .hudWindow, blendingMode: .withinWindow, emphasized: false)
      // .background(VisualEffectView())
//         .background(.ultraThickMaterial) // A mostly opaque material.
//         .background(.thickMaterial) // A material that's more opaque than translucent.
//         .background(.regularMaterial) // A material that's somewhat translucent.
//         .background(.thinMaterial) // A material that's more translucent than opaque.
         .background(.ultraThinMaterial)
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 400, height: 200)) {
   DebugHeaderView()
//      .environment(\.colorScheme, .light) // dark / light
}
#endif
