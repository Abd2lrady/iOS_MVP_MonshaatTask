// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct Colors {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#dde3e8"></span>
  /// Alpha: 100% <br/> (0xdde3e8ff)
  internal static let activityColor = Colors(rgbaValue: 0xdde3e8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let availabilityBorder = Colors(rgbaValue: 0xffffffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#788995"></span>
  /// Alpha: 100% <br/> (0x788995ff)
  internal static let availabilityOffline = Colors(rgbaValue: 0x788995ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e13636"></span>
  /// Alpha: 100% <br/> (0xe13636ff)
  internal static let availabilityOfflineLabel = Colors(rgbaValue: 0xe13636ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5cb466"></span>
  /// Alpha: 100% <br/> (0x5cb466ff)
  internal static let availabilityOnline = Colors(rgbaValue: 0x5cb466ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5cb466"></span>
  /// Alpha: 100% <br/> (0x5cb466ff)
  internal static let availabilityOnlineLabel = Colors(rgbaValue: 0x5cb466ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#9498a1"></span>
  /// Alpha: 100% <br/> (0x9498a1ff)
  internal static let bookingSheetKSATimeZone = Colors(rgbaValue: 0x9498a1ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a6ddf9"></span>
  /// Alpha: 100% <br/> (0xa6ddf9ff)
  internal static let headerBullet = Colors(rgbaValue: 0xa6ddf9ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f5f6fb"></span>
  /// Alpha: 100% <br/> (0xf5f6fbff)
  internal static let listScreenBackground = Colors(rgbaValue: 0xf5f6fbff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#314d6c"></span>
  /// Alpha: 100% <br/> (0x314d6cff)
  internal static let nameLabel = Colors(rgbaValue: 0x314d6cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4a4a4a"></span>
  /// Alpha: 100% <br/> (0x4a4a4aff)
  internal static let noInternetLabel = Colors(rgbaValue: 0x4a4a4aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f5f6fb"></span>
  /// Alpha: 100% <br/> (0xf5f6fbff)
  internal static let noInternetViewBg = Colors(rgbaValue: 0xf5f6fbff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#dde3e8"></span>
  /// Alpha: 100% <br/> (0xdde3e8ff)
  internal static let profileImgBorder = Colors(rgbaValue: 0xdde3e8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#314d6c"></span>
  /// Alpha: 100% <br/> (0x314d6cff)
  internal static let profileScreenAboutHeaders = Colors(rgbaValue: 0x314d6cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#65717a"></span>
  /// Alpha: 100% <br/> (0x65717aff)
  internal static let profileScreenAboutLabel = Colors(rgbaValue: 0x65717aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#dde3e8"></span>
  /// Alpha: 100% <br/> (0xdde3e8ff)
  internal static let profileScreenAppoinment = Colors(rgbaValue: 0xdde3e8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f3f4fa"></span>
  /// Alpha: 100% <br/> (0xf3f4faff)
  internal static let profileScreenBackground = Colors(rgbaValue: 0xf3f4faff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3084b2"></span>
  /// Alpha: 100% <br/> (0x3084b2ff)
  internal static let profileScreenBookButton = Colors(rgbaValue: 0x3084b2ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let profileScreenBookButtonLabel = Colors(rgbaValue: 0xffffffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#717781"></span>
  /// Alpha: 100% <br/> (0x717781ff)
  internal static let profileScreenInterestLabel = Colors(rgbaValue: 0x717781ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5cb466"></span>
  /// Alpha: 100% <br/> (0x5cb466ff)
  internal static let profileScreenListRequestSession = Colors(rgbaValue: 0x5cb466ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#314d6c"></span>
  /// Alpha: 100% <br/> (0x314d6cff)
  internal static let profileScreenListSession = Colors(rgbaValue: 0x314d6cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#717781"></span>
  /// Alpha: 100% <br/> (0x717781ff)
  internal static let profileScreenListUpdate = Colors(rgbaValue: 0x717781ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#314d6c"></span>
  /// Alpha: 100% <br/> (0x314d6cff)
  internal static let profileScreenNameLabel = Colors(rgbaValue: 0x314d6cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let profileScreenNotificationButtonLabel = Colors(rgbaValue: 0xffffffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#007498"></span>
  /// Alpha: 100% <br/> (0x007498ff)
  internal static let profileScreenRateLabel = Colors(rgbaValue: 0x007498ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3084b2"></span>
  /// Alpha: 100% <br/> (0x3084b2ff)
  internal static let profileScreenSegmentSelected = Colors(rgbaValue: 0x3084b2ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#9498a1"></span>
  /// Alpha: 100% <br/> (0x9498a1ff)
  internal static let profileScreenSegmentUnselected = Colors(rgbaValue: 0x9498a1ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3084b2"></span>
  /// Alpha: 100% <br/> (0x3084b2ff)
  internal static let profileScreenSendMsgButton = Colors(rgbaValue: 0x3084b2ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#314d6c"></span>
  /// Alpha: 100% <br/> (0x314d6cff)
  internal static let profileScreenSessionDate = Colors(rgbaValue: 0x314d6cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#314d6c"></span>
  /// Alpha: 100% <br/> (0x314d6cff)
  internal static let profileScreenSpecialityLabel = Colors(rgbaValue: 0x314d6cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#788995"></span>
  /// Alpha: 100% <br/> (0x788995ff)
  internal static let specializationLabel = Colors(rgbaValue: 0x788995ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3084b2"></span>
  /// Alpha: 100% <br/> (0x3084b2ff)
  internal static let tryAgainButtonBg = Colors(rgbaValue: 0x3084b2ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let tryAgainButtonTitle = Colors(rgbaValue: 0xffffffff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: Colors) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
