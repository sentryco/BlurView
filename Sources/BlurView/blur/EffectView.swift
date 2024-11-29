#if os(iOS) // - Fixme: ⚠️️ hopefully this covers ipad as well
import SwiftUI
import UIKit
/**
 * "Translucent-visual-effect-view" (Only for iOS)
 * - Description: This class provides a SwiftUI view that applies a visual effect, such as a blur, to its background. It is primarily used to create a more immersive and dynamic user interface on iOS devices.
 * - Note: Used in `Blur` and `PageControllerView`
 * - Fixme: ⚠️️ look for more modern variations of this code etc
 * - Fixme: ⚠️️ Make this a view-modifier? 👈 add reasoning
 * - Fixme: ⚠️️ Add preview, test in iOS etc
 */
public final class EffectView: UIVisualEffectView {
   /**
    * The color used for tinting the effect view
    * - Description: The tinting color is used to modify the hue of the visual effect applied to the view. This allows for customization of the visual effect to better match the overall design theme of the application.
    */
   let tintingColor: UIColor
   /**
    * Initializes a new instance of the `EffectView` class with the specified visual effect and tinting color.
    * - Description: This initializer creates an instance of the `EffectView` class. It takes an optional visual effect and a tinting color as parameters. If no visual effect is provided, a regular blur effect is used by default. The tinting color is used to modify the hue of the visual effect, allowing for customization of the visual effect to better match the overall design theme of the application.
    * - Parameters:
    *   - effect: The visual effect to apply to the view. If `nil`, a regular blur effect is used.
    *   - tintingColor: The color used for tinting the effect view.
    */
   public init(effect: UIVisualEffect? = nil, tintingColor: UIColor) {
      self.tintingColor = tintingColor // Set the tinting color to the specified value
      let effect = effect ?? UIBlurEffect(style: .regular) // If the effect is nil, use a regular blur effect
      super.init(effect: effect) // Call the superclass's designated initializer with the specified effect
      self.backgroundColor = .clear // Set the background color to clear
      // Fixme: ⚠️️ Determine if setting the background color to clear is necessary
   }
   /**
    * Boilerplate
    */
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Helpers
 */
extension EffectView {
   /**
    * Resets the highlight color of the effect view when the app is launched again
    * - Description: This is necessary because the highlight color may still be visible if the app was terminated while the effect view was highlighted.
    * - Note: This is a hacky solution and may not work in all cases
    * - Fixme: ⚠️️ Determine if there is a better way to reset the highlight color
    */
   override public func layoutSubviews() {
      clearHighlight() // Call the `clearHighlight` method to reset the highlight color of the effect view
   }
   /**
    * Clears the highlight color of the effect view by setting the background color of the `_UIVisualEffectSubview` subview to the tinting color.
    * - Description: This method ensures that the visual effect view does not retain any residual visual state from previous interactions. It is particularly useful for maintaining a consistent appearance when the effect view is reused or when the app transitions between background and foreground states.
    * - Fixme: ⚠️️ Determine if this method is necessary or if there is a better way to reset the highlight color.
    */
   fileprivate func clearHighlight() {
      if let vfxSubView = self.subviews.first(where: { // Retrieves the first subview of type '_UIVisualEffectSubview'
         String(describing: type(of: $0)) == "_UIVisualEffectSubview" // Find the first subview that is of type "_UIVisualEffectSubview"
      }) {
         vfxSubView.backgroundColor = tintingColor // Set the background color of the subview to the tinting color
      }
   }
}
/**
 * Preview
 * - Description: This section provides a preview of the `EffectView` in a SwiftUI context. It demonstrates how the `EffectView` can be used within a SwiftUI view hierarchy, showcasing the application of the specified tinting color to the effect view. The preview is configured to fit the size of the content and includes padding for better visibility.
 * - Fixme: ⚠️️ Improve this prevew, see the BlurView for macOS, it has a better preview structure etc
 */
struct EffectViewRepresentable: UIViewRepresentable {
   /**
    * The tinting color for the effect view.
    * - Description: The color used to tint the visual effect view. This color influences the overall appearance of the blur effect, allowing customization to match the app's design theme.
    */
   let tintingColor: UIColor
   /**
    * Creates and configures a new instance of the `EffectView` class with the specified tinting color.
    * - Description: This method initializes an `EffectView` with the provided tinting color, which will be used to tint the visual effect applied to the view. The `EffectView` is a custom UIView subclass that supports tinting of the blur effect, allowing for a more customized appearance in the app's user interface.
    * - Parameter context: The context containing the coordinator and other necessary information for creating the `EffectView`.
    * - Returns: The configured `EffectView` instance with the specified tinting color.
    */
   func makeUIView(context: Context) -> EffectView {
      // Initializes and returns an EffectView instance with the specified tintingColor
      EffectView(tintingColor: tintingColor)
   }
   /**
    * Updates the UIView with the specified context.
    * - Description: This method is a placeholder for future implementation. It is intended to update the `EffectView` with new context information, such as changes in the environment or updates to the view's properties. Currently, it does nothing, but it can be implemented to handle specific updates as needed.
    * - Fixme: ⚠️️ implement this later?
    * - Parameters:
    *   - uiView: The UIView to update.
    *   - context: The context containing the coordinator and other necessary information for updating the UIView.
    */
   func updateUIView(_ uiView: EffectView, context: Context) {
      // Update the view if necessary
   }
}
/**
 * - Description: This preview demonstrates the `EffectView` with a gray tinting color applied. It allows developers to see how the `EffectView` will render within a SwiftUI view hierarchy and adjust the tinting color as needed for their specific design requirements.
 * - Fixme: ⚠️️ It doesn't show the effect, fix that
 */
#Preview {
   EffectViewRepresentable(tintingColor: .gray)
//      .previewLayout(.sizeThatFits)
      .padding()
}
#endif
