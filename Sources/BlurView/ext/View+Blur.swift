import SwiftUI
/**
 * Translucent bg ext
 * - Description: This extension provides a method to add a translucent
 *                underlay to any SwiftUI view. It is primarily used to create a
 *                blurred background effect for the lock screen view during user
 *                authentication.
 * - Remark: Cover mainview while authenticating user
 * - Note: Ref window code: https://www.bignerdranch.com/blog/intro-to-nswindow/
 * - Note: Ref vibrancy: https://github.com/lukakerr/NSWindowStyles (awesome overview of window styles)
 * - Note: More window stuff: https://www.albertopasca.it/whiletrue/swift-macos-how-to-make-cool-desktop-apps-using-cocoa/
 * - Fixme: ⚠️️ attach this to some general shape protocol instead of view?
 */
extension View {
   /**
    * Adds translucent underlay (iOS and macOS)
    * - Description: This function adds a translucent underlay to the view it is
    *                applied to. It is primarily used to create a blurred
    *                background effect for the lock screen view during user
    *                authentication. The function adjusts its behavior based on
    *                the operating system, applying different visual effects for
    *                iOS and macOS.
    * - Note: How to add blur view: https://github.com/sentryco/Sentry/issues/918
    * - Fixme: ⚠️️⚠️️ Try the legacy effectview as well, it might have nicer saturated black translucent etc
    * - Fixme: ⚠️️ Add full example for this in readme
    * - Fixme: ⚠️️ Add more customization in the method params
    * - Fixme: ⚠️️ maybe let the caller set shouldIgnoreSafeArea? that removes the need for viewbuilder etc
    * ## Examples:
    * let color = Color(light: Color.white.opacity(0.1), dark: Color.black.opacity(0.6))
    * let rectangle = Rectangle().fill(.clear)
    * rectangle.translucentUnderlay(overlayColor: color)
    */
   @ViewBuilder public func translucentUnderlay(overlayColor: Color, shouldIgnoreSafeArea: Bool = true) -> some View {
      let view = self
      // .fill() // ⚠️️ was using: .fill(Color.black.opacity(0.6))
         .overlay(overlayColor) // mixin dark transperancy etc
         #if os(iOS)
         .background(.ultraThinMaterial).opacity(1.0) // ultraThickMaterial, ultraThinMaterial, thinMaterial, thickMaterial, regularMaterial
         #elseif os(macOS)
         .visualEffect( // Adds visual effect to the view
            material: .hudWindow, // Material type for the visual effect
            blendingMode: .withinWindow, // Blending mode for the visual effect
            emphasized: false // Whether the effect is emphasized
         )
         #endif
         .frame( // Set frame to fill maximum width and height of the parent view
            maxWidth: .infinity, // Set the maximum width to fill the available space
            maxHeight: .infinity // Set the maximum height to fill the available space
         )
      if shouldIgnoreSafeArea {
         view.ignoresSafeArea() // Ignore safe area insets for this view
      } else {
         view
      }
   }
}
