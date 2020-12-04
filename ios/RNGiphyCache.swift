//
//  GiphyCache.swift
//  GiphyUi
//
//  Created by Jesse Onolememen on 27/03/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import GiphyCoreSDK
import GiphyUISDK

@objc(RNGiphyCache)
class RNGiphyCache: NSObject {
  @objc func setDiskCacheByteLimit(_ limit: Int) {
    GPHCache.shared.diskCacheByteLimit = UInt(limit)
  }

  @objc func clear() {
    GPHCache.shared.clear()
  }

  @objc func downloadAssetData(_ url: String, resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
    GPHCache.shared.downloadAsset(url) { (image, error) in
      if let image = image, let data = image.pngData() {
        resolve([
          "data": data.base64EncodedString(),
          "width": image.size.width,
          "height": image.size.height,
        ])
      } else {
        reject("GiphyCacheDownloadAssetError", error?.localizedDescription, error)
      }
    }
  }

  @objc static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
