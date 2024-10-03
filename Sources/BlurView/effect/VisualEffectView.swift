#if os(macOS)
import SwiftUI
/**
 * Represents a SwiftUI view that wraps an NSVisualEffectView for macOS.
 * - Description: This view is designed to apply visual effects to its background, such as blurring or darkening, to create a visually appealing and modern look.
 * - Note: This view is macOS-specific and may not be used in other platforms.
 * - Note: old ref: https://github.com/lukakerr/NSWindowStyles
 * - Note: there is also `EffectView` and `VisualEffectBackground`
 * - Fixme: ⚠️️ mark as debug only? and macOS at the same time?
 * - Fixme: ⚠️️ is this not used anywhere?
 */
public struct VisualEffectView: NSViewRepresentable {
   /**
    * Creates and configures a new NSVisualEffectView instance.
    * - Description: This method initializes a new instance of NSVisualEffectView and sets its properties based on the context provided.
    * - Parameters:
    *   - context: The context containing the coordinator and other necessary information for creating the NSVisualEffectView.
    * - Returns: The configured NSVisualEffectView instance.
    */
   public func makeNSView(context: Context) -> NSVisualEffectView {
      let view = NSVisualEffectView()
      view.blendingMode = .withinWindow // Sets the blending mode to within the window
      view.isEmphasized = false // Sets the emphasized state to false
      view.material = .popover // Sets the material to popover
      return view
   }
   /**
    * Reactivve update
    * - Description: Updates the NSVisualEffectView with the latest state from the context.
    * - Parameters:
    *   - nsView: The NSVisualEffectView to be updated.
    *   - context: The context containing the latest state.
    */
   public func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
#endif
