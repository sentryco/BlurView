#if os(macOS)
import SwiftUI
import Cocoa
/**
 * This file contains a SwiftUI view that applies visual effects to its background.
 * - Description: This file contains a SwiftUI view that applies visual effects to its background. It provides a way to create a blurred or vibrancy effect on the background of a view. It's primarily used to create a more immersive and dynamic user interface.
 * - Note: ref: https://developer.apple.com/forums/thread/125183
 * - Note: there is also (has better window suppoert etc): https://github.com/DominatorVbN/TranslucentWindowStyle
 * - Note: very simple window support: https://zachwaugh.com/posts/swiftui-blurred-window-background-macos
 * - Fixme: ⚠️️ mark as debug only? figure out how to make debug and macos?
 * - Fixme: ⚠️️ is this used anywhere?
 */
fileprivate struct VisualEffectMaterialKey: EnvironmentKey {
   /**
    * The type of the value stored by this key, which is an optional `NSVisualEffectView.Material`.
    * - Description: This type alias represents the type of value stored by the VisualEffectMaterialKey. It is an optional NSVisualEffectView.Material, which defines the material used for the visual effect view. The material determines the appearance of the view, such as its color and how it blurs the content behind it.
    */
   typealias Value = NSVisualEffectView.Material?
   /**
    * The default value of this key, which is `nil`.
    * - Description: This is the default value for the VisualEffectMaterialKey. If no specific material is set for the visual effect, this value will be used. It is currently set to nil, meaning no material effect will be applied by default.
    */
   static var defaultValue: Value = nil
}
/**
 * Represents a key for accessing the blending mode of a visual effect in the environment.
 * This key is used to store and retrieve the blending mode of a visual effect view in the SwiftUI environment.
 * - Description: This key is used to store and retrieve the blending mode of a visual effect view in the SwiftUI environment. The blending mode determines how the visual effect view blends its content with the background.
 * - Note: The blending mode determines how the visual effect view blends its content with the background.
 */
fileprivate struct VisualEffectBlendingKey: EnvironmentKey {
   /**
    * The type of the value stored by this key, which is an optional `NSVisualEffectView.BlendingMode`.
    * - Description: This type alias represents the type of value stored by the VisualEffectBlendingKey. It is an optional NSVisualEffectView.BlendingMode, which defines the blending mode used for the visual effect view. The blending mode determines how the visual effect view blends its content with the background.
    */
   typealias Value = NSVisualEffectView.BlendingMode?
   /**
    * The default value of this key, which is `nil`.
    * - Description: This is the default value for the VisualEffectBlendingKey. If no specific blending mode is set for the visual effect, this value will be used. It is currently set to nil, meaning no blending mode will be applied by default.
    */
   static var defaultValue: Value = nil
}
/**
 * Represents a key for accessing the emphasized state of a visual effect in the environment.
 * This key is used to store and retrieve the emphasized state of a visual effect view in the SwiftUI environment.
 * - Description: This key is used to store and retrieve the emphasized state of a visual effect view in the SwiftUI environment. The emphasized state indicates whether the visual effect should be more prominent, typically making it appear more vibrant or pronounced.
 */
fileprivate struct VisualEffectEmphasizedKey: EnvironmentKey {
   /**
    * The type of the value stored by this key, which is an optional `Bool`.
    * - Description: This property represents whether the visual effect view should emphasize the appearance of the material, often by increasing vibrancy or contrast to make it stand out more against the background.
    */
   typealias Value = Bool?
   /**
    * The default value of this key, which is `nil`.
    * - Description: This property represents the default value for the emphasized state of a visual effect view in the SwiftUI environment. When `nil`, it indicates that no specific emphasis is applied, allowing the view to use the standard appearance of the material.
    */
   static var defaultValue: Bool?
}
/**
 * Extends the `EnvironmentValues` type to provide access to the visual effect keys.
 */
extension EnvironmentValues {
   /**
    * Accessor for the visual effect material stored in the environment.
    * - Description: This property is used to get or set the visual effect material in the SwiftUI environment. The visual effect material determines the appearance of the view, such as its color and how it blurs the content behind it.
    */
   fileprivate var visualEffectMaterial: NSVisualEffectView.Material? {
      get { self[VisualEffectMaterialKey.self] }
      set { self[VisualEffectMaterialKey.self] = newValue }
   }
   /**
    * Accessor for the visual effect blending mode stored in the environment.
    * - Description: This property is used to get or set the visual effect blending mode in the SwiftUI environment. The blending mode determines how the visual effect view blends its content with the background.
    */
   fileprivate var visualEffectBlending: NSVisualEffectView.BlendingMode? {
      get { self[VisualEffectBlendingKey.self] }
      set { self[VisualEffectBlendingKey.self] = newValue }
   }
   /**
    * Accessor for the visual effect emphasized state stored in the environment.
    * - Description: This property is used to get or set the visual effect emphasized state in the SwiftUI environment. The emphasized state determines whether the visual effect view has a vibrant appearance.
    */
   fileprivate var visualEffectEmphasized: Bool? {
      get { self[VisualEffectEmphasizedKey.self] }
      set { self[VisualEffectEmphasizedKey.self] = newValue }
   }
}
/**
 * This struct represents a SwiftUI view that applies visual effects to its background.
 * - Fixme: ⚠️️ brak this into many files?
 */
