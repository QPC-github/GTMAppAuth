/*
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

@objc(GTMKeychainAttribute)
public final class KeychainAttribute: NSObject {
  public enum Attribute {
    case useDataProtectionKeychain
    case accessGroup(String)

    public var keyName: String {
      switch self {
      case .useDataProtectionKeychain:
        return "kSecUseDataProtectionKeychain"
      case .accessGroup:
        return "kSecKeychainAccessGroup"
      }
    }
  }

  public let attribute: Attribute

  public init(attribute: Attribute) {
    self.attribute = attribute
  }

  @available(macOS 10.15, *)
  @objc public static let useDataProtectionKeychain = KeychainAttribute(
    attribute: .useDataProtectionKeychain
  )

  @objc public static func keychainAccessGroup(name: String) -> KeychainAttribute {
    return KeychainAttribute(attribute: .accessGroup(name))
  }
}