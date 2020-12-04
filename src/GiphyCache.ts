import { NativeModules } from 'react-native';
const { RNGiphyCache } = NativeModules;

class GiphyCache {
  static setDiskCacheByteLimit(limit: number) {
    RNGiphyCache.setDiskCacheByteLimit(limit);
  }

  static downloadAssetData(
    url: string
  ): Promise<{
    width: number;
    height: number;
    data: string;
  }> {
    return RNGiphyCache.downloadAssetData(url);
  }
}

export default GiphyCache;