fileprivate struct VisualEffectBackground: NSViewRepresentable {
   /**
    * The material of the visual effect view.
    * - Description: Specifies the material to be used by the NSVisualEffectView, which determines the appearance of the view's background, such as its translucency and blur style.
    */
   private let material: NSVisualEffectView.Material
   /**
    * The blending mode of the visual effect view.
    * - Description: Specifies the blending mode to be used by the NSVisualEffectView, which determines how the view's content blends with its background.
    */
   private let blendingMode: NSVisualEffectView.BlendingMode
   /**
    * The emphasized state of the visual effect view.
    * - Description: Indicates whether the visual effect view should use an emphasized material appearance, which typically results in a more vibrant and prominent look.
    */
   private let isEmphasized: Bool
   /**
    * Initializes a new instance of the `VisualEffectBackground` struct with the specified material, blending mode, and emphasized state.
    * - Description: This initializer creates a new instance of the `VisualEffectBackground` struct with the specified material, blending mode, and emphasized state. The material determines the appearance of the view's background, such as its translucency and blur style. The blending mode determines how the visual effect view blends its content with the background. The emphasized state indicates whether the visual effect view should use an emphasized material appearance, which typically results in a more vibrant and prominent look.
    * - Parameters:
    *   - material: The material of the visual effect view.
    *   - blendingMode: The blending mode of the visual effect view.
    *   - emphasized: The emphasized state of the visual effect view.
    */
   fileprivate init(
      material: NSVisualEffectView.Material,
      blendingMode: NSVisualEffectView.BlendingMode,
      emphasized: Bool) {
         self.material = material // Assign the material to the instance variable
         self.blendingMode = blendingMode // Assign the blending mode to the instance variable
         self.isEmphasized = emphasized // Assign the emphasized state to the instance variable
      }
   /**
    * Creates a new NSVisualEffectView and returns it.
    * - Description: This function creates and returns a new NSVisualEffectView instance. The view is configured to automatically adjust its width and height to match its superview.
    */
   func makeNSView(context: Context) -> NSVisualEffectView {
      let view = NSVisualEffectView() // Initializes a new instance of NSVisualEffectView
      // fixme: Not certain how necessary this is
      view.autoresizingMask = [.width, .height] // Sets the autoresizing mask to adjust width and height automatically
      return view
   }
   /**
    * Updates the NSVisualEffectView with the environment's visual effect material, blending mode, and emphasized state.
    * - Description: Configures the NSVisualEffectView with the current environment settings or uses the default values provided during initialization. This ensures that the visual effect view reflects the latest state of the environment, such as theme changes or other visual effect preferences.
    */
   func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
      nsView.material = context.environment.visualEffectMaterial ?? material // Updates the material of the NSVisualEffectView
      nsView.blendingMode = context.environment.visualEffectBlending ?? blendingMode // Updates the blending mode of the NSVisualEffectView
      nsView.isEmphasized = context.environment.visualEffectEmphasized ?? isEmphasized // Updates the emphasized state of the NSVisualEffectView
   }
}
/**
 * Convenient
 */
extension View {
   /**
    * Creates a visual effect view with the specified material, blending mode, and emphasized state.
    * - Description: Applies a visual effect to the background of the view using the specified material, blending mode, and emphasis. This can enhance the visual hierarchy of the interface by providing a sense of depth or focus.
    * - Important: ⚠️️ Used to debug only for now
    * - Parameters:
    *   - material: The material of the visual effect view.
    *   - blendingMode: The blending mode of the visual effect view.
    *   - emphasized: The emphasized state of the visual effect view.
    * - Returns: A view with the attached visual effect.
    */
   public func visualEffect(
      material: NSVisualEffectView.Material,
      blendingMode: NSVisualEffectView.BlendingMode = .behindWindow,
      emphasized: Bool = false
   ) -> some View {
      background(
         VisualEffectBackground( // This line initializes a VisualEffectBackground with specified material, blending mode, and emphasized state.
            material: material, // The material of the visual effect view.
            blendingMode: blendingMode, // The blending mode of the visual effect view.
            emphasized: emphasized // The emphasized state of the visual effect view.
         )
      )
   }
}
#endif
